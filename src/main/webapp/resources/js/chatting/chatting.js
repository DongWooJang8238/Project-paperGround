const chattingRoom = document.querySelector('.userShopChattingRoom');

console.log(mno.value);

function myChattingList(ubno, mymno) {
	console.log('판매자 채팅이오..');
	console.log('판매 상품 번호..' + ubno);
	console.log('판매자 번호..' + mymno);
	
	fetch(`/used/sellChat/${ubno}/${mymno}`)
	  .then(response => response.json()) // 응답을 JSON 형식으로 파싱
	  .then(data => {
		  let str = '';
		  data.forEach(dto => {
			  console.log(dto.buymno);
			  console.log(dto.userName);
			  console.log(dto.chatno);
			  // div에 박스 형태 만들어주기 ( css )
			  str += `<div class="chattingRoom" onclick="goChatting( ${dto.chatno} )">`;
			  str += `<h3>${dto.userName}님 과의 대화</h3>`;
			  str += `</div>`;
		  });
		  chattingRoom.innerHTML = str;
	  })
	  .catch(error => console.error('Error:', error));
}

function goChatting( chatno ) {
	
		let str = 
			`<button type="button" class="out" onclick="outChatting();">나가기</button>
			<hr>
			<div class="sellChatting"></div>
			<div>
				<input type="text" class="long" id="sellmsg">
				<button type="button" onclick="gobtnMsg(${chatno})">전송</button>
			</div>`;
		chattingRoom.innerHTML = str;
		// url 주소 변경 필요
		// 내일 오면 웹소켓 서버 하나 더 만들어서 판매자용으로 만들것!
		let sellurl = `ws://localhost:9090/sellserver.do?chatno=${chatno}`;
		ws = new WebSocket(sellurl);
		
		ws.onopen = function(evt) {
			selllog('서버와 연결하였습니다.');
		};
		
		ws.onclose = function(evt) {
			$('.message').empty();
		};
		
		ws.onmessage = function(evt) {
			try {
				// JSON 형식인 경우, 초기 채팅 내역을 렌더링
				const chatHistory = JSON.parse(evt.data);
				chatHistory.forEach(chat => {
					console.log("파싱 결과 : " + chat.chatdate);
					console.log("파싱 결과 : " + chat.mno);
					console.log("파싱 결과 : " + chat.content);
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

function selllog(msg, myMno) {
	console.log("전달 받은 mno : " + myMno);
	console.log("전달 받은 mno 타입 : " + typeof(myMno));
	console.log("세션 mno : " + mno.value);
	console.log("세션 mno 타입 : " + typeof(mno.value));
	console.log("전달 받은 msg : " + msg);
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
	ws.close();
}

function gobtnMsg(chatno) {
	const msgJson = {
			msg : $('#sellmsg').val(),
			chatno : chatno,
			mno : mno.value
		};
		ws.send(JSON.stringify(msgJson));
		
		$('#msg').val('');
}
