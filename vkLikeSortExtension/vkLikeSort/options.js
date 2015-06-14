(function(scriptStorage) {
	sb = getElementsByName("sort_by");
	sb.addEventListener('click', 
		chrome.storage.sync.set({"sort_by": sb.value})
		)
})