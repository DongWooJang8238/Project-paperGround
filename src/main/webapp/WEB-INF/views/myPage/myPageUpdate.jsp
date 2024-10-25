<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/myPage.css">
<title>마이페이지</title>
<style type="text/css">

/* 메인 콘텐츠 */
.main-content {
	width: 100%;
	max-width: 800px;
	margin: 30px auto;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 제목 스타일 */
.header h1 {
	text-align: center;
	font-size: 24px;
	color: #333;
	margin-bottom: 20px;
}

/* 입력 그룹 */
.input-group, .email-group {
	margin-bottom: 20px;
}

.input-group label, .email-group label {
	font-size: 14px;
	color: #555;
	margin-bottom: 5px;
	display: block;
}

/* 인풋 필드 스타일 */
.input-group input, .email-group input {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
	outline: none;
	transition: border-color 0.3s;
}

.input-group input:focus, .email-group input:focus {
	border-color: #38b2ac;
}

/* 이메일 입력 스타일 */
.email-group {
	display: flex;
	flex-direction: column;
}

.email-group div {
	display: flex;
	align-items: center;
}

.email-input {
	flex: 1;
	margin-right: 5px;
}

#emailDomain {
	flex: 1;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
	outline: none;
	transition: border-color 0.3s;
}

#emailDomain:focus {
	border-color: #38b2ac;
}

/* 버튼 스타일 */
.btn {
	background-color: #38b2ac;
	color: #fff;
	padding: 8px 12px;
	font-size: 14px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn:hover {
	background-color: #319795;
}

.btn-outline-secondary {
	background-color: #fff;
	color: #555;
	border: 1px solid #ddd;
}

.btn-outline-secondary:hover {
	background-color: #f0f0f0;
}

/* 중복 확인 버튼 스타일 */
#duplicateCkBtn {
	margin-left: 10px;
	padding: 10px 15px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

#duplicateCkBtn:hover {
	background-color: #f8f8f8;
	color: #333;
}

/* 에러 메시지 스타일 */
.invalid-feedback {
	color: #ff5a5a;
	font-size: 12px;
	margin-top: 5px;
}

/* 기타 필드 스타일 */
#birthdate {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
	width: 100%;
}

#birthdate:focus {
	border-color: #38b2ac;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Main content -->
	<form method="post">
		<div class="main-content">
			<div class="header">
				<h1
					style="color: #ffffff; text-align: center; font-size: 24px; margin-bottom: 20px;">
					${vo.userId }님은 기본 등급입니다. 수정페이지에용</h1>
			</div>

			<div class="input-group">
				<label for="username">아이디</label> 
				<input type="text" id="userId" name="userId" value="${vo.userId}" readonly>
			</div>

			<div class="input-group">
				<label for="userName">이름</label> <input type="text" id="userName" name="userName" value="${vo.userName }" readonly>
			</div>
			

			<div class="email-group">
				<label for="userEmail">메일</label>
				<div style="display: flex; align-items: center;">
					<input type="email" id="userEmail" name="userEmail" value="${saveEmail }" class="email-input" required>@ 
						<input list="emailOptions" id="emailDomain" placeholder="이메일을 선택하거나 입력하세요" value="${saveDomain }" >
							<datalist id="emailOptions">
								<option value="naver.com">
								<option value="gmail.com">
								<option value="daum.net">
								<option value="nate.com">
							</datalist>
				</div>
			</div>

			<div class="input-group">
				<label for="userAddress">주소</label> 
				<input type="text" id="address" name="address" value="${vo.address }" placeholder="우편번호">
   				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
   				<input type="text" id="streetAddress" name="streetAddress" value="${vo.streetAddress }"  placeholder="주소"><br>
   				<input type="text" id="detailAddress" name="detailAddress" value="${vo.detailAddress }" placeholder="상세주소">
    			<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			</div>
			

			<div class="input-group">
				<label for="userPhonenumber">전화번호</label> <input type="tel" id="userPhonenumber"
					name="userPhonenumber" placeholder="전화번호 ( ' - ' 제외 )[선택]" maxlength="11" value="${vo.userPhonenumber}" required>
			</div>
			

			<div class="input-group">
				  <label for="userDate">생년월일:</label>
				  <c:choose>
				  	<c:when test="${not empty vo.userDate }">
	     			  <input type="date" id="userDate" name="userDate" value="${vo.userDate }" min="1900-01-01" max="2024-12-31" required>
				  	</c:when>
				  	<c:otherwise>
	     			  <input type="date" id="userDate" name="userDate" value="1900-01-01" min="1900-01-01" max="2024-12-31" required>
				  	</c:otherwise>
				  
				  </c:choose>
			</div>
			
		    <div class="gender-group">
                <label id="gender" gender="${vo.userGender }">성별</label>
                <input type="radio" id="userGender" name="userGender" value="man" checked="checked" required>
                <label for="man">남</label>
                <input type="radio" id="userGender" name="userGender" value="woman" required>
                <label for="woman">여</label>
            </div> 
            
			<button type="button" class="signup-btn" onclick="updateUserInfo(this.form)">수정하기</button>
		<div class="sidebar">
				<h3>마이페이지</h3>
				<ul>
					<li><a href="userShoping"
						onclick="toggleSubMenu('shopping-info')">쇼핑정보</a>
						<ul id="shopping-info" class="sub-menu">
							<li><a id="myOrder"
								href="/User/OrderSelect?mno=${vo.mno }">주문목록/배송조회</a></li>
							<li><a href="#">취소/반품/교환 내역</a></li>
						</ul></li>
					<li><a href="#" onclick="toggleSubMenu('benefit-management')">혜택관리</a>
						<ul id="benefit-management" class="sub-menu">
							<li><a href="#">쿠폰</a></li>
							<li><a href="#">적립금</a></li>
						</ul></li>
					<li><a href="userInfo" onclick="toggleSubMenu('member-info')">회원정보</a>
						<ul id="member-info" class="sub-menu">
							<li><a id="checkPage"
								href="/User/checkPassword?userId=${vo.userId }">회원정보 수정</a></li>
							<li><a href="#">배송지 관리</a></li>
						</ul></li>
					<li><a href="/report/selectReport"
						onclick="toggleSubMenu('serviceCenter-info')">고객센터</a>
						<ul id="serviceCenter-info" class="sub-menu">
							<li><a id="reportCategory" href="/report/reportCategory">Q&A</a></li>
							<li><a id="reportBoard" href="/report/reportBoard?mno="1>문의센터</a></li>
							<li><a id="directReport" href="/report/directReport?mno="1>1:1문의</a></li>
						</ul></li>
					<li><a href="#">나의 게시글</a></li>
				</ul>
			</div>
	</form>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/myPage/myPageUpdate.js"></script>
<script type="text/javascript" src="/resources/js/myPage/sidebar.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
