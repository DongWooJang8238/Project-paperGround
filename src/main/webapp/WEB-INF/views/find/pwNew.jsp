<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 비밀번호 설정 페이지</title>
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
	width: 300px;
	text-align: center;
}

.logo {
	text-align: center;
	margin-bottom: 20px;
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

.input-group input[type="text"], .input-group input[type="password"],
	.input-group input[type="email"], .input-group input[type="date"],
	.input-group input[type="tel"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.signup-btn {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 4px;
	background-color: #7fb5ff88;
	color: white;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 13px;
}

.signup-btn:hover {
	background-color: #0669ef88;
}

.input-group input.is-invalid {
	border-color: red; /* 잘못된 입력 필드에 빨간색 테두리 추가 */
}

.input-group input.is-valid {
	border-color: green; /* 선택 사항: 올바른 입력 필드에 녹색 테두리 추가 */
}

.required {
	color: red;
	font-weight: bold;
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
		<h2>
			<i class="bi bi-check-circle" style="color: #0669ef;"></i> 비밀번호 재설정
		</h2>
		<form action="#" >
			<div class="input-group">
				<label for="userPw">새 비밀번호<span class="required">*</span></label> <input type="password"
					id="userPw" name="userPw"
					placeholder="8 ~ 16자 영문, 숫자 조합" required>
				<div class="invalid-feedback" id="mPwValidState"></div>
			</div>

			<div class="input-group">
				<label for="confirm_password">새 비밀번호 재입력<span class="required">*</span></label> <input
					type="password" id="confirm_password" name="confirm_password"
					placeholder="비밀번호를 다시 한번 입력해주세요." required>
				<div class="invalid-feedback" id="mPwReValidState"></div>
				<input type="hidden" id="userId" name="userId" value="${userId }">
			</div>

			<button type="button" class="signup-btn" onclick="pwChange()">비밀번호 변경</button>
			
			<div class="notice">비밀번호는 8자 이상 16자 이하로, 영문자와 숫자를 포함해야 합니다.</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="/resources/js/find/newPw.js"></script>
</html>
