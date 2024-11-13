<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/layout.css">
<title>헤더와 카테고리 예제</title>
</head>
<body>

		<header>
			<div class="header-container">
				<div class="logo">
					<a href="/"> <img src="/resources/images/PAGE_GROUND_Text.png" alt="Logo">
					</a>
				</div>
				<div class="user-options">
					<sec:authorize access="isAuthenticated()">
					    <!-- 로그인된 사용자만 볼 수 있는 내용 -->
						<button type="button" id="logout">로그아웃</button>
						<button type="button" id="adminPage">관리자 페이지</button>
						<button type="button" id="myPage">마이페이지</button>
					</sec:authorize>
					
					<sec:authorize access="isAnonymous()">
					    <!-- 로그인되지 않은 사용자에게만 보이는 내용 -->
						<button type="button" id="login">로그인</button>
						<button type="button" id="signup">회원가입</button>
					</sec:authorize>
					<button type="button" id="gogack">고객센터</button>
					
					<sec:authorize access="isAuthenticated()">
					    <!-- 로그인된 사용자만 볼 수 있는 내용 -->
						<button id="cart">🛒</button>
						mno : <sec:authentication property="principal.user.mno"/>
						<input type="hidden" id="mno" name="mno" value="<sec:authentication property="principal.user.mno"/>">
					</sec:authorize>
					<button id="search" onclick="toggleCart()">🔍</button>
				</div>
			</div>
		</header>

		<nav class="categories">
			<div class="categories-container">
				<div class="category-container">
					<div class="category" onclick="toggleSubcategories('books')">도서구매</div>
					<div class="subcategories" id="books" style="display: none;">
						<div class="genre" id="genres">
							<div onclick="shopListGo()">새책</div>
							<div onclick="shopUsedList()">중고책</div>
						</div>
					</div>
					<div class="category" onclick="toggleSubcategories('points')">포인트상점</div>
					<div class="category" onclick="goBoard()">커뮤니티게시판</div>
					<div class="category" onclick="writeHomeGo()">집필게시판</div>
					<div class="category" onclick="goGame()">게임</div>
				</div>
			</div>
	</nav>
	
