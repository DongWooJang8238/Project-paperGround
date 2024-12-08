<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
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
	margin-bottom: 45px;
	color: #333;
	font-weight: bold; /* 글꼴 두껍게 */
}

.input-group {
	margin-bottom: 15px;
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

.info-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 20px 0;
	font-size: 16px;
	color: #333;
}

.info-container .label {
	font-weight: bold;
	text-align: left;
}

.info-container .value {
	text-align: right;
	color: #555;
}

.value-id {
	color: #007bff; /* 아이디 색상 */
}

.checkbox-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 1px;
	font-size: 14px;
	color: #666;
	margin-bottom: 35px;
	flex-direction: row-reverse;
}

.checkbox-container a {
	color: #999;
	text-decoration: none;
	font-size: 12px;
}

.highlight {
	font-weight: bold; /* 글꼴 강조 */
	color: #0669ef; /* 파란색으로 설정 */
}
</style>
</head>
<body>
	<div class="signup-container">
		<div class="logo">
			<a href="/"><img src="../resources/images/logoHead.png" ></a>
		</div>
		<h2>
			<i class="bi bi-check-circle" style="color: #0669ef;"></i> 아이디 찾기 완료
		</h2>
		<div class="info-container">
			<span class="label">가입일</span> <span class="value">${vo.registerDate}</span>
		</div>
		<div class="info-container">
			<span class="label highlight">아이디</span> <span class="value value-id"><span
				class="highlight">${vo.userId}</span></span>
		</div>
		<form action="#" method="post">
			<button type="button" class="signup-btn" onclick="findPw()">비밀번호
				찾기</button>
			<div class="checkbox-container">
				<div>
					<a href="/User/login">로그인</a> | <a href="/User/signup">회원가입</a>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="/resources/js/find/goFindId.js"></script>
</body>
</html>
