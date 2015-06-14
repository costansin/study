function readProperty(property, defValue){
  if(localStorage[property] == null)
  {
    return defValue;
  }
  return localStorage[property];
}

function sort(){
  //var like_mod = localStorage.getItem("sort_by);
  var like_mod = readProperty("sort_by", 0);
  var list = $("div.post");
  if (list.length==0){
	  list = $("div.fw_reply"); //specially for AKB
	  like_mod = 3;
  }
  var likes = [];
  switch (like_mod){
	  case 1: var sorting_element = "span.post_share_count.fl_l"; break //by reposts
	  case 2: var sorting_element = "div.wrh_text"; break //by comments
	  case 3: var sorting_element = "span.like_count.fl_l"; break //replies by likes 
	  default: var sorting_element = "span.post_like_count.fl_l"; break //by likes
  }
  if (like_mod!=2)
	  for (var i=0; i<list.length; i++){
		likes[i] = parseInt($(sorting_element, list[i]).text()) || 0;
	  }
  else
	  for (var i=0; i<list.length; i++){
		likes[i] = Math.max($("div.reply", list[i]).length, parseInt($(sorting_element, list[i]).text().match(/\d+/g)) || 0);
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
   for (i=0; i<N-1; i++){
		$(list[i]).after($(list[i+1]));
   }
}


/*//for js without jQuery version
function addEvent(elem, type, handler){
  if (elem.addEventListener){
    elem.addEventListener(type, handler, false)
  } else {
    elem.attachEvent("on"+type, handler)
  }
}*/

$(function(){
	invite = $("#top_invite_link");
	invite.removeAttr("href");
	invite.removeAttr("ontouchstart");
	invite.removeAttr("onmousedown");
	invite.text("sort"); 
	invite.on('click', sort);
	/*invite = document.getElementById("top_invite_link"); //invite[0]
	//invite.outerHTML = '<a class="top_nav_link" id="top_invite_link">sort</a>';		
	addEvent(invite, 'click', sort);*/
});