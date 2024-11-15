console.log('난데스뗴');

document.querySelectorAll('.link').forEach(link => {
	link.addEventListener('click', e => {
		let id = e.target.id;
		console.log(id === '');
		if(id === 'goWriteInsert'){
			console.log(444);
			location.href = '/write/goWriteInsert?mno=' + mno.value;
		}else if(id === ''){
			const epno = e.target.getAttribute('data-epno');
			console.log(epno);
			location.href = '/write/updateMyEp?episodeno=' + epno;
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

