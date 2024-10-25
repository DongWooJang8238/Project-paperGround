//------CSS 파일 추가
// 1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/get.css';
// 2. link 태그 생성
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;
// 3. head 태그에 link 엘리먼트 추가
document.head.appendChild(linkEle);

const f = document.forms[0];

document.querySelectorAll(".panel-body-btns button").forEach(btn => {
    btn.addEventListener('click', (e) => {
        e.preventDefault();
		// 버튼의 id 속성 값 확인
        let type = btn.getAttribute('id');
        
        if (type === 'indexBtn') {
        	let pageData = getStorageData();
			let sendData = `pageNum=${pageData.pageNum}&amount=${pageData.amount}`;
			console.log(sendData);
			location.href = '/board/list?' + sendData; // 목록으로 이동
        } else if (type === 'modifyBtn') { // 게시글 수정
        	modify();
		}else if (type === 'removeBtn') { // 게시글 삭제
			remove();
		}
        
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

function modify(){
	if(f.title.value == ''){
		alert("제목을 입력해주세요");
		return;
	}
	if(f.content.value == ''){
		alert("내용을 입력해주세요");
		return;
	}
	
	f.action = '/board/modify';
	f.submit();// f.submit()로 보내게 되면 POST 방식으로 보내게 된다
}

function remove(){
	if(confirm("진짜 삭제하시겠습니까?")){
		f.action = '/board/remove';
		let boardnoEle = f.boardno;
		f.innerHTML = '';
		f.appendChild(boardnoEle);
		f.submit();
	}
}









