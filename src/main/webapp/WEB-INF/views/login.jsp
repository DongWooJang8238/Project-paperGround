<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.login-container {
	width: 300px; /* 가로폭 줄이기 */
	text-align: center;
}

.logo img {
	width: 230px; /* 로고 크기 조정 */
	height: auto;
	margin-bottom: 20px;
}

.input-group {
	margin-bottom: 15px;
}

.input-group input {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
.login-btn {
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
.login-btn:hover {
background-color: #0669ef88;
}

.checkbox-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 15px;
	font-size: 14px;
	color: #666;
	margin-bottom: 35px;
}

.checkbox-container a {
	color: #999; /* 회색 텍스트 */
	text-decoration: none;
	font-size: 12px;
}

.checkbox-container a:hover {
	text-decoration: underline;
}

.social-login {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin: 20px 0;
}

.social-login img {
	width: 40px;
	height: 40px;
	cursor: pointer;
}

.notice {
	font-size: 12px;
	color: #888;
	margin-bottom: 20px;
}

.action-buttons {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.action-buttons button {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: white;
	cursor: pointer;
	font-weight: bold;
	height: 50px
}

.action-buttons .highlight {
	background-color: #e7f4fd;
	color: #007bc3;
	border-color: #007bc3;
	font-weight: bold;
}

/* 회원가입 버튼 마우스오버 효과 */
.action-buttons button:hover {
	background-color: #e7f4fd;
	color: #007bc3;
	border-color: #007bc3;
}
</style>
</head>
<body>
	<div class="login-container">
		<div class="logo">
			<a href="/"><img src="../resources/images/logoHead.png" alt="PG Logo"></a>
		</div>
		<form action="/login" method="post">
			<input id="urlPage" type="hidden" name="urlPage">
			<div class="input-group">
				<input type="text" id="userId" name="username" placeholder="아이디를 입력해 주세요." required>
				<div class="invalid-feedback" id="mIdValidState"></div>
			</div>
			<div class="input-group">
				<input type="password" id="userPw" name="password" placeholder="비밀번호를 입력해 주세요." required>
				<div class="invalid-feedback" id="mPwValidState"></div>
			</div>
			<c:if test="${param.error != null}">
				<div class="alert alert-danger" style="color: red; font-size: 12px;" >입력하신 정보가 일치하지 않습니다.<br> 다시 확인해 주세요.</div><br>
			</c:if>
			<button type="submit" class="login-btn" id="gologin">로그인</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="checkbox-container">
				<label> <input type="checkbox" name="remember-me">
					아이디 저장
				</label>
				<div>
					<a href="/User/findId">아이디 찾기</a> | <a href="/User/findPw">비밀번호 찾기</a>
				</div>
			</div>

			<div class="notice">개인정보 보호를 위해 공용 PC에서 사용 시 자동로그인을 해제해주세요.</div>
			<div class="action-buttons">
				<button type="button" class="signup-btn" id="goSignup">회원가입</button>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="/resources/js/login.js"></script>
</html>
