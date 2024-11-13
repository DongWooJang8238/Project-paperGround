let f = document.forms[0];
// 총 결제 금액 계산
let totalPrice = 0;

document.querySelectorAll('.product-details').forEach(item => {
    const bookPrice = Number(item.querySelector('.bookPrice').getAttribute('data-price'));
    const quantity = Number(item.querySelector('.spanCount').innerHTML);
    totalPrice += bookPrice * quantity;
});

document.querySelector('#totalPrice').innerHTML = totalPrice.toLocaleString();

// 수량 증가/감소 버튼 이벤트 리스너 추가
document.querySelectorAll('.product-details').forEach(item => {
    const spanCount = item.querySelector('.spanCount');
    const bookPriceElement = item.querySelector('.bookPrice');
    const inputCount = item.querySelector('input[name="count"]');

    item.querySelector('.minus').addEventListener('click', () => {
        let currentCount = Number(spanCount.innerHTML);
        if (currentCount > 1) {
            currentCount--;
            spanCount.innerHTML = currentCount;
            inputCount.value = currentCount;

            // 가격 업데이트
            const newPrice = Number(bookPriceElement.getAttribute('data-price')) * currentCount;
            bookPriceElement.innerHTML = newPrice.toLocaleString();

            // 총 결제 금액 업데이트
            updateTotalPrice();
        }
    });

    item.querySelector('.plus').addEventListener('click', () => {
        let currentCount = Number(spanCount.innerHTML);
        if (currentCount < 100) {
            currentCount++;
            spanCount.innerHTML = currentCount;
            inputCount.value = currentCount;

            // 가격 업데이트
            const newPrice = Number(bookPriceElement.getAttribute('data-price')) * currentCount;
            bookPriceElement.innerHTML = newPrice.toLocaleString();

            // 총 결제 금액 업데이트
            updateTotalPrice();
        }
    });
});

function updateTotalPrice() {
    totalPrice = 0;
    document.querySelectorAll('.product-details').forEach(item => {
        const bookPrice = Number(item.querySelector('.bookPrice').innerHTML.replace(/,/g, ''));
        totalPrice += bookPrice;
    });
    document.querySelector('#totalPrice').innerHTML = totalPrice.toLocaleString();
}

document.querySelector('select[name="point"]').addEventListener('change', e => {
	const point = document.querySelector('select[name="point"]').value;
	document.querySelector('#totalPrice').innerHTML = (totalPrice - point).toLocaleString();
});
// 상품 삭제
function deleteCart(bno) {
	location.href = '/shop/deleteCart?bno=' + bno + "&mno=" + mno.value;
}
// 결제 버튼 이벤트
document.querySelector('.pay-button').addEventListener('click', a => {
	console.log('결제버튼클릭');
	if(document.querySelector('#cardPayment').checked){
		console.log('신용카드 결제 금액 : ' + document.querySelector('#totalPrice').innerHTML);
		cardPay();
	}else if(document.querySelector('#bankTransfer').checked){
		console.log('계좌이체 결제 금액 : ' + document.querySelector('#totalPrice').innerHTML);
		bankTransfer();
	}else if(document.querySelector('#kakaoPay').checked){
		console.log('카카오페이 결제 금액 : ' + document.querySelector('#totalPrice').innerHTML);
		kakaoPay();
	}
});

// 결제 취소 이벤트
document.querySelector('.cancel-button').addEventListener('click', a => {
	console.log('결제취소버튼');
	if(confirm('정말 취소하시겠습니까? (입력된 정보는 저장되지 않습니다.)')){
		location.href = '/shop/list';
	}
});

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

// 신용카드 결제
function cardPay() {
	// 사용자 입력 정보 확인
	if(f.orderName.value === '' || f.orderPhone.value === '' || f.address.value === '' || f.streetAddress.value === '' || f.detailAddress.value === ''){
		alert('(필수) 항목이 비어있습니다.');
		return;
	}
	// 신용카드 관련 로직 실행
//	alert('mno = ' + mno);
	const img = document.querySelectorAll('img');
	console.log(img[0].src);
	const orderMainBookName = document.querySelectorAll('span');
	const products = document.querySelectorAll('.product-description');
	const bnoOne = document.querySelectorAll('input[name="bno"]');
	console.log(bnoOne[0].value);
	alert('뭔가신용카드결제');
	// 결제 완료 후 페이지 이동
		const listData = [];
		// 상품 리스트 데이터 수집
		document.querySelectorAll('.product-details').forEach(product => {
			const bno = product.querySelector('input[name="bno"]').value;
			const count = product.querySelector('input[name="count"]').value;
			listData.push({ "bno" : bno, "count" : count});
		});
		const orderData = {
			    mno: mno.value,
			    bno: bnoOne[0].value,
			    bookTypeCount : products.length,
			    orderMainBookName : orderMainBookName[0].getAttribute('data-title'),
			    orderMainImage : img[0].src,
			    totalPrice: document.querySelector('#totalPrice').innerHTML,
			    orderName: document.getElementById('orderName').value,
			    orderPhone: document.getElementById('orderPhone').value,
			    orderAddress: document.getElementById('address').value,
			    orderStreetAddress: document.getElementById('streetAddress').value,
			    orderDetailAddress: document.getElementById('detailAddress').value,
			    point: document.querySelector('select[name="point"]').value,
			    userDeposit: document.getElementById('userDeposit').value,
			    
			    list: listData // 여기에 상품 리스트 데이터 추가
			};
		
		const userCheck = document.querySelector('input[name="userCheck"]');
		let check;
		if(userCheck.checked){
			check = 1;
			console.log(check);
		}else {
			check = 0;
			console.log(check);
		}
			// 데이터를 JSON으로 변환 후 전송
			fetch(`/shop/buySuccess/${check}`, {
			    method: 'POST',
			    headers: {
			        'Content-Type': 'application/json',
			    },
			    body: JSON.stringify(orderData),
			})
			.then(response => response.text())
			.then(data => {
				console.log("비동기 결과 : " + data);
				if(data === 'success'){
					if(confirm('상품 상세 페이지로 이동하시겠습니까? ( 거절 시 상품 목록으로 이동 )')){
						location.href = "/order/orderDetail?mno=" + mno.value;
					}else {
						location.href = "/shop/list";
					}
				}else {
					alert('실패데스');
				}
			})
			.catch(error => console.error('Error:', error));
}

function addrChange() {
	document.querySelector('#newAddr').style.display = 'block';
}
// 카카오페이 결제 api 관련
//document.querySelector(".btn-pay-ready").addEventListener('click', a => {
//  	console.log("결제test");
//    // 필요한 데이터를 객체에 담기
//    let data = {
//    	title: '상품명',    // 카카오페이에 보낼 대표 상품명
//        bookPrice: 1000    // 총 결제금액
//    };
//      
//    // Fetch API 사용
//    fetch('/order/pay/ready', {
//        method: 'POST',
//        headers: {
//            'Content-Type': 'application/json', // 요청을 JSON으로 보내기 위한 헤더 설정
//            'Authorization': 'DEV_SECRET_KEY {DEVC61F3A34BC5C630FDC1EC579B491CCAB3EABA}' // 카카오페이 인증 헤더 (Admin Key 입력 필요)
//        },
//        body: JSON.stringify(data) // 데이터를 JSON 문자열로 변환하여 전송
//    })
//    .then(response => response.json()) // 응답을 JSON 형식으로 파싱
//    .then(data => {
//        location.href = data.next_redirect_pc_url; // 카카오페이로 리다이렉트
//    })
//    .catch(error => console.error('Error:', error)); // 오류 처리
//});