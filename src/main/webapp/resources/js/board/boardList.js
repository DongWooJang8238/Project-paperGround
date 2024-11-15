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
	if(mno.value == ''){
		alert("로그인시 글작성 가능합니다.");
		return;
	}
	location.href = '/board/register';
});

// 게시글 제목 클릭 이벤트 - 조회
document.querySelectorAll("tbody a").forEach( a => {
	a.addEventListener('click', e => {
		e.preventDefault();

		let boardno = a.getAttribute('href');
		
		location.href = '/board/get?boardno=' + boardno;
		
	});
});

//카테고리 클릭 이벤트 - 조회
//document.querySelectorAll('.sidebar a').forEach(a => {
//	a.addEventListener('click', e => {
//		e.preventDefault();
//		
//		gener = a.getAttribute('href');
//		filterType = a.getAttribute('filterType');
//		if(gener === null){
//			gener = new URLSearchParams(location.search).get('gener');
//		}
//		if(filterType === null){
//			filterType = new URLSearchParams(location.search).get('filterType');
//		}
//		setStorageData(pageNum, amount, gener, filterType);
//		
//		let sendData = `pageNum=1&amount=${amount}&gener=${gener}&filterType=${filterType}`;
//		console.log(sendData);
//		
//		location.href = `/board/list?${sendData}`;
//	});
//});

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
document.querySelectorAll(".page-nation li a").forEach(a => {
    a.addEventListener('click', e => {
        e.preventDefault();
        
        const pageNum = a.getAttribute('href');
        const category = new URLSearchParams(window.location.search).get("category") || 1; // 기본값을 "1(자유게시판)"로 설정
        
        setStorageData(pageNum, amount);
        
        let sendData = `pageNum=${pageNum}&amount=${amount}&category=${category}`;
        
        location.href = `/board/list?${sendData}`;
    });
});





