function main(){
  paywall = document.getElementsByClassName("lsp-overlay").item(0);
  paywall.remove();
}


if (document.readyState != 'loading'){
	main();
}else{
	document.addEventListener('DOMContentLoaded', main);
}