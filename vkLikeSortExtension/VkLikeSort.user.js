// ==UserScript==
// @name			Vk Like Sort
// @description		Sorting posts of a wall at vk.com depending on quantity of likes 
// @author			Konstantin Ostrikov
// @version			0.3.1
// @license			MIT
// @run-at          document-start
// @grant           GM_getValue
// @grant           GM_setValue
// @grant           GM_deleteValue
// @grant           GM_openInTab
// @grant           GM_xmlhttpRequest
// @grant           unsafeWindow
// @include         http://vk.com/*
// @require			http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js
// ==/UserScript==

/*function readProperty(property, defValue){
  if(localStorage[property] == null)
  {
    return defValue;
  }
  return localStorage[property];
}*/


function sort(){
  //var like_mod = localStorage.getItem("sort_by);
//var like_mod = readProperty("sort_by", 0);
  var like_mod = 0;
  var list = [].slice.call(document.getElementsByClassName("post"));
  if (list.length==0){
	  list = document.getElementsByClassName("fw_reply"); //specially for AKB
	  like_mod = 3;
  }
  var likes = [];
  switch (like_mod){
	  case 1: var sorting_element = "post_share_count"; break //by reposts
	  case 2: var sorting_element = "wrh_text"; break //by comments
	  case 3: var sorting_element = "like_count"; break //replies by likes 
	  default: var sorting_element = "post_like_count"; break //by likes
  }
  if (like_mod!=2)
	  for (var i=0; i<list.length; i++){
		likes[i] = parseInt(document.getElementsByClassName(sorting_element)[i].innerHTML) || 0;
	  }
  else
	  for (var i=0; i<list.length; i++){
		//likes[i] = Math.max($("div.reply", list[i]).length, parseInt($(sorting_element, list[i]).text().match(/\d+/g)) || 0);
		likes[i] = parseInt(document.getElementsByClassName(sorting_element)[i].innerHTML.match(/\d+/g)) || 0;
	  }
//Shell sort
  var i,j,t,k,x,y,N=likes.length;
  gap = [1, 4, 10, 23, 57, 132, 301, 701, 1750, 4567, 11211, 27519];
  for (t=0; gap[t]*2<N; t++){};
  for (k = t; k>=0; k--){
	  for (i = gap[k]; i<N; i++){
		x = likes[i];
		y = list[i];
		for(j = i; j>=gap[k]; j-=gap[k]){
			if (x > likes[j-gap[k]]){
				likes[j] = likes[j-gap[k]];
				list[j] = list[j-gap[k]];
			  }
			  else
				break;
			}
		likes[j] = x;
		list[j] = y; 
	   }
   }
	var listParent;
	list[0].parentNode==list[1].parentNode ? listParent=list[0].parentNode : listParent=list[2].parentNode;
	for (i=N-1; i>0; i--){
		listParent.insertBefore(list[i-1],list[i]);
	}
}

function addEvent(elem, type, handler){
  if (elem.addEventListener){
    elem.addEventListener(type, handler, false)
  } else {
    elem.attachEvent("on"+type, handler)
  }
}

function fn(){
//'use strict';
	invite = document.getElementById("top_invite_link");
	if (invite!=null) {
		invite.removeAttribute("href");
		invite.removeAttribute("ontouchstart");
		invite.removeAttribute("onmousedown");
		invite.textContent = "sort";
		addEvent(invite, 'click', sort);
	}
}

(function(scriptStorage) {
	if (document.readyState != 'loading'){
		fn();
	}else{
    document.addEventListener('DOMContentLoaded', fn);
	}
})(window.opera && window.opera.scriptStorage);