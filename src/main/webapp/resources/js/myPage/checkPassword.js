/*-------------- 요소들------*/
let checkPw = document.getElementById('checkPw'); 
let userPw = document.getElementById('userPw'); 
let checkId = document.getElementById('checkId'); 


function checkPassword() {
//	console.log(123);
//	console.log(checkId.value);
//	console.log(userId.value);
//	console.log(checkPw.value);
//	console.log(userPw.value);
	
	if(checkPw.value != userPw.value){
		alert("입력하신 비밀번호가 올바르지 않습니다.")
		userPw.value = "";
	}else {
		location.href = "/User/myPageUpdate?userId=" + checkId.value;
	}
	
}
