// Add CSS file to the document head
const CSS_FILE_PATH = '/resources/css/get.css';
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;
document.head.appendChild(linkEle);

document.addEventListener('DOMContentLoaded', () => {
    const f = document.forms[0];
    const boardMno = document.getElementById('boardMno').value;
    
    // Initialize variables at the start of DOMContentLoaded
    const modal = document.querySelector('#modal');
    const inputReply = document.querySelector('input[name="reply"]');
    const modalinputReply = document.querySelector('input[name="modalreply"]');
    const inputReplyer = document.querySelector('input[name="replyer"]');
    const modalinputReplyer = document.querySelector('input[name="modalreplyer"]');
    const inputReplydate = document.querySelector('input[name="replydate"]');
    const modalinputReplydate = document.querySelector('input[name="modalreplydate"]');
    const addReplyBtn = document.querySelector('#addReplyBtn');
    const modifyReplyBtn = document.querySelector('#modifyReplyBtn');
    const removeReplyBtn = document.querySelector('#removeReplyBtn');
    const closeReplyBtn = document.querySelector('#closeReplyBtn');

    function setStorageData(pageNum, amount) {
        let pageData = { pageNum: pageNum, amount: amount };
        localStorage.setItem('page_data', JSON.stringify(pageData));
    }

    function getStorageData() {
        return JSON.parse(localStorage.getItem('page_data'));
    }

    // Button event listeners
    document.querySelectorAll("button").forEach(btn => {
        btn.addEventListener('click', (e) => {
            let type = btn.getAttribute('id');

            if (type === 'indexBtn') {
                let pageData = getStorageData();
                let sendData = `pageNum=${pageData.pageNum}&amount=${pageData.amount}`;
                location.href = '/reportBoard/list?' + sendData;
            } else if (type === 'modifyBtn') {
                let reportBoardno = f.reportBoardno.value;
                location.href = '/reportBoard/modify?reportBoardno=' + reportBoardno;
            } else if (type === 'addReplyBtn') {
            	console.log("what happen");
                registerReply();
            } else if (type === 'closeModalBtn') {
                closeModal();
            } else if (type === 'modifyReplyBtn') {
                modifyReply();
            } else if (type === 'removeReplyBtn') {
                removeReply();
            }
        });
    });

    // Reply-related functions
    const rs = reportReplyService;
    showList();

    function showList() {
        let reportBoardno = f.reportBoardno.value;
        let replyUL = document.querySelector('.chat');

        rs.reportgetList(reportBoardno, function(data) {
            let msg = '';

            data.forEach(rbvo => {
                msg += '<li data-replyno="' + rbvo.replyno + '" onclick="modifyModalPage(this)">';
                msg += '<div>';
                msg += '<div class="chat-header">';
                msg += '<strong class="primary-font">' + rbvo.replyer + '</strong>';
                msg += '<small class="pull-right">' + displayTime(rbvo.replyDate) + '</small>';
                msg += '</div>';
                msg += '<p>' + rbvo.reply + '</p>';
                msg += '</div>';
                msg += '</li>';
            });	

            replyUL.innerHTML = msg;
            replyUL.querySelectorAll('li').forEach(li => {
                li.addEventListener('click', () => modifyModalPage(li));
            });
        });
    }

    function displayTime(unixTimeStamp) {
        let myDate = new Date(unixTimeStamp);
        let y = myDate.getFullYear();
        let m = String(myDate.getMonth() + 1).padStart(2, '0');
        let d = String(myDate.getDate()).padStart(2, '0');
        return `${y}-${m}-${d}`;
    }

    function openModal() {
        modal.style.display = "block";
    }

    function closeModal() {
        modal.style.display = "none";
    }
    function resisterModalPage(){
    	// 보여질 목록 수정
    	regReplyModalStyle();
    	// 수정, 삭제 버튼 숨기기
    	// 등록, 취소 버튼 보이기
    	
    	// input 입력창 내용 초기화
    	inputReply.value = ''; // 댓글 등록 후 댓글 등록창 댓글 내용 초기화
    	inputReplyer.value = ''; // 댓글 등록 후 댓글 등록창 작성자 내용 초기화
    	
    	openModal();
    }
    function regReplyModalStyle(){
    	
    	addReplyBtn.classList.remove('hide');
    	modifyReplyBtn.classList.add('hide');
    	removeReplyBtn.classList.add('hide');
        inputReplydate.closest('div').classList.add('hide');
    	inputReplyer.removeAttribute('readonly');
    }

    function registerReply() {
        if (inputReply.value == '' || inputReplyer.value == '') {
            alert('모든 내용을 입력하세요.');
            return;
        }

        rs.reportadd(
            {
                reply: inputReply.value,
                replyer: inputReplyer.value,
                reportBoardno: f.reportBoardno.value,
                mno: mno.value
            },
            function(result) {
                console.log("result : " + result);
                showList();
            }
        );
    }

    let replyno;
    function modifyModalPage(li) {	
        modifyReplyModalStyle();
        replyno = li.getAttribute('data-replyno');
        const parent = document.querySelector('li[data-replyno="'+replyno+'"] div');
        const data_reply = parent.lastChild.innerText;
        const data_replyer = parent.firstChild.firstChild.innerText;
        const data_replydate = parent.firstChild.lastChild.innerText;

        modalinputReply.value = data_reply;
        modalinputReplyer.value = data_replyer;
        modalinputReplydate.value = data_replydate;

        openModal();
    }

    function modifyReplyModalStyle() {
        addReplyBtn.classList.add('hide');
        modifyReplyBtn.classList.remove('hide');
        removeReplyBtn.classList.remove('hide');
        modalinputReplydate.closest('div').classList.remove('hide');
        modalinputReplyer.setAttribute('readonly', true);
        modalinputReplydate.setAttribute('readonly', true);
    }

    function modifyReply() {    
        if (modalinputReply.value == '') {
            alert('수정할 내용을 입력하세요.');
            return;
        }
        if(mno.value === boardMno){
        rs.reportupdate(
            { reply: modalinputReply.value, replyno: replyno },
            function(result) {
                console.log("result : " + result);
                closeModal();
                showList();
            }
        );
        }else if (mno.value === 1){
        	rs.reportupdate(
                    { reply: modalinputReply.value, replyno: replyno },
                    function(result) {
                        console.log("result : " + result);
                        closeModal();
                        showList();
                    }
                );        	
        }else{
        	 alert("수정 권한이 없습니다.");
        }
    }

    function removeReply() {
        if (confirm("진짜 삭제하시겠습니까?")) {
        	if (mno.value === boardMno) {
            rs.reportremove(replyno, data => {
                console.log(data);
                closeModal();
                showList();
            });
        	}else if(mno.value === 1){
        		 rs.reportremove(replyno, data => {
                     console.log(data);
                     closeModal();
                     showList();
        		 });
        	}else{
        		alert("삭제 권한이 없습니다.");
            }        	
        }
    }
});
