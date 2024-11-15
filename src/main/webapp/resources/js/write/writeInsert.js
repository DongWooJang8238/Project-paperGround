const f = document.forms[0];

document.querySelector('.pc-page-link a').addEventListener('click', e => {
	e.preventDefault();
	sendData();
})

// 업로드 버튼 클릭 시 모달 열기
document.querySelector('#upload').addEventListener('click', e => {
    document.querySelector('.modal-overlay').style.display = 'flex';
});

// 슬라이드 이미지 클릭 시 해당 이미지를 모달 내 이미지 표시 영역에 나타내기
const slides = document.querySelectorAll('.slide');
const modalImage = document.querySelector('.modal-body > div > div > img');

slides.forEach(slide => {
    slide.addEventListener('click', e => {
        const selectedImage = e.target.src; // 클릭한 이미지의 src 가져오기
        modalImage.src = selectedImage; // 모달 이미지에 설정
    });
});

// 모달 배경을 클릭하면 모달 닫기
document.querySelector('.modal-overlay').addEventListener('click', e => {
    if (e.target === document.querySelector('.modal-overlay')) {
        document.querySelector('.modal-overlay').style.display = 'none';
    }
});

// 모달 이미지를 선택하면 이미지 저장하기
document.querySelector('#checkImg').addEventListener('click', e=>{
	console.log(e.target.src);
	f.coverImage.value = e.target.src;
	document.querySelector('.modal-overlay').style.display = 'none';
});


function sendData() {
	const writeType = document.querySelector('select[name="writeType"]');
	const genre = document.querySelector('select[name="genre"]');
	const title = document.querySelector('textarea[name="title"]');
	const description = document.querySelector('textarea[name="description"]');
	// 빈칸 예외처리 해야됨
	if(title.value === ''){
		alert('제목은 반드시 입력해야 합니다.');
		title.focus();
		return;
	}else if(title.value.length < 5){
		alert('제목은 최소 5글자 이상으로 작성해야 합니다.');
		title.focus();
		return;
	}else if(description.value === ''){
		alert('작품소개를 적어주세요.');
		description.focus();
		return;
	}else if(description.value.length < 10){
		alert('작품소개는 최소 10글자 이상으로 작성해야 합니다.');
		description.focus();
		return;
	}
	
	const mnoInput = document.createElement('input');
	mnoInput.type = 'hidden';
	mnoInput.name = 'mno';
	mnoInput.value = mno.value;
	
	const writecover = document.createElement('input');
	writecover.type = 'hidden';
	writecover.name = 'coverimage';
	writecover.value = '';
	
	f.appendChild(mnoInput);
//	f.appendChild(writecover);

	console.log(f.writeType.value);
	console.log(f.genre.value);
	console.log(f.title.value);
	console.log(f.description.value);
	console.log(f.mno.value);
	console.log(f.coverImage.value);
	
	f.action = "/write/writeInsert";
	f.submit();
}