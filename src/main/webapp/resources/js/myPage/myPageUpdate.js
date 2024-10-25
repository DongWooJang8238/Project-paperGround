
console.log(document.querySelector('#gender').getAttribute('gender'));
console.log(document.querySelector('.gender-group input[value="woman"]'));
const genderOne = document.querySelector('.gender-group input[value="woman"]');
const gender = document.querySelector('#gender').getAttribute('gender');
let userEmailvalue = document.getElementById('userEmail').value;
let userEmail = document.getElementById('userEmail')


console.log(userEmail);
// 만약 유저 VO에 저장된 값이 woman이라면 checked 코드
if(gender === "woman"){
	document.querySelector('.gender-group input[value="woman"]').checked = true;
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
	console.log(form.userGender.value);
//	console.log(form.userAddress.value);
	console.log(form.userDate.value);
	console.log(form.userPhonenumber.value);
	console.log(form.userEmail.value);
	alert("흠냐륑");
	form.action = "/User/updateUserInfo";
	form.submit();
	
//	console.log(userGender.value);
//	console.log(userPhonenumber.value);
//	console.log(userEmail.value);
	
}