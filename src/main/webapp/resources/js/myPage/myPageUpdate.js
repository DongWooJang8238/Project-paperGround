
let userEmailvalue = document.getElementById('userEmail').value;
let userEmail = document.getElementById('userEmail');
let userPhonenumber = document.getElementById('userPhonenumber');
let labelUserPw = document.querySelector('.userPw');
const userPw = document.querySelector('input[name="userPw"]');
//let userId = document.getElementById('userId').value;
//let userIcon = document.getElementById('userIcon').value;

labelUserPw.addEventListener('click', e => {
	if(userPw.value === '123456789123456789'){
		console.log(444);
		userPw.style.border = '';
		userPw.value = '';
		userPw.removeAttribute('readonly');
		userPw.removeAttribute('disabled');
	}else {
		console.log(777);
		userPw.style.border = 'none';
		userPw.value = '123456789123456789';
		userPw.setAttribute('readonly', 'readonly');
		userPw.setAttribute('disabled', 'disabled');
	}
});
//console.log(userPhonenumber);
//console.log(userEmail);
//// 만약 유저 VO에 저장된 값이 woman이라면 checked 코드
//if(gender === "woman"){
//	document.querySelector('.gender-group input[value="woman"]').checked = true;
//}

//userPhonenumber.addEventListener('keyup', e => {
//	let target = e.currentTarget;
//	console.log(userPhonenumber.value);
//	userPhonenumber.value
//	.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거
//	.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
//});

// 하이픈 추가
const autoHyphen = (target) => {
	if (target.value.startsWith("02")) {
		console.log(9);
		target.value = target.value
		.replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,2})(\d{0,3})(\d{0,4})$/g, "$1-$2-$3")
		   	.replace(/(\-{1,2})$/g, "");
			target.setAttribute("maxlength", "11");
	}else if (target.value.startsWith("031")) {
		console.log(5);
		target.value = target.value
		.replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,3})(\d{0,3})(\d{0,4})$/g, "$1-$2-$3")
		   	.replace(/(\-{1,2})$/g, "");
			target.setAttribute("maxlength", "12");
	}else{
		target.value = target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
		.replace(/(\-{1,2})$/g, "");
	}
//		console.log(target.value);
	target.setAttribute("value", "target.value");
}



function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address').value = data.zonecode;
            document.getElementById("streetAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("streetAddress").focus();
          
//            console.log(addr);
//            console.log(data.zonecode);
//            addr = addr;
//            zipcode = data.zonecode;
        }
    }).open();
}


function updateUserInfo(form) {
	if(form.userEmail.value === ''){
		alert("메일을 입력해주세요.");
		return;
	}
	
//	if(form.userAddress.value === ''){
//		form.userAddress.value = '';
//	}
	
	if(form.userPhonenumber.value === ''){
		form.userPhonenumber.value = '';
	}
	
	
	form.userEmail.value = form.userEmail.value + '@' + form.emailDomain.value;
	
	let formData = new FormData(form);
	console.log(form.streetAddress.value);
	console.log(form.detailAddress.value);
	console.log(form.address.value);
	
	
	console.log(form.userId.value);
//	console.log(form.userAddress.value);
	console.log(form.userDate.value);
	console.log(form.userPhonenumber.value);
	console.log(form.userEmail.value);
	form.userId.removeAttribute('disabled');
	if(form.userPw.getAttribute('readonly') === 'readonly'){
		form.action = "/User/updateUserInfo";
		form.submit();
		return;
	}else {
		
		if(form.userPw.value.length < 8){
			alert('변경하려는 비밀번호가 너무 짧습니다.');
			return;
		}
		
		const userPwupdate = {
				userId : form.userId.value,
				userPw : form.userPw.value
		}
		
		fetch(`/User/pwChangeRest`,{
			method: 'POST',
		    headers: {
		        'Content-Type': 'application/json',
		    },
		    body: JSON.stringify(userPwupdate)
		})
			.then(response => response.text())
			.then(result => {
				if(result === 'success'){
					alert("변경을 완료했습니다.");
					form.action = "/User/updateUserInfo";
					form.submit();
				}else {
					alert('비밀번호 변경 에러');
					return;
				}
			})
			.catch(err => console.log(err));
	}
	
//	console.log(userGender.value);
//	console.log(userPhonenumber.value);
//	console.log(userEmail.value);
	
}


// ------------------------------------------------------------------------
//img 버튼
const profileImage = document.getElementById("userIcon"); 

const regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
const MAX_SIZE = 5242880; // 5MB

//console.log(profileImage);
//console.log(deleteImage);
//console.log(imageInput);


function checkExtension(fileName, fileSize) {
	if(fileSize >= MAX_SIZE){
		alert("파일 사이즈 초과");
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}

// 모달 열기 함수
function openModal() {
  document.getElementById('profileModal').style.display = 'flex';
}

// 모달 닫기 함수
function closeModal() {
  document.getElementById('profileModal').style.display = 'none';
}

function changePw() {
	location.href = '/User/pwNew';
}



// 예제용 버튼 기능
function selectPhoto(form) {
//  alert("사진 선택 기능이 호출되었습니다.");
	document.getElementById('openFile').click();
	
	document.getElementById('openFile').addEventListener('change', () =>{
		const files = openFile.files;
		if(!checkExtension(files[0].name, files[0].size)){
			closeModal();
			return false;
		}
	
	
	
	const formData = new FormData();
	formData.append('userId',form.userId.value);
	console.log('userIcon',form.userIcon.files[0]);
	formData.append('userIcon',form.userIcon.files[0]);
	
	
	fetch('/asycn/updateIcon', {
		method : 'post',
		body : formData
	})
	.then(response => response.text())
	.then(text => {
//		console.log(text);
		if(text == "success"){
			alert("아이콘을 변경하였습니다.");
		}
	})
	.catch(err => console.log(err));
	});
}

function setDefaultPhoto(form) {
//  alert("기본 이미지로 설정 기능이 호출되었습니다.");
//  console.log(1234);
  profileImage.setAttribute("src","../resources/images/usericon.jpg");
//  goResetIcon(this.form);
	const formData = new FormData();
	formData.append('userId',form.userId.value);
	formData.append('userIcon',profileImage.getAttribute("src"));
	
	fetch('/asycn/resetIcon', {
		method : 'post',
		body : formData
	})
	.then(response => response.text())
	.then(text => {
		console.log('TEST1')
		console.log(text);
	})
	.catch(err => console.log(err));
	

}

function setKakaoProfile() {
  alert("카카오톡 프로필로 설정 기능이 호출되었습니다.");
}


function goResetIcon(form) {
//	console.log("dddd" + form.userId.value)
	const formData = new FormData();
	formData.append('userId',form.userId.value);
	formData.append('userIcon',profileImage.getAttribute("src"));
	
	fetch('/asycn/resetIcon', {
		method : 'post',
		body : formData
	})
	.then(response => response.text())
	.then(text => {
		console.log('TEST RESET')
		console.log(text);
	})
	.catch(err => console.log(err));
	
}


