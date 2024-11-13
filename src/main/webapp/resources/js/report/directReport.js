	console.log("kaakdr");
document.addEventListener("DOMContentLoaded", function () {
	const f = document.forms[0];

	
	document.querySelector("#registerBtn").addEventListener('click', ()=> {
		register();
	});
	
	document.querySelector("#resetBtn").addEventListener('click', ()=> {
		f.reset();
	});
	
	function register() {
	    if (f.DRtitle.value === '') {
	        alert('제목을 입력하쇼');
	        return;
	    }
	    if (f.DRcontent.value === '') {
	        alert('내용을 입력하시오');
	        return;
	    }
	    alert('문의해 주셔서 감사합니다.');
	    f.action = '/report/DRsubmit';
	    f.submit();
	}

});
