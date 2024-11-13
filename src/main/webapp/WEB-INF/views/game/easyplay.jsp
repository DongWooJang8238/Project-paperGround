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
    justify-content: space-between;
    align-items: center;
    width: 60%; /* 버튼 영역을 더 넓게 */
    margin: 30px auto; /* 화면 가운데 정렬 및 위아래 여백 */
    padding: 0 30px; /* 버튼과 화면 끝 간격 확보 */
    box-sizing: border-box;
}

.btn-o, .btn-x {
    font-size: 2.5em; /* 버튼 크기 조정 */
    padding: 30px 60px; /* 버튼 패딩 증가로 더 크게 보이도록 */
    cursor: pointer;
    flex: 1;
    margin: 0 15px; /* 버튼 사이 간격을 조금 더 넓게 */
    text-align: center;
    border-radius: 10px; /* 버튼 모서리를 둥글게 */
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
     <h3>진행사항 : <span id="currentIndexDisplay">0</span> / 5</h3>


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

