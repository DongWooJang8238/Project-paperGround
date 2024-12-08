console.log("kaakDRreportEntrance");


//localStorage.setItem('mno', mno);
let query = window.location.search;
let param = new URLSearchParams(query);
let checkMno = param.get('mno');
console.log(checkMno);

//console.log(localStorage.getItem('mno'));

document.addEventListener('DOMContentLoaded', function() {
	let gameMode;
	const form = document.forms[0];  // 'f' 대신 'form'으로 변수 이름 변경


	// 모든 버튼에 이벤트 핸들러 연결
	document.querySelectorAll(".btns").forEach(btn => {
		btn.addEventListener('click', () => {
			let type = btn.getAttribute('id');
			console.log(type);  // 클릭된 버튼의 id 확인

			if (type === 'godirectReport') {
				if(checkMno == 0){
					if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')){
						location.href = '/User/login';

					}
				}
			} else if (type === 'godirectReportCheck') {
				console.log(mno.value);
				if(mno.value === ''){
					if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')){
						location.href = '/User/login';
					}
				}
			}

		});
	});
});
var message = document.querySelector('.alertMessage').value;
if (message) {
	alert(message);
}






