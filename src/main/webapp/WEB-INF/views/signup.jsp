<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.signup-container {
	background-color: #fff;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 400px;
}

.logo {
	text-align: center;
	margin-bottom: 20px;
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

.input-group input[type="text"], .input-group input[type="password"],
	.input-group input[type="date"], .input-group input[type="tel"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.email-input {
	width: calc(100% - 110px); /* 전체 폭에서 '@'와 도메인 입력란의 너비를 뺀 나머지 부분 */
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

/* 이메일 입력 컨테이너 */
.email-input-container {
	display: flex;
	align-items: center;
	gap: 10px; /* @와 이메일 도메인 입력란 간의 간격 */
	margin-bottom: 15px;
}

/* 이메일 입력란 스타일 */
.email-group {
	margin-bottom: 15px; /* 아래쪽 여백 */
}

span {
	font-size: 18px;
	color: #333;
}

.email-select {
	width: 120px; /* 고정 너비 */
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.invalid-feedback {
	color: red;
	font-size: 12px;
	display: block;
}

.gender-group {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 15px;
}

.gender-group input[type="radio"] {
	margin-right: 5px;
}

.signup-btn {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 4px;
	background-color: #4CAF50;
	color: white;
	font-size: 16px;
	cursor: pointer;
}

.signup-btn:hover {
	background-color: #45a049;
}

.input-group input.is-invalid {
	border-color: red; /* 잘못된 입력 필드에 빨간색 테두리 추가 */
}

.input-group input.is-valid {
	border-color: green; /* 선택 사항: 올바른 입력 필드에 녹색 테두리 추가 */
}

#modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center;
}

#modal div {
	background: white;
	padding: 20px;
	max-width: 600px;
	width: 90%;
	position: relative;
}

button {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="signup-container">
		<div class="logo">
			<a href="/"><img src="/resources/images/PAGE_GROUND.png"
				style="width: 100px; height: 100px;"></a>
		</div>
		<h2>회원가입</h2>

		<form action="#" method="post">
			<div class="input-group">
				<label for="username">아이디</label> <input type="text" id="userId"
					name="userId" placeholder="아이디 입력" required>
				<button class="btn btn-outline-secondary" type="button"
					id="duplicateCkBtn" onclick="validateId()">중복확인</button>
				<div class="invalid-feedback" id="mIdValidState"></div>
			</div>

			<div class="input-group">
				<label for="userPw">비밀번호</label> <input type="password" id="userPw"
					name="userPw" placeholder="8 ~ 16자 영문, 숫자 조합" required>
				<div class="invalid-feedback" id="mPwValidState"></div>
			</div>

			<div class="input-group">
				<label for="confirm_password">비밀번호 재입력</label> <input
					type="password" id="confirm_password" name="confirm_password"
					placeholder="비밀번호를 다시 한번 입력해주세요." required>
				<div class="invalid-feedback" id="mPwReValidState"></div>
			</div>

			<div class="input-group">
				<label for="userName">이름</label> <input type="text" id="userName"
					name="userName" placeholder="이름 입력" required>
				<div class="invalid-feedback" id="mUserNameValudState"></div>
			</div>

			<!-- 이메일 입력란 -->
			<div class="input-group">
				<label for="userEmail">메일</label>
				<div style="display: flex; align-items: center;">
					<input type="text" id="userEmail" name="userEmail"
						placeholder="이메일 주소" class="email-input" required>
					<div class="invalid-feedback" id="mUserEmailValudState"></div>
					<!-- 에러 메시지 -->
				</div>
				<span>@</span> <input list="emailOptions" id="emailDomain"
					placeholder="이메일을 선택하거나 입력하세요" class="email-select">
				<div class="invalid-feedback" id="mUserDomainValudState"></div>
				<datalist id="emailOptions">
					<option value="naver.com">
					<option value="gmail.com">
					<option value="daum.net">
					<option value="nate.com">
				</datalist>
			</div>
			<!--        <div class="gender-group">
                <label>성별</label>
                <input type="radio" id="man" name="gender" value="man" required>
                <label for="man">남</label>
                <input type="radio" id="woman" name="gender" value="woman" required>
                <label for="woman">여</label>
            </div> -->

			<!--         <div class="input-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="address" placeholder="주소 입력" required>
            </div>
             -->
			<!--       <div class="input-group">
                <label for="phone">전화번호</label>
                <input type="tel" id="phone" name="phone" placeholder="전화번호 ( ' - ' 제외 )" maxlength="11" required>
            </div> -->

			<!--             <div class="input-group">
                <label for="birthdate">생년월일</label>
                <input type="date" id="birthdate" name="birthdate" required>
            </div> -->
			<div style="display: flex; align-items: center;">
				<input type="checkbox" id="selectAllCheckbox"
					onclick="toggleAll(this)"> <label for="selectAllCheckbox">전체
					선택</label>
			</div>

			<div style="display: flex; align-items: center;">
				<input type="checkbox" id="termsCheckbox" name="terms"> <label
					for="termsCheckbox">[필수] 페이버그라운드 이용약관</label>
				<button type="button" onclick="goToDetailPage('페이퍼그라운드')">></button>
			</div>
			<div style="display: flex; align-items: center;">
				<input type="checkbox" id="privacyCheckbox" name="privacy">
				<label for="privacyCheckbox">[필수] 커뮤니티 이용약관</label>
				<button type="button" onclick="goToDetailPage('커뮤니티')">></button>
			</div>
			<div style="display: flex; align-items: center;">
				<input type="checkbox" id="marketingCheckbox" name="marketing">
				<label for="marketingCheckbox">[필수] 개인정보 수집 및 이용동의</label>
				<button type="button" onclick="goToDetailPage('마케팅')">></button>
			</div>

			<!-- 모달 창 -->
			<div id="modal"
				style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); justify-content: center; align-items: center;">
				<div
					style="background: white; padding: 20px; max-width: 600px; width: 90%; position: relative;">
					<h3 id="modalTitle"></h3>
					<p id="modalContent"></p>
					<button onclick="closeModal()"
						style="position: absolute; bottom: 10px; right: 10px;">창
						닫기</button>
				</div>
			</div>

			<button type="button" class="signup-btn" onclick="signup()">회원가입</button>

		</form>
	</div>
</body>
<script type="text/javascript" src="/resources/js/signup.js"></script>
</html>
