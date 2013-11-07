function show(id) {
	document.getElementById(id).style.display = 'block';
}

function hideAll() {
	var items = document.getElementsByClassName("term-list");
	for (var i in items) {
		if (items[i].id != null) items[i].style.display = 'none';
	}
}
