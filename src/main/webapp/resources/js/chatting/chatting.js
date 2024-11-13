const chattingRoom = document.querySelector('.userShopChattingRoom');

function myChattingList(ubno, mymno) {
	console.log(777);
	fetch(`/used/sellChat/${ubno}/${mymno}`)
	  .then(response => response.json()) // 응답을 JSON 형식으로 파싱
	  .then(data => {
		  let str = '';
		  data.forEach(dto => {
//			  console.log(dto.buymno);
//			  console.log(dto.userName);
//			  console.log(dto.chatno);
			  // div에 박스 형태 만들어주기 ( css )
			  str += `<div class="chattingRoom" onclick="goChatting( ${dto.chatno}, ${dto.userName} )">`;
			  str += `<h3>${dto.userName}님 과의 대화</h3>`;
			  str += `</div>`;
		  });
		  chattingRoom.innerHTML = str;
		  const sellChatModal = document.getElementById('userShopChatting');
		  sellChatModal.style.display = 'block';
	  })
	  .catch(error => console.error('Error:', error));
}

let lastChatCount = 0;

function goChatting( chatno, userName ) {
	
		let str = 
			`<h1>${userName}</h1>
			<button type="button" class="out" onclick="outChatting();">나가기</button>
			<hr>
			<div class="sellChatting"></div>
			<div class="input-container">
				<input type="text" class="long" id="sellmsg">
				<button type="button" id="goSell" onclick="gobtnMsg(${chatno})">전송</button>
			</div>`;
		chattingRoom.innerHTML = str;
		
		const longInputs = document.querySelector('#sellmsg');
		const goSellBtn = document.querySelector('#goSell');
		
		longInputs.addEventListener('keydown', e => {
				console.log('키다운확인' + e.key);
				if(e.key === 'Enter'){
					goSellBtn.click();
				}
		});
		
		// url 주소 변경 필요
		// 내일 오면 웹소켓 서버 하나 더 만들어서 판매자용으로 만들것!
		let sellurl = `ws://localhost:9090/sellserver.do?chatno=${chatno}`;
		ws = new WebSocket(sellurl);
		
		ws.onopen = function(evt) {
			selllog('서버와 연결하였습니다.');
	        // 채팅 내역을 1초마다 로드하도록 설정
			loadChatHistory(chatno); // 초기 채팅 내역 로드
			chatHistoryInterval = setInterval(() => loadChatHistory(chatno), 1000); // 1초마다 채팅 내역 업데이트
		};
		
		ws.onclose = function(evt) {
			$('.sellChatting').empty();
		};
		
		ws.onmessage = function(evt) {
			try {
				// JSON 형식인 경우, 초기 채팅 내역을 렌더링
				const chatHistory = JSON.parse(evt.data);
				chatHistory.forEach(chat => {
//					console.log("파싱 결과 : " + chat.chatdate);
//					console.log("파싱 결과 : " + chat.mno);
//					console.log("파싱 결과 : " + chat.content);
					const date = new Date(chat.chatdate);
					const sqlDate = date.toLocaleDateString('en-CA');
					selllog("[" + sqlDate + "] : " + chat.content, chat.mno);
				});
			} catch (error) {
				console.log("에러 : " + error);
				// 단순 텍스트 메시지일 경우 바로 출력
				selllog(evt.data);
			}
			
		};
		
		ws.onerror = function(evt) {
			selllog('에러가 발생했습니다.' + evt);
		};
}

//채팅 내역을 로드하는 함수
function loadChatHistory(chatno) {
 fetch(`/used/chatHistory/${chatno}`) // 채팅 내역을 가져오는 API 엔드포인트
     .then(response => response.json())
     .then(data => {
         // 새로운 메시지만 선택하여 추가
         if (data.length > lastChatCount) {
             const newChats = data.slice(lastChatCount); // 새로운 메시지를 선택
             newChats.forEach(chat => {
                 const date = new Date(chat.chatdate);
                 const sqlDate = date.toLocaleDateString('en-CA');
                 selllog("[" + sqlDate + "] : " + chat.content, chat.mno);
             });
             lastChatCount = data.length; // 마지막 로드한 메시지 수 업데이트
         }
     })
     .catch(error => console.error('Error fetching chat history:', error));
}

function selllog(msg, myMno) {
//	console.log("전달 받은 mno : " + myMno);
//	console.log("전달 받은 mno 타입 : " + typeof(myMno));
//	console.log("세션 mno : " + mno.value);
//	console.log("세션 mno 타입 : " + typeof(mno.value));
//	console.log("전달 받은 msg : " + msg);
	// 전달받은 mno가 
	if(myMno == mno.value){
		$('.sellChatting').append(`
			<div class="myMsg"> ${msg}</div>		
		`);
	}else if(myMno === undefined){
		$('.sellChatting').append(`
				<div class="myMsg"> ${msg}</div>		
			`);
	}else {
		$('.sellChatting').append(`
			<div class="yourMsg"> ${msg}</div>		
		`);
	}
	
	$('.sellChatting').scrollTop($('.sellChatting')[0].scrollHeight);
}

function outChatting() {
	console.log("채팅 종료");
	const sellChatModal = document.getElementById('userShopChatting');
	sellChatModal.style.display = 'none';
	ws.close();
	clearInterval(chatHistoryInterval);
	lastChatCount = 0;
}

function gobtnMsg(chatno) {
	const msgJson = {
			msg : $('#sellmsg').val(),
			chatno : chatno,
			mno : mno.value
		};
		ws.send(JSON.stringify(msgJson));
		
		$('#sellmsg').val('');
		lastChatCount = 0;
}
