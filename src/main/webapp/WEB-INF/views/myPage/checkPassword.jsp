<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/myPage.css">
<title>마이페이지</title>
<style type="text/css">
.main-content {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 280px;
}

.header {
    margin-bottom: 20px;
}

.input-group {
    margin-bottom: 15px;
}

.input-group label {
    font-size: 14px;
    color: #333;
    display: block;
    margin-bottom: 5px;
}

.input-group input[type="text"],
.input-group input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

.signup-btn {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    color: #ffffff;
    background-color: #4CAF50;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.signup-btn:hover {
    background-color: #45a049;
}

a {
    display: block;
    margin-top: 10px;
    font-size: 12px;
    color: #888;
    text-decoration: none;
    text-align: center;
}

a:hover {
    color: #4CAF50;
}

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Main content -->
	<form method="post">
		<div class="main-content">
			<div class="header">
				<div class="input-group">
					<label for="username">아이디</label>
					 <input type="text" id="userId"name="userId" placeholder="아이디 입력" value="${sessionScope.vo.userId }"readonly>
					 <input type="hidden" id="checkId" name="checkId" value="${sessionScope.vo.userId }">
				</div>

				<div class="input-group">
					<label for="userPw">비밀번호</label> 
					<input type="password" id="userPw" name="userPw"  placeholder="비밀번호 입력" required>
					<input type="hidden" id="checkPw" name="checkPw" value="${sessionScope.vo.userPw }">
				</div>
			</div>
			<button type="button" class="signup-btn" onclick="checkPassword()">확인</button>
			<a href="/User/findPw">비밀번호가 기억나지 않으세요?</a>
		
		</div>
	</form>
	<div class="sidebar">
		<h3>마이페이지</h3>
		<ul>
			<li><a href="#" onclick="toggleSubMenu('shopping-info')">쇼핑정보</a>
				<ul id="shopping-info" class="sub-menu">
					<li><a href="#">주문목록/배송조회</a></li>
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
						href="/User/checkPassword?userId=${sessionScope.vo.userId }">회원정보 수정</a></li>
					<li><a href="#">배송지 관리</a></li>
				</ul></li>
			<li><a href="#">나의 게시글</a></li>
		</ul>
	</div>


	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/myPage/sidebar.js"></script>
<script type="text/javascript" src="/resources/js/myPage/checkPassword.js"></script>
</html>
