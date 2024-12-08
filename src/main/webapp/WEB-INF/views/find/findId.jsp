<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.signup-container {
	width: 300px; /* 가로폭 줄이기 */
	text-align: center;
}

.logo img {
	width: 230px; /* 로고 크기 조정 */
	height: auto;
}

.logo a {
	font-size: 24px;
	color: #333;
	text-decoration: none;
}

.signup-container h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

.input-group {
	margin-bottom: 15px;
}

.input-group label {
	display: block;
	margin-bottom: 5px;
	color: #666;
}

.input-group input[type="text"], .input-group input[type="email"] {
    width: 100%; /* 전체 너비로 맞춤 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.input-group input[type="email"] {
    width: 100%; /* 전체 너비로 맞춤 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

/* 이메일 입력란 스타일 */
.email-group {
	margin-bottom: 15px; /* 아래쪽 여백 */
}


.email-select {
	width: 100px; /* 고정 폭 */
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	height: 40px; /* 높이 일치 */
	display: inline-block; /* 인라인 블록으로 표시 */
}


.signup-btn {
	width: 100%;
	padding: 10px;
	background-color: #7fb5ff88;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	font-weight: bold;
	color: #fff;
	cursor: pointer;
	margin-bottom: 15px;
	height: 50px
}

.signup-btn:hover {
	background-color: #0669ef88;
}

/* 버튼과 링크 사이 공백 추가 */
.checkbox-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 1px; /* 공백 추가 */
    font-size: 14px;
    color: #666;
    margin-bottom : 35px;
    flex-direction : row-reverse;
}

.checkbox-container a {
    color: #999;
    text-decoration: none;
    font-size: 12px;
}

.notice {
	font-size: 12px;
	color: #888;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="signup-container">
		<div class="logo">
			<a href="/"><img src="../resources/images/logoHead.png" ></a>
		</div>
		<h2>아이디 찾기</h2>
		<form action="#" method="post">
			<div class="input-group">
				<label for="userName"></label> <input type="text" id="userName"
					name="userName" placeholder="이름 입력을 입력해 주세요" required>
				<div class="invalid-feedback" id="mUserNameValudState"></div>
			</div>
			<input type="hidden" id="userId" name="usedId">

			<div class="input-group">
				<label for="userEmail"></label>
				<div style="display: flex; align-items: flex-start; flex-direction: column;">
					<input type="Email" id="userEmail" name="userEmail"
						placeholder="이메일 주소를 입력해 주세요" class="email-input" required>
					<div class="invalid-feedback" id="mUserEmailValudState"></div>
				</div>
			</div>

			<button type="button" class="signup-btn" onclick="findId()">아이디
				찾기</button>
				
				
			<div class="checkbox-container">
				<div>
					<a href="/User/login">로그인</a> | <a href="/User/signup">회원가입</a>
				</div>
			</div>
			
			<div class="notice">아이디를 잊으셨나요? 등록하신 이메일과 이름을 입력하시면 아이디를 확인할 수 있습니다.</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="/resources/js/find/findId.js"></script>
</html>
