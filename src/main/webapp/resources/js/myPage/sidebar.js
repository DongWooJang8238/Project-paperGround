
console.log(1);
/*-------------- 사이드바  이벤트 핸들러------*/
document.querySelectorAll(".sidebar a").forEach(a => {
	a.addEventListener('click', e=>{
		e.preventDefault();
//		console.log(a);
		console.log(a.id);
		let menu = a.getAttribute('href');
		if(a.id === "checkPage"){
			location.href = menu;
		}else if(a.id === "myOrder"){
			location.href = menu;
		}else if(a.id === "myPoint"){
			location.href = menu;
		}else if(a.id === "myCP"){
			location.href = menu;
		}else if(a.id === "myLB"){
			location.href = menu;
		}else if(a.id === "directReport"){
			console.log('미구현');
//			location.href = menu;
		}
		
	});
});

/*-------------- 사이드바 ------*/
function toggleSubMenu(id) {
	var subMenu = document.getElementById(id);
	if (subMenu.style.display === "block") {
		subMenu.style.display = "none";
	} else {
		subMenu.style.display = "block";
	}
}




