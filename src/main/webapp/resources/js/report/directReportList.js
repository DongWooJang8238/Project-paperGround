console.log("kaakdirectReportList");


//------CSS 파일 추가
//1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/directReportList.css';
//2. link 태그 생성
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;
//3. head 태그에 link 엘리먼트 추가
document.head.appendChild(linkEle);

console.log("kaakdirectReportList"+mno.value);

//게시글 제목 클릭 이벤트 - 조회
document.querySelectorAll("tbody a").forEach( a => {
	a.addEventListener('click', e => {
		e.preventDefault();
		 let drno = a.getAttribute('href'); // 변수 선언 후 초기화
	        console.log("drno:", drno);
	        location.href = drno;
	});
});
//카테고리 드롭다운
const categoryLabel = document.querySelector("th:nth-child(3)"); // "문의 종류" 칸
const categoryDropdown = document.getElementById("inquiryCategory");

// "문의 종류" 클릭 시 드롭다운 토글
categoryLabel.addEventListener("click", () => {
    if (categoryDropdown.style.display === "none" || !categoryDropdown.style.display) {
        categoryDropdown.style.display = "block";
    } else {
        categoryDropdown.style.display = "none";
    }
});
///////////////////////////////
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
//페이지 버튼 클릭 이벤트
document.querySelectorAll(".page-nation li a").forEach( a => {
	a.addEventListener('click', e=>{
		e.preventDefault();
		pageNum = a.getAttribute('href');
		setStorageData(pageNum, amount);
		let sendData = `pageNum=${pageNum}&amount=${amount}`;
		location.href = `/report/directReport?${sendData}&mno=${mno.value}`;
	});
});





