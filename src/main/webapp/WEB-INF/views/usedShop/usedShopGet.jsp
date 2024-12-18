<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 Get 페이지</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/usedShopGet.css">
</head>
<body>

	<jsp:include page="../layout/header.jsp" />

	<div class="body-container">
		<div class="title-area">
			<table>
				<thead>
					<tr>
						<td>제목</td>
						<th>${ubvo.title}</th>
					</tr>
					<tr>
						<td>판매자</td>
						<th>${sellUser.nickName}</th>
					</tr>
					<tr>
						<td>장르</td>
						<th><c:choose>
								<c:when test="${ubvo.gno == 1}">소설</c:when>
								<c:when test="${ubvo.gno == 2}">역사</c:when>
								<c:when test="${ubvo.gno == 3}">과학</c:when>
								<c:when test="${ubvo.gno == 4}">예술</c:when>
								<c:when test="${ubvo.gno == 5}">철학</c:when>
								<c:when test="${ubvo.gno == 6}">자기계발</c:when>
								<c:when test="${ubvo.gno == 7}">기술/공학</c:when>
								<c:when test="${ubvo.gno == 8}">경제/경영</c:when>
								<c:when test="${ubvo.gno == 9}">사회과학</c:when>
								<c:when test="${ubvo.gno == 10}">종교</c:when>
							</c:choose></th>
					</tr>
					<tr>
						<td>등록일</td>
						<th>${ubvo.ubookDate}</th>
					</tr>
					<tr>
						<td>상태</td>
						<th><c:choose>
								<c:when test="${ubvo.status == '0'}">판매 완료</c:when>
								<c:when test="${ubvo.status == '1'}">미개봉 새상품</c:when>
								<c:when test="${ubvo.status == '2'}">새 상품에 가까움</c:when>
								<c:when test="${ubvo.status == '3'}">사용감 적음, 컨디션 양호</c:when>
								<c:when test="${ubvo.status == '4'}">사용감 있음, 컨디션 양호</c:when>
								<c:when test="${ubvo.status == '5'}">사용감 많음, 스크레치 등 존재</c:when>
							</c:choose></th>
					</tr>
				</thead>
			</table>
		</div>

		<div class="item-info">
			<p>${ubvo.content}</p>
		</div>

		<!-- 이미지 갤러리 -->
		<div class="image-gallery">
			<button class="prev" onclick="prevSlide()">&#10094;</button>
			<div class="slide-container">
				<c:forEach var="img" items="${ubvo.usedBookImgs}" varStatus="status">
					<div class="slide">
						<img src="${img.ubookimage}" alt="Used Book Image"
							onclick="openModal(${status.index})">
					</div>
				</c:forEach>
			</div>
			<button class="next" onclick="nextSlide()">&#10095;</button>
		</div>

		<p class="item-price">판매 금액 : <fmt:formatNumber value="${ubvo.ubookPrice}" type="number" pattern="#,###" /> 원</p>
		
		<!-- 모달 창 -->
		<div id="imageModal" class="modal">
			<span class="close" onclick="closeModal()">&times;</span>
			<button class="modal-prev" onclick="prevModalSlide()">&#10094;</button>
			<div class="modal-content">
				<img id="modalImage" src="" alt="Large Image">
			</div>
			<button class="modal-next" onclick="nextModalSlide()">&#10095;</button>
		</div>


	</div>
	
	<!-- 화면 우측에 고정되서 따라오는 모달 open 버튼 ( 채팅 등 ) -->
	<div class="userShopSidebar">
			<c:choose>
				<c:when test="${sellUser.mno == uservo.mno}">
					<button onclick="myChattingList(${ubvo.ubno}, ${uservo.mno})">내 채팅 방 보기</button>
					<button onclick="sellSuccess(${ubvo.ubno});">판매완료</button>
					<%-- <button onclick="deleteUsed(${ubvo.ubno});">삭제</button> --%>
				</c:when>
				<c:otherwise>
					<c:if test="${wish > 0 }">
						<h1 class="wishList" onclick="jjim(${ubvo.ubno},${uservo.mno});" style="color: red;">♥</h1>
					</c:if>
					<c:if test="${wish == 0 }">
						<h1 class="wishList" onclick="jjim(${ubvo.ubno},${uservo.mno});" style="color: white;">♥</h1>
					</c:if>
					<br>
					<button type="button" class="in" id="btnConnect">채팅하기</button>
				</c:otherwise>
			</c:choose>
					<button type="button" class="in" onclick="goList();">목록으로 가기</button>
	</div>
	
	<!-- 기존 모달 형태로 존재하다가 내 채팅방 보기를 누르면 바로 옆에 보여주기 -->
	<div class="userShopChattingRoom" id="userShopChatting">
		<h1>상대방 유저명</h1>
		<button type="button" class="out" onclick="outChatting();"></button>
		<hr>
		<div class="sellChatting"></div>
		<div class="input-container">
			<input type="text" class="long" id="sellmsg">
			<button type="button" onclick="gobtnMsg()"></button>
		</div>
	</div>
	
	<!-- 판매 완료 모달 구조 -->
	<div id="sellSuccessModal" class="sell-complete-modal">
		  <div class="sell-complete-modal-content">
			    <p>판매 완료로 처리하시겠습니까, 아니면 삭제하시겠습니까?</p>
			    <button id="sellCompleteBtn">판매 완료</button>
			    <button id="sellDeleteBtn">삭제</button>
			    <button id="sellCancelBtn">취소</button>
		  </div>
	</div>

	

	<div id="chatingModal" class="chating">
		<!-- 실시간 1:1 채팅 -->
		<h1>
			${sellUser.nickName}
		</h1>
		<!-- 종료 버튼 -->
		<div>
			<button type="button" class="out" id="btnDisConnect">종료하기</button>
		</div>
		<hr>
		<div class="message full">
			<!-- 내 메시지 ( 영역 왼쪽에 표시 ) -->
			<!-- 상대 메시지 ( 영역 오른쪽에 표시 ) -->
		</div>

		<!-- 내 메시지 입력 부분 -->
		<div class="input-container">
			<input type="text" class="long" id="msg">
			<button type="button" id="btnMsg">전송</button> 
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />

</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

		const url = 'ws://localhost:9090/testserver.do?ubno=' + ${ubvo.ubno} + '&sellmno=' + ${ubvo.mno} + '&buymno=' + ${uservo.mno};
		let ws; //웹 소켓 참조 변수
		let chatHistoryInterval;

        
		$('#btnConnect').click(function() {
			if(mno.value === ""){
				alert('로그인이 필요한 기능입니다!');
				return;
			}else{
			const chatModal = document.getElementById('chatingModal');
		    chatModal.style.display = 'block';
		    
		    const longInputs = document.querySelector('#msg');
			const goSellBtn = document.querySelector('#btnMsg');
			
			longInputs.addEventListener('keydown', e => {
					console.log('키다운확인' + e.key);
					if(e.key === 'Enter'){
						goSellBtn.click();
					}
			});
			
			ws = new WebSocket(url);
			
			ws.onopen = function(evt) {
				log('서버와 연결하였습니다.');
				console.log('서버와 연결하였습니다.');
				// 채팅 내역을 1초마다 로드하도록 설정
				loadChatHistoryBuy(${ubvo.ubno},${uservo.mno},${ubvo.mno}); // 초기 채팅 내역 로드
		        chatHistoryInterval = setInterval(() => loadChatHistoryBuy(${ubvo.ubno},${uservo.mno},${ubvo.mno}), 1000); // 1초마다 채팅 내역 업데이트
				
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
						console.log("파싱 결과 : " + chat.chatno);
						const date = new Date(chat.chatdate);
						const sqlDate = date.toLocaleDateString('en-CA');
						log("[" + sqlDate + "] : " + chat.content, chat.mno);
					});
				} catch (error) {
					console.log("에러 : " + error);
					// 단순 텍스트 메시지일 경우 바로 출력
					log(evt.data);
				}
				
			};
			
			ws.onerror = function(evt) {
				log('에러가 발생했습니다.' + evt);
			};
		}
		});
		
		let lastChatCountBuy = 0;
		
		//채팅 내역을 로드하는 함수
		function loadChatHistoryBuy(ubno, buymno, sellmno) {
		 fetch(`/used/chatHistoryBuy/` + ubno + "/" + buymno + "/" + sellmno) // 채팅 내역을 가져오는 API 엔드포인트
		     .then(response => response.json())
		     .then(data => {
		         // 새로운 메시지만 선택하여 추가
		         console.log('탈까?');
		         if (data.length > lastChatCountBuy) {
		             const newChats = data.slice(lastChatCountBuy); // 새로운 메시지를 선택
		             newChats.forEach(chat => {
		                 const date = new Date(chat.chatdate);
		                 const sqlDate = date.toLocaleDateString('en-CA');
		                 console.log("채팅 내용 : " + chat.content);
		                 log("[" + sqlDate + "] : " + chat.content, chat.mno);
		             });
		             lastChatCountBuy = data.length; // 마지막 로드한 메시지 수 업데이트
		         }
		     })
		     .catch(error => console.error('Error fetching chat history:', error));
		}
		
		$('#btnDisConnect').click(function() {
			console.log('채팅 종료');
			const chatModal = document.getElementById('chatingModal');
		    chatModal.style.display = 'none';
			ws.close();
			clearInterval(chatHistoryInterval);
			lastChatCountBuy = 0;
		});
		
		function log(msg, mno) {
			console.log("전달 받은 mno : " + mno);
			console.log("전달 받은 msg : " + msg);
			// 전달받은 mno가 
			if(mno == ${uservo.mno}){
				$('.message').append(`
					<div class="myMsg"> \${msg}</div>		
				`);
			}else if(mno === undefined){
				$('.message').append(`
						<div class="myMsg"> ${msg}</div>		
					`);
			}
				else {
				$('.message').append(`
					<div class="yourMsg"> \${msg}</div>		
				`);
			}
			
			$('.message').scrollTop($('.message')[0].scrollHeight);
		}
		
		$('#btnMsg').click(function() {
			const msgJson = {
				msg : $('#msg').val(),
				sellmno : ${ubvo.mno},
				buymno : ${uservo.mno},
				ubno : ${ubvo.ubno}
			};
			ws.send(JSON.stringify(msgJson));
			
			$('#msg').val('');
		});
		
	</script>
<script type="text/javascript"
	src="/resources/js/usedShop/usedShopGet.js"></script>
<script type="text/javascript"
	src="/resources/js/chatting/chatting.js"></script>
</html>
