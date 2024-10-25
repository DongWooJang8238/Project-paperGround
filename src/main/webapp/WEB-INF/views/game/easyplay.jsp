<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Easy Play</title>
   <style>
        /* 퀘스트 출력을 가운데 정렬 */
        #questContainer {
            display: flex;
            flex-direction: column;
            align-items: center; /* 수평 가운데 정렬 */
            justify-content: center; /* 수직 가운데 정렬 */
            height: 40vh; /* 높이 조정: 40vh */
        }

        .quest {
            display: none; /* 처음에 숨김 */
            font-size: 3em; /* 글씨 크기 증가 */
            text-align: center; /* 텍스트 가운데 정렬 */
            margin: 20px; /* 여백 추가 */
        }

         .buttons {
            display: flex;
            justify-content: space-around; /* 버튼 간격 조정 */
            position: fixed; /* 버튼 고정 위치 */
            top: 50%; /* 수직 중앙 위치 */
            left: 50%; /* 수평 중앙 위치 */
            transform: translate(-50%, -50%); /* 중앙 정렬 조정 */
            width: 20%; /* 버튼 간격을 위해 너비 조정 */
        }

        .btn-o, .btn-x {
            font-size: 3em; /* 버튼 크기: 1.5배 증가 */
            padding: 30px 60px; /* 버튼 패딩 증가 */
            cursor: pointer; /* 마우스 커서 변경 */
        }

        .btn-o {
            background-color: blue; /* O 버튼 색상 */
            color: white; /* O 버튼 텍스트 색상 */
        }

        .btn-x {
            background-color: darkorange; /* X 버튼 색상 */
            color: white; /* X 버튼 텍스트 색상 */
        }
    </style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

    <h1>게임 모드: easy</h1>
    <h2>장르: ${gameJenre}</h2>

    <div id="questContainer">
        <c:forEach var="gvo" items="${questList}">
            <div class="quest" style="display:none;">
                <h3>Quest: ${gvo.gameQuest}</h3>
                <input type="hidden" class="correctAnswer" value="${gvo.gameAnswer}" />
            </div>
        </c:forEach>
    </div>

    <div class="buttons">
        <!-- 버튼에 id 추가 -->
        <button id="btn-o" class="btn-o">O</button>
        <button id="btn-x" class="btn-x">X</button>
    </div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/game/easyplay.js"></script>
</body>
</html>

