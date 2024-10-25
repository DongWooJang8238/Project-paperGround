<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 실행 페이지</title>
  <style>
        /* 퀘스트 출력을 가운데 정렬 */
        #questContainer {
            display: flex;
            flex-direction: column;
            align-items: center; /* 수평 가운데 정렬 */
            justify-content: 20vh; /* 수직 가운데 정렬 */
            height: 20vh; /* 전체 높이의 60%로 설정 */
            margin-top: 20px; /* 위쪽 여백 추가 */
        }

        .quest {
            display: none; /* 처음에 숨김 */
            font-size: 4em; /* 글씨 크기 4배 증가 */
            text-align: center; /* 텍스트 가운데 정렬 */
            margin: 20px; /* 여백 추가 */
        }

        #answerContainer {
            display: flex;
            flex-direction: column;
            align-items: center; /* 수평 가운데 정렬 */
            margin-top: 20px; /* 퀘스트 아래에 여백 추가 */
        }

        #answerInput {
            font-size: 2em; /* 입력창 글씨 크기 증가 */
            padding: 10px; /* 입력창 패딩 증가 */
            width: 300px; /* 입력창 너비 설정 */
            margin-bottom: 10px; /* 버튼과의 간격 조정 */
        }

        #submitButton {
            font-size: 2em; /* 버튼 크기 증가 */
            padding: 10px 20px; /* 버튼 패딩 증가 */
            cursor: pointer; /* 마우스 커서 변경 */
        }
        #backButton {
            bottom: 20px;
            right: 0;
            font-size: 1.5em;
            padding: 10px 20px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	 <h1>게임 모드: nomal</h1>
    <h2>장르: ${gameJenre}</h2>

	<input type="hidden" class="userMno" value="${mno}" />

    
	<div id="questContainer">
        <c:forEach var="gvo" items="${questList}">
            <div class="quest" style="display:none;">
                <h3> Quest: ${gvo.gameQuest}</h3>
                <input type="hidden" class="correctAnswer" value="${gvo.gameAnswer}" />
            </div>
        </c:forEach>
    </div>

    <div id="answerContainer">
        <input type="text" id="answerInput" placeholder="정답 입력" />
        <button type="button" id="submitButton" onclick="checkAnswer()">정답 제출</button>
    </div>
    
	<div>	
   		<button id="backButton" class="backButton"  onclick="goBack()">뒤로가기</button>
	 </div>
	 
<jsp:include page="../layout/footer.jsp"></jsp:include>

		<script type="text/javascript" src="/resources/js/game/nomalplay.js"></script>
	<script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("answerInput").addEventListener("keypress", function(event) {
                if (event.key === "Enter") {
                    const submitButton = document.getElementById("submitButton");
                    if (submitButton) {
                        submitButton.click(); // 버튼 클릭 함수 호출
                    }
                }
            });
        });
    </script>
</body>
</html>