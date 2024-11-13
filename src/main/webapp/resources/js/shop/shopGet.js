// 필드
const inputCount = document.querySelectorAll('.quantity-control input');
const spanText = document.querySelectorAll('.total-price span');
//const bp = document.querySelectorAll('.total-price span').getAttribute('bp');
const bno = new URLSearchParams(location.search).get('bno');
// 버튼 이벤트
document.querySelectorAll('button').forEach(btn => {
	btn.addEventListener('click', a => {
		if(btn.id === 'shopingList'){
			// 장바구니 담기 ( 비동기로 데이터 db에 저장? )
			if(mno.value === ""){
				alert('로그인이 필요한 기능입니다!');
				return;
			}else{
				shopingList();
			}
		}else if(btn.id === 'buy'){
			// 구매 페이지로 바로 이동 ( 현재 페이지 데이터 )
			console.log(inputCount[0]);
			if(mno.value === ""){
				alert('로그인이 필요한 기능입니다!');
				return;
			}else{
				location.href = "/shop/buy?mno=" + mno.value + "&bno=" + bno + "&count=" + inputCount[0].value;
			}
		}else if(btn.id === 'cu'){
			// 찜하기 ( 비동기로 유저 데이터와 도서 데이터 연결해서 저장 )
			if(mno.value === ""){
				alert('로그인이 필요한 기능입니다!');
				return;
			}else{
				cuNext();
			}
		}else if(btn.id === 'goShopList'){
			// 목록으로 이동 ( 보고있던 page, 카테고리 유지 )
			let pageData = getStorageData();
			let sendData = `pageNum=${pageData.pageNum}&amount=${pageData.amount}&gener=${pageData.gener}`;
			console.log(sendData);
			
			location.href = "/shop/list";
		}else if(btn.id === 'minus'){
//			console.log(document.querySelector('.quantity-control input').value - 1);
			for (let i = 0; i < inputCount.length; i++) {
				if(inputCount[i].value > 1){
					inputCount[i].value -= 1;
					spanText[i].innerHTML = (Number(spanText[i].innerHTML.replace(/,/g, '')) - Number(spanText[i].getAttribute('bp'))).toLocaleString();
				}
			}
//			if(inputCount.value > 1){
//				inputCount.value -= 1;
//				spanText.innerHTML -= bp;
//			}
		}else if(btn.id === 'plus'){
			for (let i = 0; i < inputCount.length; i++) {
				if(inputCount[i].value < 100){
					spanText[i].innerHTML = (Number(spanText[i].innerHTML.replace(/,/g, '')) + Number(spanText[i].getAttribute('bp'))).toLocaleString();
					inputCount[i].value = Number(inputCount[i].value) + 1;
				}
			}
		}else if(btn.id === 'goTop'){
			console.log('123');
			window.scrollTo({
		        top: 0,  // Scroll to the top
		        behavior: 'smooth'  // Smooth scrolling
		    });
//			document.documentElement.scrollTop = 0;  // For modern browsers
//		    document.body.scrollTop = 0;
		}else if(btn.id === 'gobottom'){
//			document.body.scrollTop = document.body.scrollHeight;
			window.scrollTo({
		        top: document.documentElement.scrollHeight,  // Scroll to the bottom
		        behavior: 'smooth'  // Smooth scrolling
		    });
		}else if(btn.id === 'goDelete'){
			if(mno.value === ""){
				alert('로그인이 필요한 기능입니다!');
				return;
			}else{
				location.href = "/shop/delete?bno=" + bno;
			}
		}
	});
});

//별점 js
document.addEventListener("DOMContentLoaded", function() {
	applyStarRatings();
});

//별점 로직
function applyStarRatings() {
    document.querySelectorAll('.stars').forEach(starsContainer => {
        const rating = parseFloat(starsContainer.getAttribute('data-rating'));
        const stars = starsContainer.querySelectorAll('.star');
        stars.forEach((star, index) => {
            if (index < Math.floor(rating)) {
                star.style.color = '#FFD700'; // 노란색
            } else if (index === Math.floor(rating) && rating % 1 >= 0.5) {
                star.style.color = '#FFD700'; // 노란색 반 개
            } else {
                star.style.color = '#FFF'; // 흰색
            }
        });
    });
}
function shopingList() {
	const count = inputCount[0].value;
	let sendData = `${bno}/${mno.value}/${count}`;
	
	console.log(sendData);

	// 비동기로 데이터 저장
	fetch('/shop/buyList/' + sendData)
	.then(response => response.text())
	.then(result => {
		console.log(result);
		if(result === 'success'){
			// 장바구니에 담김 말풍선 표시
			let tooltip = document.getElementById('tooltip');
			let button = document.getElementById('shopingList');  // 장바구니 버튼 요소 가져오기
			let buttonRect = button.getBoundingClientRect();  // 버튼의 위치 및 크기 정보

			// 말풍선 위치를 장바구니 버튼 위에 맞추기
			tooltip.style.left = buttonRect.left + (buttonRect.width / 2) - (tooltip.offsetWidth / 2) + 'px';
			tooltip.style.top = window.scrollY + buttonRect.top - tooltip.offsetHeight - 10 + 'px';  // 스크롤 위치 고려

			// 말풍선 표시
			tooltip.style.display = 'block';

			// 마우스가 영역을 벗어났을 때 말풍선 숨기기
			tooltip.addEventListener('mouseleave', hideTooltip);
		} else {
			alert('잘못된 접근입니다.');
		}
	})
	.catch(err => console.log(err));
}

function cuNext() {
	// 비동기로 데이터 저장
	fetch(`/shop/cu/${bno}/${mno.value}`)
		.then(response => response.text())
		.then(result => {
			console.log(result);
			if(result === "success"){
				alert('찜 목록에 추가되었습니다!');
			}else if(result === "false"){
				alert('이미 찜 목록에 있습니다.');
			}else{
				alert('에러데스..');
			}
		})
		.catch(err => console.log(err));
}

// 스크롤을 일정 부분 내리면 고정바가 나타나게 함
document.addEventListener("scroll", function () {
	  const productDetails = document.querySelector(".product-details");
	  const fixedBar = document.querySelector(".fixed-bar");

	  // product-details의 하단 위치를 가져옴
	  const productDetailsBottom = productDetails.getBoundingClientRect().bottom;

	  // product-details가 화면에 보이지 않으면 fixed-bar 표시
	  if (productDetailsBottom < 0) {
	    fixedBar.style.display = "block";
	  } else {
	    fixedBar.style.display = "none";
	  }
	});

//말풍선 숨기기 함수
function hideTooltip() {
    tooltip.style.display = 'none';
}