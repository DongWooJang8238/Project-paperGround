//------CSS 파일 추가
// 1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/boardList.css';

// 2. link 태그 생성 (CSS 파일을 로드하기 위해 link 요소 생성)
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;

// 3. head 태그에 link 엘리먼트 추가 (생성된 link 요소를 <head> 태그에 추가하여 CSS 적용)
document.head.appendChild(linkEle);

// 새 게시글 등록 클릭 이벤트
const regBtn = document.querySelector("#registerBtn");
if(regBtn != null){
	document.querySelector("#registerBtn").addEventListener('click', ()=> {
		// 글 작성 권한 확인 (로그인 여부에 따라 글 작성 가능 여부 판단)
		if(mno.value == ''){
			alert("로그인시 글작성 가능합니다.");
			return;
		}
		// 로그인 시 글 작성 페이지로 이동
		location.href = '/board/register';
	});
}

// 게시글 제목 클릭 이벤트 - 조회
document.querySelectorAll("tbody a").forEach( a => {
	a.addEventListener('click', e => {
		e.preventDefault();  // 기본 동작 방지 (기본 링크 이동 방지)

		// 게시글 번호를 href 속성에서 가져옴
		let boardno = a.getAttribute('href');
		
		// 해당 게시글 조회 페이지로 이동
		location.href = boardno;
	});
});

// 카테고리 클릭 이벤트 - 조회
// 주석 처리된 코드: 사이드바 카테고리 클릭 시 페이지 조회 이벤트
// document.querySelectorAll('.sidebar a').forEach(a => {
// 	a.addEventListener('click', e => {
// 		e.preventDefault();  // 기본 동작 방지
//		
//		gener = a.getAttribute('href');  // 선택된 카테고리 값 가져오기
//		filterType = a.getAttribute('filterType');  // 필터 타입 값 가져오기
//		if(gener === null){
//			gener = new URLSearchParams(location.search).get('gener');  // URL에 gener 값이 없을 경우 기본 값 설정
//		}
//		if(filterType === null){
//			filterType = new URLSearchParams(location.search).get('filterType');  // URL에 filterType 값이 없을 경우 기본 값 설정
//		}
//		setStorageData(pageNum, amount, gener, filterType);  // 로컬 스토리지에 데이터 저장
//		
//		let sendData = `pageNum=1&amount=${amount}&gener=${gener}&filterType=${filterType}`;
//		console.log(sendData);  // 요청 데이터 확인
//		
//		location.href = `/board/list?${sendData}`;  // 설정된 데이터로 목록 페이지 이동
//	});
// });

// 페이지 정보 (페이지 번호 및 글 개수) 로컬 스토리지에 저장
function setStorageData(pageNum, amount, category){
	let pageData = {
		pageNum : pageNum,
		amount : amount,
		category : category
	};
	localStorage.setItem('page_data', JSON.stringify(pageData));  // 페이지 정보 JSON으로 변환하여 저장
}

// 로컬 스토리지에서 저장된 페이지 정보 가져오기
function getStorageData(){
	return JSON.parse(localStorage.getItem('page_data'));
}

// 현재 URL에서 pageNum 및 amount 파라미터 가져오기
let pageNum = new URLSearchParams(location.search).get('pageNum');
let amount = new URLSearchParams(location.search).get('amount');
let category = new URLSearchParams(location.search).get('category');

// URL에 pageNum, amount, category 값이 없는 경우 기본값 설정
if(!pageNum || !amount || !category){
	pageNum = 1;  // 기본 페이지 번호
	amount = 10;  // 페이지당 기본 글 개수
	category = 1;
}
setStorageData(pageNum, amount, category);  // 페이지 정보 저장

// 페이지 버튼 클릭 이벤트
document.querySelectorAll(".page-nation li a").forEach(a => {
    a.addEventListener('click', e => {
        e.preventDefault();  // 기본 동작 방지

        // 페이지 번호 가져오기
        const pageNum = a.getAttribute('href');
        // URL에서 카테고리 값 가져오기, 없을 경우 기본값을 "1(자유게시판)"으로 설정
        const category = new URLSearchParams(window.location.search).get("category") || 1;

        setStorageData(pageNum, amount, category);  // 새로 선택된 페이지 정보를 로컬 스토리지에 저장

        // 요청할 데이터 생성
        let sendData = `pageNum=${pageNum}&amount=${amount}&category=${category}`;
        
        // 페이지 이동
        location.href = `/board/list?${sendData}`;
    });
});

//새 게시글 등록 클릭 이벤트
const bestList = document.querySelector(".bestList");
if(bestList != null){
	document.querySelector(".bestList").addEventListener('click', ()=> {
		
		location.href = '/board/bestList';
	});
}
