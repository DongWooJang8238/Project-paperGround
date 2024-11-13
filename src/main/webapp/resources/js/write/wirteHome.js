document.querySelectorAll('.menu-buttons ul li').forEach(li => {
	li.addEventListener('click', e => {
		const textVal = e.target.innerHTML;
		console.log(textVal);
		
		switch (textVal) {
		case "작품 등록(인증)":
			if(mno.value == ''){
				alert('로그인이 필요한 기능입니다.');
				return;
			}
			location.href = '/write/goWriteInsert?mno=' + mno.value;
			break;
			
		case "작품 등록(도전)":
			
			break;
			
		case "인증 작가 목록":
			
			break;
			
		case "완결작품":
			
			break;
			
		case "도전작품":
			
			break;
			
		}
	});
});

// JavaScript to handle the sliding functionality
let currentIndex = 0; // 현재 인덱스
const works = document.querySelectorAll('.hover-highlight'); // 작품 카드

function showWorks(index) {
    works.forEach((work, i) => {
        work.style.display = (i === index) ? 'block' : 'none'; // 현재 인덱스의 카드만 표시
    });
}

function prevModalSlide() {
    currentIndex = (currentIndex === 0) ? works.length - 1 : currentIndex - 1; // 첫 번째 카드일 경우 마지막 카드로 이동
    showWorks(currentIndex);
}

function nextModalSlide() {
    currentIndex = (currentIndex === works.length - 1) ? 0 : currentIndex + 1; // 마지막 카드일 경우 첫 번째 카드로 이동
    showWorks(currentIndex);
}

// 초기 카드 표시
showWorks(currentIndex);
