//------CSS 파일 추가
// 1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/boardList.css';
// 2. link 태그 생성
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;
// 3. head 태그에 link 엘리먼트 추가
document.head.appendChild(linkEle);

// 새 게시글 등록 클릭 이벤트
document.querySelector("#registerBtn").addEventListener('click', ()=> {
	location.href = '/reportBoard/register';
});

// 게시글 제목 클릭 이벤트 - 조회
document.querySelectorAll("tbody a").forEach( a => {
	a.addEventListener('click', e => {
		e.preventDefault();

		let reportBoardno = a.getAttribute('href');
		
		location.href = '/reportBoard/get?reportBoardno=' + reportBoardno;
		
	});
});



function setStorageData(pageNum, amount){
	let pageData = {
		pageNum : pageNum,
		amount : amount
	};
	localStorage.setItem('page_data', JSON.stringify(pageData));
}
function getStorageData(){
	return JSON.parse(localStorage.getItem('page_data'));
	
}

let pageNum = new URLSearchParams(location.search).get('pageNum');
let amount = new URLSearchParams(location.search).get('amount');
if(!pageNum || !amount){
	pageNum = 1;
	amount = 10;
}
setStorageData(pageNum, amount);


// 페이지 버튼 클릭 이벤트
document.querySelectorAll(".page-nation li a").forEach( a => {
	a.addEventListener('click', e=>{
		e.preventDefault();
		
		pageNum = a.getAttribute('href');
		setStorageData(pageNum, amount);
		
		let sendData = `pageNum=${pageNum}&amount=${amount}`;
		
		location.href = `/reportBoard/list?${sendData}`;
		
	});
});
document.getElementById("categoryFilter").addEventListener("change", function() {
    const selectedCategory = this.value;
    
    // 기본적으로 1페이지와 항목 수 10으로 설정
    const pageNum = 1;
    const amount = 10;
    
    // 선택한 카테고리를 URL 파라미터로 추가하여 컨트롤러에 요청
    const url = `/reportBoard/listCategory?reportCategory=${encodeURIComponent(selectedCategory)}&pageNum=${pageNum}&amount=${amount}`;
    
    // 페이지 이동
    window.location.href = url;
});
