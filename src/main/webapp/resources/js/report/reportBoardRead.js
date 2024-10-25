console.log("kaak");


const CSS_FILE_PATH = '/resources/css/read.css';
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;
document.head.appendChild(linkEle);


const f = document.forms[0];
let rno;

document.querySelectorAll("button").forEach( btn =>{
	btn.addEventListener('click', ()=>{
		let type = btn.getAttribute('id');
		
		if(type ==='modifyBtn'){
			let bno = f.bno.value;
			location.href = '/board/update?bno='+bno;
			
		}else if(type === 'indexBtn'){
			let pageData = getStorageData();
			let sendData = `pageNum=${pageData.pageNum}&amount=${pageData.amount}`;
			location.href = '/board/list?' + sendData;
		}else if(type ==='replyBtn'){
			registerModalPage();
		}else if(type ==='closeModalBtn'){
				closeModal();
		}else if(type === 'addReplyBtn'){
			// 댓글 등록 함수
			registerReply();
		}else if(type === 'modifyReplyBtn'){
			// 댓글 수정 실행 버튼
			modifyReply();
		}else if(type === 'removeReplyBtn'){
			removeReply();
		}
	})
});

// --------------------------------------reply section
// script----------------------


const rs = replyService; 		// reply.js에서 CRUD를 담당하는 객체
showList();
function showList(){
	let bno = f.bno.value;
	let replyUL = document.querySelector('.chat');
	
	rs.getList(bno, function(data){
		
		let msg='';
		
		data.forEach(rvo => {
			const kstTime = utcToKst(rvo.updateDate) ;
			
			msg += `<li data-rno="` + rvo.rno + `"onclick="modifyModalPage(this)">`;
			msg +=   `<div>`;
			msg +=     `<div class="chat-header">`;
			msg +=       `<strong  class="primary-font">` + rvo.replyer + `</strong>`;
			msg +=       `<small class="pull-right">` + kstTime + `</small>`;
			msg +=     `</div>`;
			msg +=     `<p>` + rvo.reply + `</p>`;
			msg +=   `</div>`;
			msg += `</li>`;
			
		});
		
		replyUL.innerHTML = msg;
	});
	
}


function utcToKst(utcTime) {
	   // UTC 시간 문자열을 Date 객체로 변환
	   const date = new Date(utcTime);

	   // KST 시간대 오프셋 (+9시간)
	   const kstOffset = 9 * 60; // 9시간 * 60분

	   // UTC 시간을 밀리초 단위로 KST 시간으로 변환
	   const localTime = date.getTime() + (kstOffset * 60 * 1000);

	   // 변환된 KST 시간을 Date 객체로 생성
	   const kstDate = new Date(localTime);

	   // 변환된 시간을 "YYYY-MM-DD" 형식의 문자열로 반환
	   const year = kstDate.getFullYear();
	   const month = String(kstDate.getMonth() + 1).padStart(2, '0'); // 월을 두
																		// 자리로
																		// 맞춤
	   const day = String(kstDate.getDate()).padStart(2, '0'); // 일을 두 자리로 맞춤

	   return `${year}-${month}-${day}`; // 최종적으로 변환된 KST 날짜 반환
	}
// -------------------------------모달관련
// 스크립트---------------------------------------
const modal = document.querySelector('#modal');
const inputReply = document.querySelector('input[name="reply"]');
const inputReplyer = document.querySelector('input[name="replyer"]');
const inputReplydate = document.querySelector('input[name="replydate"]');
const addReplyBtn = document.querySelector('#addReplyBtn');
const modifyReplyBtn = document.querySelector('#modifyReplyBtn');
const removeReplyBtn = document.querySelector('#removeReplyBtn');
const closeModalBtn = document.querySelector('#closeModalBtn');

function openmModal(){
	modal.style.display = "block";
}

function closeModal(){
	modal.style.display = "none";
}

function registerModalPage(){
	console.log(" 크아악");
	// 보여질 목록 수정.
	// 수정 , 삭제 버튼 숨기기
	// 등록 취소 버튼 보이기
	regReplyModalStyle();
	
	
	// input 입력창 내용 초기화
	inputReply.value ='';
	inputReplyer.value ='';
	
	openmModal();
	//kaak
	
	
	
}
function regReplyModalStyle(){
	
	addReplyBtn.classList.remove('hide');	
	modifyReplyBtn.classList.add('hide');
	removeReplyBtn.classList.add('hide');
	inputReplydate.closest('div').classList.add('hide');	// 가장 가까운 부모 태그
	
	inputReplyer.removeAttribute('readonly');


}
// 실제 댓글 등록
function registerReply(){
	if(inputReply.value =='' || inputReplyer.value ==''){
		alert('내용을 입력하세요');
		return;
	}
	rs.add(
			{
				reply : inputReply.value,
				replyer : inputReplyer.value,
				bno : f.bno.value
			},
			function(result){
				console.log('result : '+ result);
				closeModal();
				showList();
			}
	);
	
}
// 댓글 리스트 클릭 이벤트
function modifyModalPage(li){
	modifyReplyModalStyle();
	
	// 입력내용
	
	rno =li.getAttribute('data-rno');
	const parent = document.querySelector('li[data-rno="'+rno+'"] div');
	const data_reply = parent.lastChild.innerText;
	const data_replyer = parent.firstChild.firstChild.innerText;
	const data_replydate = parent.firstChild.lastChild.innerText;
	
	inputReply.value = data_reply;
	inputReplyer.value = data_replyer;
	inputReplydate.value = data_replydate;
	
	
	openmModal();
	
	
	
}

function modifyReplyModalStyle(){
	addReplyBtn.classList.add('hide');
	modifyReplyBtn.classList.remove('hide');
	removeReplyBtn.classList.remove('hide');
	inputReplydate.closest('div').classList.remove('hide');
	
	inputReplyer.setAttribute('readonly',true);
	inputReplydate.setAttribute('readonly',true);
}

function modifyReply(){
	// 수정할 내용 필수 입력 검증
	// 실제 update 기능 실행
	// update 성공시 댓글 리스트 출력, 모달 창 해지.
	
	if(inputReply.value ===''){
		alert('댓글을 입력하세요.');
	}
	rs.update({reply : inputReply.value,
		rno : rno}, function(data){
			console.log(data);
			closeModal();
			showList();
		});
	
}

function removeReply(){
	rs.remove(rno, function(data){
		if(confirm("삭제하시겠습니까")){
		alert('good-bye');
		closeModal();
		showList();}
		
	})
}

//-----------------첨부파일 스크립트

fetch('/board/getAttachList/'+f.bno.value)
	.then(response => response.json())
	.then(result =>{
		console.log(result);
		showUploadFile(result);
	})
	.catch(err => console.log(err));

//upload.js에서 가져온거

let uploadResult = document.querySelector('.uploadResult ul');
function showUploadFile(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length==0) return;
	
	
	let str = '';
	uploadResultArr.forEach( file=>{
		let fileCallPath = encodeURIComponent(file.uploadPath + "/" + file.uuid + "_" + file.fileName);
		
		str += `<li path ="${file.uploadPath}" uuid="${file.uuid}" fileName = "${file.fileName}">`;
		str += '<a href="/download?fileName=' + fileCallPath + '">';
		str += file.fileName;
		str += "</a>";
		//str += "<span data-file ='" + fileCallPath + "'> X </span>";
		str += "</li>";
		
	});
	uploadResult.innerHTML = str;
	
}