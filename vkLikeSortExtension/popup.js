$(function(){
  $("AZAZA").click(function(){
	var list = $("div.post");
	var likes = [];
	for (var i=0; i<list.length; i++){
	  likes[i] = parseInt($("span.post_like_count.fl_l", list[i]).text()) || 0;
	}
  
  //insertion sort
	var i,j,x,y;

	for (i = 1; i<likes.length; i++){
	  x = likes[i];
      y = list[i];
      j=i;
      while ((j>0)&&(likes[j-1]<x)){
          likes[j] = likes[j-1];
          list[j] = list[j-1];
          j--;
      }
      likes[j] = x;
      list[j] = y;
      $(list[j+1]).before($(list[j])); 
    } 
  }
}