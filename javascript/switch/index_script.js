function switchDisplay(one, two){
	var arr = [one, two];
	for (var i =0 ; i < arr.length; i++){
		changeDisplay(arr[i]);
	}
}

function changeDisplay(id){
	var elem = document.getElementById(id);
	elem.style.display = elem.style.display == "none"?"block":"none";
}

