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
<style>
.order-history {
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

.order-details {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<form>
		<!-- Main content -->
		<div class="main-content">
			<div class="header">
				<h1>${vo.userId}님은${vo.userRole}입니다.${vo.mno }</h1>
				<h2>보유 포인트: ${vo.userPoint} P</h2>
				<c:if test="${empty vo.userIcon}">
					<a href="/User/changeIcon?userId=${vo.userId}"> <img
						src="../resources/images/usericon.jpg" alt="User Icon" width="100"
						height="100">
					</a>
				</c:if>

				<c:if test="${not empty vo.userIcon}">
					<a href="/User/changeIcon?userId=${vo.userId}"> <img
						src="${result.userIcon}" id="userIcon" alt="userIcon" width="100"
						height="100">
					</a>
				</c:if>

				<input type="hidden" name="userId" value="${vo.userId}">
			</div>

			<div class="body-content">
				<div class="header">
					<h1>계정 정보</h1>
					<button type="button" onclick="goDetailMyPage()">></button>
					<h2>대표 이메일 ${vo.userEmail}</h2>
					<input type="text" name="email" value="${domain}">
					<h2>아이디 ${vo.userId}</h2>
					<h2>이름 ${vo.userName}</h2>
				</div>

				<div class="box-container">
					<div class="box">
						<h2>1:1문의</h2>
						<p>문의: 0건</p>
						<a href="#">1:1 문의하기</a>
					</div>
					<div class="box">
						<h2>상품문의</h2>
						<p>답변완료: 0건</p>
						<a href="#">상품 문의하기</a>
					</div>
					<div class="box">
						<h2>최근 주문내역</h2>
						<p>주문번호</p>
						<a href="#">후기 작성하기</a>
					</div>
				</div>

			</div>
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
							<li><a a id ="myPoint" href="/User/selectMyPoint?mno=${vo.mno }">내 포인트</a></li>
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
<script type="text/javascript" src="/resources/js/myPage/myPage.js"></script>
<script type="text/javascript" src="/resources/js/myPage/sidebar.js"></script>
</html>
