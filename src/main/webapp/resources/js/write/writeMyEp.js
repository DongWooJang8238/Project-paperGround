console.log('난데스까');

document.querySelectorAll('.link').forEach(link => {
	link.addEventListener('click', e => {
		let id = e.target.id;
		console.log(id === '');
		if(id === 'goWriteInsert'){
			location.href = '/write/goWriteInsert?mno=' + mno.value;
		}else if(id === ''){
			const wno = e.target.getAttribute('data-wno');
			console.log(wno);
			location.href = '/write/goMyEp?wno=' + wno;
		}
	});
});

document.querySelectorAll('.writeHome').forEach(link => {
	link.addEventListener('click', e => {
		console.log(444);
		if(mno.value === ''){
			location.href = '/write/home?mno=0';
		}else {
			location.href = '/write/home?mno=' + mno.value;
		}
	});
});

document.querySelectorAll('h2').forEach(link => {
	link.addEventListener('click', e => {
			const wno = e.target.getAttribute('data-wno');
			console.log(wno);
			location.href = '/write/goMyEpList?wno=' + wno;
	});
});

