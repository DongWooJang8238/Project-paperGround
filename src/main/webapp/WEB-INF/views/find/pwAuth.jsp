<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 인증번호 페이지</title>
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

.logo {
	text-align: center;
	margin-bottom: 20px;
	text-decoration: none;
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
	display: flex;
}

.input-group input[type="text"] {
    width: 100%; /* 전체 너비로 맞춤 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
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
		<h2>비밀번호 찾기</h2>
		<form action="#">
			<div class="input-group">
				<label for="pwAuth">인증번호</label> 
				<input type="text" id="pwAuth" name="pwAuth" placeholder="인증번호를 입력하세요" required>
					<div class="invalid-feedback" id="mPwAuthValidState"></div>
					<input type="hidden" id="num" name="num" value="${model }">
					<input type="hidden" id="userId" name="userId" value="${userId }">
			</div>

			<button type="button" class="signup-btn" onclick="pwAuthCheck()">확인</button>
			
					<div class="checkbox-container">
				<div>
					<a href="/User/login">로그인</a> | <a href="/User/signup">회원가입</a>
				</div>
			</div>
			
			<div class="notice">비밀번호를 잊으셨나요? 등록하신 이메일과 아이디를 입력하시면 비밀번호를 재설정할 수 있습니다.</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="/resources/js/find/pwAuth.js"></script>
</html>
