<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>
<!-- Bootstrap Icons CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
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
	background-color: #fff;
	padding: 20px;
	width: 400px;
}

.logo {
	text-align: center;
	margin-bottom: 20px;
}

.logo img {
	width: 230px; /* 로고 크기 조정 */
	height: auto;
}

.signup-container h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
	font-size: 20px;
}

.input-group {
	margin-bottom: 15px;
	position: relative;
}

.input-group label {
	display: block;
	margin-bottom: 5px;
	color: #333;
	font-size: 14px;
}

.input-group input[type="text"], .input-group input[type="password"],
	.input-group input[type="tel"], .input-group input[type="date"] {
	width: 100%;
	padding: 13px;
	border: 1px solid #ddd;
	border-radius: 6px;
	box-sizing: border-box;
	font-size: 14px;
}

.input-group .btn {
	position: absolute;
	right: 0;
	top: 68%; height : 44px;
	transform: translateY(-50%);
	padding: 5px 10px;
	border: 1px solid #ddd;
	background-color: #f9f9f9;
	border-radius: 4px;
	cursor: pointer;
	font-size: 12px;
	height: 44px;
}

.email-input-container {
	display: flex;
	align-items: center;
	gap: 5px;
}

.email-select {
	width: 100%; height : 45px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 6px;
	box-sizing: border-box;
	height: 45px;
}

.invalid-feedback {
	color: red;
	font-size: 12px;
	margin-top: 5px;
}

.check-group {
	border-top: 1px solid #ddd;
	padding-top: 10px;
	margin-top: 20px;
}

.check-group label {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
	color: #333;
	font-size: 14px;
}

.check-group input[type="checkbox"] {
	margin-right: 10px;
}

.all-agree {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
	font-weight: bold;
}

.all-agree input[type="checkbox"] {
	margin-right: 10px;
}

.signup-btn {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 6px;
	background-color: #7fb5ff88;
	color: white;
	font-size: 16px;
	cursor: pointer;
	height: 45px;
}

.signup-btn:hover {
	background-color: #2f6bbd88;
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

#modal button {
	cursor: pointer;
	position: absolute;
	bottom: 10px;
	right: 10px;
}

#selectAllCheckbox {
	color: #333;
	font-size: 17px
}

.checkboxAera {
	border-radius: 4px;
	border: 1px solid #ddd;
	padding: 12px 10px;
	color: #333;
	font-size: 12px
}

.termsCheckbox {
	margin-right: 10px;
}

#userEmail {
	color: #333;
}

.input-group input.is-invalid {
	border-color: red; /* 잘못된 입력 필드에 빨간색 테두리 추가 */
}

.input-group input.is-valid {
	border-color: green; /* 선택 사항: 올바른 입력 필드에 녹색 테두리 추가 */
	border: 2px solid;
}

.required {
	color: red;
	font-weight: bold;
}

/* 체크박스의 '필수' 부분 빨간색 표시 */
.termsCheckbox:after {
	content: " (필수)";
	color: red;
	font-weight: normal;
}

.checkbox-label input {
	margin-right: 10px;
	transform: scale(1.2); /* 체크박스 크기 키우기 */
}

.detail-btn:hover {
	color: #0056b3;
}

.detail-btn i {
	font-size: 20px;
}

.checkbox-row:last-child {
	border-bottom: none;
}

.detail-btn {
	background-color: transparent;
	border: none;
	cursor: pointer;
	font-size: 18px;
	color: #007bff;
	transition: color 0.3s;
}

.checkbox-label {
	display: flex;
	align-items: center;
}

.checkbox-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 6px;
	padding: 8px 0;
	border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
	<div class="signup-container">
		<div class="logo">
			<a href="/"><img src="../resources/images/logoHead.png"></a>
		</div>
		<h2>회원가입</h2>

		<form action="#" method="post">
			<div class="input-group">
    <label for="username">아이디<span class="required">*</span></label>
    <div style="position: relative;">
        <input type="text" id="userId" name="userId" placeholder="아이디 입력" required>
        <!-- 아이콘으로 대체한 중복확인 버튼 -->
        <i class="bi bi-check-circle" id="duplicateCkBtn" onclick="validateId()" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); font-size: 20px; cursor: pointer;"></i>
    </div>
    <div class="invalid-feedback" id="mIdValidState"></div>
</div>

			<div class="input-group">
				<label for="userPw">비밀번호<span class="required">*</span></label> <input
					type="password" id="userPw" name="userPw"
					placeholder="8 ~ 16자 영문, 숫자 조합" required>
				<div class="invalid-feedback" id="mPwValidState"></div>
			</div>

			<div class="input-group">
				<label for="confirm_password">비밀번호 재입력<span class="required">*</span></label>
				<input type="password" id="confirm_password" name="confirm_password"
					placeholder="비밀번호를 다시 한번 입력해주세요." required>
				<div class="invalid-feedback" id="mPwReValidState"></div>
			</div>

			<div class="input-group">
				<label for="userName">이름<span class="required">*</span></label> <input
					type="text" id="userName" name="userName" placeholder="이름 입력"
					required>
				<div class="invalid-feedback" id="mUserNameValudState"></div>
			</div>

			<!-- 이메일 입력란 -->
			<div class="input-group">
				<label for="userEmail">메일<span class="required">*</span></label>
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
					onclick="toggleAll(this)"> <label for="selectAllCheckbox"
					id="selectAllCheckbox">약관 모두 동의</label>
			</div>
			<br>
			<div class="checkboxAera">
				<div class="checkbox-row">
					<div class="checkbox-label">
						<input type="checkbox" id="termsCheckbox" name="terms"> <label
							for="termsCheckbox" class="termsCheckbox"> 페이버그라운드 이용약관
							</label>
					</div>
					<button type="button" onclick="goToDetailPage('페이퍼그라운드')"
						class="detail-btn">
						<i class="bi bi-chevron-bar-right"></i>
					</button>
				</div>
				<div class="checkbox-row">
					<div class="checkbox-label">
						<input type="checkbox" id="privacyCheckbox" name="privacy">
						<label for="privacyCheckbox" class="termsCheckbox"> 커뮤니티
							이용약관 </label>
					</div>
					<button type="button" onclick="goToDetailPage('커뮤니티')"
						class="detail-btn">
						<i class="bi bi-chevron-bar-right"></i>
					</button>
				</div>
				<div class="checkbox-row">
					<div class="checkbox-label">
						<input type="checkbox" id="marketingCheckbox" name="marketing">
						<label for="marketingCheckbox" class="termsCheckbox"> 개인정보
							수집 및 이용동의 </label>
					</div>
					<button type="button" onclick="goToDetailPage('마케팅')"
						class="detail-btn">
						<i class="bi bi-chevron-bar-right"></i>
					</button>
				</div>
			</div>

			<!-- 모달 창 -->
			<div id="modal"
				style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); justify-content: center; align-items: center;">
				<div
					style="background: white; padding: 20px; max-width: 600px; width: 90%; position: relative;">
					<h3 id="modalTitle"></h3>
					<p id="modalContent"></p>
					<button type="button" onclick="closeModal()"
						style="position: absolute; bottom: 10px; right: 10px;">창
						닫기</button>
				</div>
			</div>
			<br>
			<button type="button" class="signup-btn" onclick="signup()">회원가입</button>

		</form>
	</div>
</body>
<script type="text/javascript" src="/resources/js/signup.js"></script>
</html>
