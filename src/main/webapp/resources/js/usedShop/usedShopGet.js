// 목록으로 가기
function goList() {
	shopUsedList();
}
// 찜 하기 기능
function jjim(ubno, mno) {
	if(mno === 0){
		alert('로그인이 필요한 기능입니다!');
		return;
	}else if(mno > 0){
		console.log(ubno);
		console.log(mno);
		let jjim = {ubno : ubno, mno : mno};
		fetch('/used/wishList', {
			method: 'POST',
			headers: {
		        'Content-Type': 'application/json',
		    },
		    body: JSON.stringify(jjim)
		})
		.then(response => response.text())
		.then(result => {
			console.log("비동기 결과 : " + result);
			if(result === "success"){
				alert('찜 목록에 추가되었습니다.');
				let wish = document.querySelector('.wishList');
				wish.style.color = "red";
			}else if(result === "false"){
				if(confirm('이미 찜 목록에 있습니다. 삭제하시겠습니까?')){
					
					fetch('/used/unWishList',{
						method : 'POST',
						headers : {
							'Content-Type': 'application/json'
						},
						body : JSON.stringify(jjim)
					})
						.then(response => response.text())
						.then(result => {
							console.log(result);
							let wish = document.querySelector('.wishList');
							wish.style.color = "white";
						})
						.catch(err => console.log(err));
					
				}else{
					console.log('찜취소');
				}
			}else {
				alert('에러 : ' + result);
			}
		})
		.catch(err => {
			console.log(err);
		});
	}else {
		alert("로그인이 필요한 기능입니다.");
	}
}

// 실시간 채팅 끄기
function closeChatModal() {
    const chatModal = document.getElementById('chatingModal');
    chatModal.style.display = 'none';
}


//판매 완료 버튼
function sellSuccess(ubno) {
  if (mno.value === "") {
    alert('로그인이 필요한 기능입니다!');
    return;
  } else {
    // 판매 완료 모달 표시
    document.getElementById('sellSuccessModal').style.display = 'flex';

    // 버튼 클릭 이벤트 설정
    document.getElementById('sellCompleteBtn').onclick = function() {
      // 판매 완료 처리 로직
      console.log('판매 완료 처리:', ubno);
      fetch('/used/successSell',{
			method : 'POST',
			headers : {
				'Content-Type': 'application/json'
			},
			body : ubno
		})
      	.then(response => response.text())
      	.then(result => {
      		closeSellModal();
      		console.log(result);
      		if(result === "success"){
      			if(confirm("목록으로 이동하시겠습니까?")){
      				location.href = "/used/list";
      			}else {
      				console.log('그냥있기');
      			}
      		}else {
      			alert('뭔가문제임');ㅣ
      		}
      	})
      	.catch(err => console.log(err));
    };

    document.getElementById('sellDeleteBtn').onclick = function() {
      // 삭제 처리 로직
      console.log('삭제 처리:', ubno);
      fetch('/used/deleteUbook',{
			method : 'POST',
			headers : {
				'Content-Type': 'application/json'
			},
			body : ubno
		})
    	.then(response => response.text())
    	.then(result => {
    		closeSellModal();
    		if(result === "success"){
    			alert('삭제 완료');
    			location.href = '/used/list';
    		}
    	})
    	.catch(err => console.log(err));
    };

    document.getElementById('sellCancelBtn').onclick = closeSellModal;
  }
}

// 판매 완료 모달 닫기 함수
function closeSellModal() {
  document.getElementById('sellSuccessModal').style.display = 'none';
}


// 상품 삭제 버튼
function deleteUsed(ubno) {
	if(mno.value === ""){
		alert('로그인이 필요한 기능입니다!');
		return;
	}else{
		console.log(ubvo);
	}
}

// ======================================================================================
// ======================================================================================
// ======================================================================================
//아래는 이미지 모달 관련 스크립트
let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const totalSlides = slides.length;

function updateSlidePosition() {
    const slideContainer = document.querySelector('.slide-container');
    slideContainer.style.transform = `translateX(-${currentSlide * (100 / 3)}%)`;
}

function prevSlide() {
    if (currentSlide > 0) {
        currentSlide--;
    } else {
        currentSlide = totalSlides - 3; // 마지막 슬라이드로 이동
    }
    updateSlidePosition();
}

function nextSlide() {
    if (currentSlide < totalSlides - 3) {
        currentSlide++;
    } else {
        currentSlide = 0; // 첫 슬라이드로 이동
    }
    updateSlidePosition();
}

let currentSlideIndex = 0;
let images = document.querySelectorAll('.slide img');

console.log("이미지 : " + images);

// 모달 창 열기
function openModal(index) {
    const images = document.querySelectorAll('.slide img'); // 여기에서 다시 선택
    currentSlideIndex = index;
    
    // 인덱스 범위 확인
    if (currentSlideIndex < 0 || currentSlideIndex >= images.length) {
        console.error("Invalid slide index:", currentSlideIndex);
        return;
    }
    
    document.getElementById("imageModal").style.display = "flex";
    document.getElementById("modalImage").src = images[currentSlideIndex].src;
}


// 모달 창 닫기
function closeModal() {
    document.getElementById("imageModal").style.display = "none";
}

// 모달 내에서 이전 이미지로 변경
function prevModalSlide() {
    currentSlideIndex = (currentSlideIndex > 0) ? currentSlideIndex - 1 : images.length - 1;
    document.getElementById("modalImage").src = images[currentSlideIndex].src;
}

// 모달 내에서 다음 이미지로 변경
function nextModalSlide() {
    currentSlideIndex = (currentSlideIndex < images.length - 1) ? currentSlideIndex + 1 : 0;
    document.getElementById("modalImage").src = images[currentSlideIndex].src;
}

