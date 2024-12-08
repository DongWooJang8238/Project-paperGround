  function toggleSubMenu(id) {
      const submenu = document.getElementById(id);
      const chevron = submenu.previousElementSibling.querySelector('.bx-chevron-down');
      if (submenu.style.display === 'block') {
        submenu.style.display = 'none';
        chevron.classList.remove('rotate');
      } else {
        submenu.style.display = 'block';
        chevron.classList.add('rotate');
      }
    }
  
  document.querySelectorAll(".sidebar a").forEach(a => {
		a.addEventListener('click', e=>{
			e.preventDefault();
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
			}else if(a.id === "UD"){
				location.href = menu;
			}
			
		});
	});
