

// 찜 하기 기능
function jjim(ubno, mno) {
	console.log(ubno);
	console.log(mno);
}

// 실시간 채팅 켜기
function chat(ubno, sellmno, buymno) {
	
	if(sellmno === buymno){
		alert('판매자와 구매자가 동일한 경우 채팅이 불가능 합니다.');
		return;
	}
	
	const locaData = `ubno=${ubno}&sellmno=${sellmno}&buymno=${buymno}`;
	
	location.href = "/used/test?" + locaData;
}
// 실시간 채팅 끄기
function closeChatModal() {
    const chatModal = document.getElementById('chatingModal');
    chatModal.style.display = 'none';
}


// 판매 완료 버튼
function sellSuccess(ubno) {
	console.log(ubvo);
}

// 상품 삭제 버튼
function deleteUsed(ubno) {
	console.log(ubvo);
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

