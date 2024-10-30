//------CSS 파일 추가
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
			location.href = '/board/list?' + sendData; // 목록으로 이동
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
	if(f.category.value == ''){
		alert("제목을 입력하세요.");
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
	
	let input = document.createElement('input');
	input.name = 'mno';
	input.value = mno.value;
	input.type = 'hidden';
	f.append("mno",input);
	
	// 파일 첨부
	let str = '';
	document.querySelectorAll('.uploadResult ul li').forEach( (li, index) => {
		let path = li.getAttribute('path');
		let uuid = li.getAttribute('uuid');
		let fileName = li.getAttribute('fileName');
		
		str += `<input type="hidden" name="attachList[${index}].uploadPath" value="${path}" />`;
		str += `<input type="hidden" name="attachList[${index}].uuid" value="${uuid}" />`;
		str += `<input type="hidden" name="attachList[${index}].fileName" value="${fileName}" />`;
		
	});
	
	//f.innerHTML += str;
	f.insertAdjacentHTML('beforeend', str);
	console.log(f);
	
	
	
	
	
	
	f.action = '/board/register';
	f.submit();
}

//------다시 작성
//document.querySelector("#resetBtn").addEventListener('click', ()=> {
//		reset();
//});
//------목록으로 이동
//document.querySelector("#indexBtn").addEventListener('click', ()=> {
//	location.href = '/board/list';
//});
