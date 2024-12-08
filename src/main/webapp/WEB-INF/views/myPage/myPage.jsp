<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>

<!-- Bootstrap & Boxicons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f9f9f9;
}

/* 마이페이지 레이아웃 */
.mypage-container {
	display: flex;
	flex-direction: row;
	margin: 40px auto;
	max-width: 1200px; /* 중앙 정렬 */
}

/* 사이드바 스타일 */
.sidebar {
	width: 300px;
	background: #ffffff;
	padding: 30px 15px;
	border-radius: 8px;
	margin-left: -90px; /* 좌측으로 살짝 밀기 */
	height: fit-content;
}

.sidebar h3 {
	text-align: center;
	font-size: 22px;
	margin-bottom: 30px;
	color: #333;
	font-weight: bold;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin-bottom: 20px; /* 세로 간격 조정 */
}

.sidebar ul li a {
	text-decoration: none;
	color: #333;
	padding: 12px 15px;
	display: block;
	font-size: 16px; /* 글꼴 크기 키움 */
	border-radius: 5px;
	transition: all 0.3s ease;
	font-weight: 500;
}

.sidebar ul li a:hover {
	background: #e0f2fe;
	color: #007acc;
}

.sub-menu {
	list-style: none;
	padding-left: 60px;
	display: none;
}

.sidebar ul li:hover .sub-menu {
	display: block;
}

.sub-menu li a {
	font-size: 8px; /* 기존보다 더 작은 크기 */
	padding: 6px 20px; /* 왼쪽 패딩을 늘려서 텍스트를 오른쪽으로 이동 */
	color: #555;
}
/* 사이드바 아이콘 크기 조정 */
.sidebar ul li a i {
	font-size: 27px; /* 기존보다 살짝 더 큰 크기 */
	margin-right: 10px; /* 아이콘과 텍스트 간격 */
}

/* 메인 콘텐츠 스타일 */
.main-content {
	flex: 1;
	margin-left: 30px;
	background: white;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}

.main-content h1, .main-content h2 {
	font-family: 'Noto Sans KR', sans-serif;
	color: #333;
	margin-bottom: 20px;
}

.main-content img {
	display: block;
	margin: 20px 0;
}

.box-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	gap: 20px;
}

.box {
	background: white;
	border: 1px solid #eee;
	border-radius: 8px;
	padding: 20px;
	text-align: center;
	transition: all 0.3s ease;
	font-size: 16px;
	font-weight: 500;
}

.box:hover {
	transform: translateY(-5px);
	border-color: #007acc;
}

.box a {
	text-decoration: none;
	color: #007acc;
	font-size: 14px;
	font-weight: bold;
}

.box a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<!-- 마이페이지 영역 -->
	<div class="mypage-container">
		<!-- 사이드바 -->
		<div class="sidebar">
			<ul>
				<li><a href="#"> <i class="bx bx-user"></i> 회원정보
				</a>
					<ul class="sub-menu">
						<li><a href="/User/myPageUpdate?userId=${vo.userId}">회원정보
								수정</a></li>
						<!-- <li><a href="#">내 찜리스트</a></li> -->
						<li><a href="/User/selectMyPoint?mno=${vo.mno}">내 포인트</a></li>
					</ul></li>
				<li><a href="#"> <i class="bx bx-cart"></i> 쇼핑정보
				</a>
					<ul class="sub-menu">
						<li><a href="/User/OrderSelect?mno=${vo.mno}">주문목록/배송조회</a></li>
						<!-- <li><a href="#">취소/반품 내역</a></li> -->
					</ul></li>
				<li><a href="#"> <i class="bx bx-bar-chart"></i> 활동정보
				</a>
					<ul class="sub-menu">
						<li><a
							href="/User/myCommenPost?userMno=${vo.mno}&filterType=posts">내
								게시글/댓글</a></li>
						<li><a href="/User/myLikedWriterBookList?userMno=${vo.mno}">집필
								북마크</a></li>
					</ul></li>
				<li><a href="/User/deleteAccount"> <i class="bx bx-log-out"></i>
						회원 탈퇴
				</a></li>
			</ul>
		</div>

		<!-- 메인 콘텐츠 -->
		<div class="main-content">
			<h1>${vo.userId}님,환영합니다!</h1>
			<h2>보유 포인트: ${vo.userPoint} P</h2>
			<c:if test="${empty vo.userIcon}">
				<img src="../resources/images/usericon.jpg" alt="User Icon"
					width="100" height="100">
			</c:if>
			<c:if test="${not empty vo.userIcon}">
				<img src="${vo.userIcon}" id="userIcon" alt="userIcon"
					width="100" height="100" onerror="this.onerror=null; this.src='../resources/images/usericon.jpg';">
			</c:if>

			<div class="box-container">
				<div class="box">
					<h3>1:1 문의(처리중)</h3>
					<p>문의 : <a href="">${directreportCount}</a>건</p>
					<a href="#" onclick="godirectReportCheck()">문의 내역 보기</a>
					<a href="#" onclick="godirectReport()" style="margin-left: 25px;">1:1 문의 하기</a>
				</div>
				<div class="box">
					<h3>내 게시글</h3>
					<p>게시글 : <a href="">${myBoardCount}</a>건</p>
					<a href="/User/myCommenPost?userMno=${vo.mno}&filterType=posts">내 게시글 보기</a>
				</div>
				<div class="box">
					<h3 style="font-size: 25px;">최근 주문내역(일주일)</h3>
					<p>주문 : <a href="/User/OrderSelectWe?mno=${vo.mno}">${myShoppingCount}</a>건</p>
					<a href="/User/OrderSelect?mno=${vo.mno}">주문 내역 보기</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
