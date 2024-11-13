document.querySelector('#myEp').addEventListener('click', e => {
	e.preventDefault();
	location.href = '/write/goMyEpiosde?mno=' + mno.value;
});