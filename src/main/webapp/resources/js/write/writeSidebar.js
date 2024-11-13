document.querySelectorAll('.left-sidebar ul li').forEach(li => {
	li.addEventListener('click', e => {
		const textVal = e.target.innerHTML;
		console.log(textVal);
		
		switch (textVal) {
		case "TOP100":
			location.href = '/write/list?filterType='
			break;
			
		case "연재작품":
			
			break;
			
		case "전체작품":
			
			break;
			
		case "완결작품":
			
			break;
			
		case "도전작품":
			
			break;
			
		}
	});
});
