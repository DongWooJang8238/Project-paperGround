console.log('kaak');
// 1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/register.css';

// 2. link 태그 생성
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;

// 3. head 태그에 link 엘리먼트 추가
//document.head.appendChild(linkEle);

// form 객체 가져오기
const f = document.forms[0];

//------새 게시글 등록
document.querySelectorAll(".panel-body-btns button").forEach( btn => {
	btn.addEventListener('click', (e) => {

		console.log('버튼 클릭 이벤트');
		// 버튼의 id 속성 값 확인
		let type = btn.getAttribute('id');

		if(type === 'indexBtn'){
			let pageData = getStorageData();
			let sendData = `pageNum=${pageData.pageNum}&amount=${pageData.amount}`;
			location.href = '/reportBoard/list?' + sendData; // 목록으로 이동
		}else if(type === 'resetBtn'){
			f.reset(); // 폼 초기화
		}else if(type === 'registerBtn'){
			console.log('게시글 등록 이벤트');
			register(); // 게시글 등록
		}
	});
});

function register(){
	console.log('게시글 등록 함수');
	if(f.reportCategory.value == ''){
		alert("카테고리를 선택하세요.");
		return;
	}
	if(f.title.value == ''){
		alert("제목을 입력하세요.");
		return;
	}
	if(f.writer.value == ''){
		alert("작성자를 입력하세요.");
		return;
	}
	if(f.content.value == ''){
		alert("내용을 입력하세요.");
		return;
	}
	
	// 파일 첨부
	console.log(f);
	
	
	f.action = '/reportBoard/register';
	f.submit();
}

