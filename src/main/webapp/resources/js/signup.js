/* ------------- 정규식 ------------- */
const regExpId = /^[a-z]+[0-9a-z]{8,16}$/;   // 아이디 검증 정규식
const regExpPw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;      // 비밀번호 검증 정규식
const regExpName = /^[가-힣a-zA-Z]{2,12}$/;   // 이름 검증 정규식
const regExpEmail = /^[a-zA-Z0-9]+$/;   // 이메일
const regExpDomail = /^[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$/;  // 도메인  																			// 검증
																			// 정규식

/*-------------- Form 관련 요소들 ------*/
const f = document.forms[0];
// let Ck = { idCk, pwCk, pwReCk, nameCk, emailCk, domainCk } = false;
let idCk = false;
let pwCk = false;
let pwReCk = false;
let nameCk = false;
let emailCk = false;
let domainCk = false;

const mIdValidState = document.querySelector("#mIdValidState");
const mPwValidState = document.querySelector("#mPwValidState");
const mPwReValidState = document.querySelector("#mPwReValidState");
const mUserNameValudState = document.querySelector("#mUserNameValudState");
const mUserDomainValudState = document.querySelector("#mUserDomainValudState");
const mUserEmailValudState = document.querySelector("#mUserEmailValudState");



// 회원가입 검증
// function signup(){

// if(f.nickname.value === '') {
// alert('dd');
// return false;
// }

// if(!regExpPw.test(f.password.value)) {
// alert('비밀번호는 8-16 대문자+소문자+숫자를 섞어 작성하세요.');
// return false;
// }

// if((f.password.value) != f.confirm_password.value) {
// alert('비밀번호가 동일하지 않습니다.');
// return false;
// }

// if(f.email.value === '') {
// console.log(f.email_domain.value);
// alert('dd');
// return false;
// }

// if(f.email_domain.value == 0) {
// alert('dwda');
// return false;
// }

// if (f.gender.value == false) {
// alert('성별 체크박스 확인');
// return false
// }

// }


//데이터 검증 완료 함수
function validated(inputTarget, resultState, comment) {
    inputTarget.classList.add('is-valid');
    inputTarget.classList.remove('is-invalid');

    if (resultState) {
        resultState.classList.add('valid-feedback');
        resultState.classList.remove('invalid-feedback');
        resultState.innerHTML = comment ? comment : '';
    }
}

// 데이터 검증 미완료 함수
function invalidated(inputTarget, resultState, comment) {
    inputTarget.classList.add('is-invalid'); // 빨간색 테두리 추가
    inputTarget.classList.remove('is-valid');

    if (resultState) {
        resultState.classList.add('invalid-feedback');
        resultState.classList.remove('valid-feedback');
        resultState.innerHTML = comment ? comment : '';
    }
}

// 검증 스타일 초기화 함수
function initialization(inputTarget, resultState) {
    inputTarget.classList.remove('is-invalid'); // 빨간색 테두리 제거
    inputTarget.classList.remove('is-valid');

    if (resultState) {
        resultState.classList.remove('invalid-feedback');
        resultState.classList.remove('valid-feedback');
        resultState.innerHTML = '';  // 초기화 시 피드백 메시지도 지우기
    }
}

/*-----------------아이디 중복확인 검증-----------------*/
function validateId() {
// console.log('중복확인');
	let target = f.userId;

	if(!regExpId.test(f.userId.value)) {
		alert('아이디는 8-16자 소문자+숫자 형식으로 작성하세요.');
		return false;
	}

	const userid = target.value;
	
	fetch('/asycn/validateId/' + userid)
		.then(response => response.text())
		.then(data => {
			if (data === "success"){
				invalidated(target, mIdValidState, "중복된 아이디입니다.");
				idCk = false;
			}else{
				validated(target, mIdValidState, "사용 가능한 아이디입니다.");
				idCk = true;
			}
			
		})
		.catch(err => console.log(err));
}


/*-----------------비밀번호 검증-----------------*/
f.userPw.addEventListener('keyup', e => {
	let target = e.currentTarget;
// console.log(target.value);
	if (target.value === '') {
		initialization(target, mPwValidState);
		pwCk = false;
	} else if (regExpPw.exec(target.value)) {
		validated(target, mPwValidState);
		pwCk = true;
	} else { 
		invalidated(target, mPwValidState, '비밀번호는 8 ~ 16자 영문, 숫자 조합하세요.');
		pwCk = false;
	}
	
});

/*-----------------비밀번호 확인 검증-----------------*/

f.confirm_password.addEventListener('keyup', e => {
	let target = e.currentTarget;
// console.log(target.value);
	if (target.value === '') {
		initialization(target, mPwValidState);
		pwReCk = false;
	} else if (target.value === f.userPw.value) {
		validated(target, mPwReValidState);
		pwReCk = true;
	} else { 
		invalidated(target, mPwReValidState, '비밀번호가 일치하지 않습니다.');
		pwReCk = false;
	}
	
});

/*-----------------이름  검증-----------------*/
f.userName.addEventListener('keyup', e => {
	let target = e.currentTarget;
 console.log(mUserNameValudState);
// console.log(target.value);
	if (target.value === '') {
		initialization(target, mUserNameValudState);
		nameCk = false;
	} else if (regExpName.exec(target.value)) {
		validated(target, mUserNameValudState);
		nameCk = true;
	} else { 
		invalidated(target, mUserNameValudState, '한글 또는 영문 2~12자로 입력해 주세요.');
		nameCk = false;
	}
	
});

/*-----------------이메일  검증-----------------*/
f.userEmail.addEventListener('keyup', e => {
	let target = e.currentTarget;
	console.log(mUserEmailValudState);
	if (target.value === '') { 
		initialization(target, mUserEmailValudState);
		emailCk = false;
	} else if (regExpEmail.exec(target.value)) { 
		validated(target, mUserEmailValudState);
		emailCk = true;
	} else { 
		invalidated(target, mUserEmailValudState, '영문과 숫자만 입력 가능합니다.');
		emailCk = false;
	}

});

/*-----------------도메인  검증-----------------*/
let userEmail = null;
f.emailDomain.addEventListener('keyup', e => {
	let target = e.currentTarget;
	console.log(target.value);
	
	if (target.value === '') { 
		initialization(target, mUserDomainValudState);
		domainCk = false;
	} else if (regExpDomail.exec(target.value)) { 
		validated(target, mUserDomainValudState);
		domainCk = true;
		
		userEmail = f.userEmail.value + '@' + f.emailDomain.value
		console.log(userEmail);
		
// f.userEmail.value = userEmail;

	} else { 
		invalidated(target, mUserDomainValudState, '올바른 도메인 형식으로 입력하세요.');
		domainCk = false;
	}

});

/*-----------------체크박스 체크-----------------*/
let checkbox = document.querySelectorAll('input[type="checkbox"]');
let checkbox1 = document.getElementById('termsCheckbox').checked;
//let checkbox1 = document.getElementById('termsCheckbox').
let checkbox2 = document.getElementById('privacyCheckbox').checked;
let checkbox3 = document.getElementById('marketingCheckbox').checked;
function goToDetailPage(context) {
	console.log(context);
//	console.log(checkbox);
//	console.log(checkbox1);
//	console.log(checkbox2);
//	console.log(checkbox3);
	
}
function toggleAll() {
		checkbox.forEach(sibal => {
			if(sibal.checked == true){
				sibal.checked = false;
				document.querySelector('#selectAllCheckbox').checked = false;
			}else{
				sibal.checked = true;
				document.querySelector('#selectAllCheckbox').checked = true;
			}
		});
}	
	

//각 약관에 대한 내용을 정의
const termsContents = {
	페이퍼그라운드: "페이버그라운드 이용약관은 사용자의 서비스 이용에 관한 규정을 담고 있습니다. 주요 내용은 이용자의 권리와 의무, 서비스 제공 방침 등을 포함합니다.",
	커뮤니티: "커뮤니티 이용약관은 사용자 정보 보호와 관련된 규정을 다룹니다. 개인정보의 수집 및 이용, 보안 조치에 대해 설명합니다.",
	마케팅: "개인정보 수집 및 이용 동의는 마케팅 목적으로 사용자의 개인정보를 수집하고 활용하는 조건에 대해 설명합니다."
};


// 모달 띄우기 함수
function goToDetailPage(type) {
    document.getElementById('modalTitle').textContent = `${type} 이용약관`;
    document.getElementById('modalContent').textContent = termsContents[type];
    document.getElementById('modal').style.display = 'flex';
}

// 모달 닫기 함수
function closeModal() {
    document.getElementById('modal').style.display = 'none';
}








	
/*-----------------회원가입 함수-----------------*/
function signup() {
	console.log( idCk, pwCk, pwReCk, nameCk, emailCk, domainCk );
	if(idCk != true ||  
			pwCk != true || 
				pwReCk != true || 
					nameCk != true || 
						emailCk != true || 
							domainCk != true) 
	{
			alert("비어있는 항목이 있습니다.");
			return;					
}
	if(checkbox != true){
		alert("체크박스를 선택해주세요.");
		return;
	}
			

/*-----------------회원가입 성공-----------------*/
	alert("회원가입을 성공하였습니다.");
	f.action = "/User/signup" ;
	f.userEmail.value = userEmail;
// f.submit();
	
}









