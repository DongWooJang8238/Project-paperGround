<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 Get 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/usedShopGet.css">
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
                        <th>
                            <c:choose>
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
                            </c:choose>
                        </th>
                    </tr>
                    <tr>
                        <td>등록일</td>
                        <th>${ubvo.ubookDate}</th>
                    </tr>
                    <tr>
                        <td>상태</td>
                        <th>
                            <c:choose>
                                <c:when test="${ubvo.status == 'new'}">미개봉 새상품</c:when>
                                <c:when test="${ubvo.status == 'excellent'}">새 상품에 가까움</c:when>
                                <c:when test="${ubvo.status == 'good'}">사용감 적음, 컨디션 양호</c:when>
                                <c:when test="${ubvo.status == 'fair'}">사용감 있음, 컨디션 양호</c:when>
                                <c:when test="${ubvo.status == 'worn'}">사용감 많음, 스크레치 등 존재</c:when>
                            </c:choose>
                        </th>
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
				        <img src="${img.ubookimage}" alt="Used Book Image" onclick="openModal(${status.index})">
				    </div>
				</c:forEach>
		    </div>
		    <button class="next" onclick="nextSlide()">&#10095;</button>
		</div>

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

    <div class="bottom-bar">
        <h1 onclick="jjim(${ubvo.ubno},${vo.mno});">♥</h1>
        <p class="item-price">판매 금액 : ${ubvo.ubookPrice} 원</p>
        <button onclick="chat(${ubvo.ubno},${sellUser.mno},${sessionScope.vo.mno});">채팅하기</button>
        <c:choose>
            <c:when test="${sellUser.mno == vo.mno}">
                <button onclick="sellSuccess(${ubvo.ubno});">판매완료</button>
                <button onclick="deleteUsed(${ubvo.ubno});">삭제</button>
            </c:when>
        </c:choose>
    </div>

	<div id="chatingModal" class="chating">
	 	<span class="closeChat" onclick="closeChatModal()">&times;</span> <!-- 모달 닫기 버튼 -->
		<div class="chatHeader">
        	채팅방 번호: <span id="roomNumber">12345</span>
   		</div>
	    <div class="chatBody" id="chatBody">
	        <!-- 채팅 내용 -->
	        <div class="message otherMessage">
	            <div>상대방 채팅 내용</div>
	            <div style="font-size: smaller;">2024-10-24 12:00</div>
	        </div>
	        <div class="message myMessage">
	            <div>내 채팅 내용</div>
	            <div style="font-size: smaller;">2024-10-24 12:01</div>
	        </div>
	        <!-- 여기에 채팅 메시지를 동적으로 추가합니다 -->
	    </div>
	    <div class="chatFooter">
	        <input type="text" id="chatInput" placeholder="메시지를 입력하세요..." />
	        <button onclick="sendMessage()">보내기</button>
	    </div>
	</div>    
    <jsp:include page="../layout/footer.jsp" />

</body>
<script src="https://code.jquery.com/jquery-1.12.4.js" ></script>
<script type="text/javascript" src="/resources/js/usedShop/usedShopGet.js"></script>
</html>
