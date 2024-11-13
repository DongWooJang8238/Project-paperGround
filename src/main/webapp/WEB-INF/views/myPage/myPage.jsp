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
				<h1>${vo.userId}님은${vo.userRole}입니다.</h1>
				<h2>보유 포인트: ${vo.userPoint} P</h2>
				<c:if test="${empty vo.userIcon}">
					 <img src="../resources/images/usericon.jpg" alt="User Icon" width="100" height="100">
				</c:if>

				<c:if test="${not empty vo.userIcon}">
					 <img src="${vo.userIcon}" id="userIcon" alt="userIcon" width="100" height="100">
				</c:if>

				<input type="hidden" name="userId" value="${vo.userId}">
			</div>

			<div class="body-content">
				<div class="header">
					<h1>계정 정보</h1>
					<!-- <button type="button" onclick="goDetailMyPage()">></button> -->
					<h2>대표 이메일 ${vo.userEmail}</h2>
					<input type="hidden" name="email" value="${domain}">
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
					<li><a href="userInfo" onclick="toggleSubMenu('member-info')">회원정보</a>
						<ul id="member-info" class="sub-menu">
							<li><a id="checkPage"
								href="/User/myPageUpdate?userId=${vo.userId }">회원정보 수정</a></li>
							<li><a href="#">내 찜리스트</a></li>
							<li><a a id ="myPoint" href="/User/selectMyPoint?mno=${vo.mno }">내 포인트</a></li>
						</ul></li>
					<li><a href="userShoping"
						onclick="toggleSubMenu('shopping-info')">쇼핑정보</a>
						<ul id="shopping-info" class="sub-menu">
							<li><a id="myOrder"
								href="/User/OrderSelect?mno=${vo.mno }">주문목록/배송조회</a></li>
							<li><a href="#">취소/반품/내역</a></li>
							<li><a id="myOrder"
								href="/User/myUsedProductsSelect?userMno=${vo.mno }">내 중고상품</a></li>
						</ul></li>
					<li><a href="#" onclick="toggleSubMenu('benefit-management')">활동정보</a>
						<ul id="benefit-management" class="sub-menu">
							<li><a href="#">내 게시글/댓글</a></li>
							<li><a href="#">집필 북마크</a></li>
						</ul></li>
					<li><a href="#">회원 탈퇴</a></li>
				</ul>
			</div>
	</form>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/myPage/myPage.js"></script>
<script type="text/javascript" src="/resources/js/myPage/sidebar.js"></script>
</html>
