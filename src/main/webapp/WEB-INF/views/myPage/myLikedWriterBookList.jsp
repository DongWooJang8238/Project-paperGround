<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UI Layout</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />

<style type="text/css">
/* Search bar styling */
.search-bar {
	top: 20px;
	right: 20px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	width: 250px;
}

.search-icon {
    cursor: pointer; /* 아이콘에 커서 포인터 스타일 추가 */
    width: 24px; /* 아이콘 크기 조정 */
    height: 24px;
}

.search-button {
    display: none; /* 버튼을 숨겨놓고 엔터로만 기능을 실행할 경우 */
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
	display: ruby-text;
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

/* 마이페이지 레이아웃 */
.mypage-container {
	display: flex;
	flex-direction: row;
	margin: 40px auto;
	max-width: 1200px; /* 중앙 정렬 */
}



</style>
</head>
<link rel="stylesheet" href="/resources/css/writeHome.css">
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="root">
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
			
			<div class="wrap">
				<div class="sub-container">
					<img id="sub-search-icon" src="https://cf.joara.com/joara30FE/assets/icon/ico_top_search.png" alt="검색" class="search-icon">
					<input id="sub-search-bar" type="text" class="search-bar" placeholder="검색어를 입력하세요">
					<button class="search-button" onclick="searchFunction()">검색</button>
					<div class="sub-books-base">
						<ul>
						<c:choose>
							<c:when test="${not empty list }">
							<c:forEach var="list" items="${list }">
								<li><div class="books-detail">
										<a data-link-type="book-preview" class="" href="/"><div
												class="sub-book-item col list col-100">
												<div class="cover col">
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star_shadow.png"
																alt="선호작 등록">
														</button>
													</div>
													<div class="img bookImg">
														<img
															src="${list.coverImage}"
															alt="당신의 흑역사를 지워드립니다">
													</div>
												</div>
												<div class="caption">
                                       <div class="info">
                                          <span>${list.genre }</span><span>${list.writeType }</span>
                                       </div>
                                       <div class="tit clamp2">${list.title }</div>
                                       <div class="nickname">${list.writer }</div>
                                       <div class="fb-item badge-item">
                                          <span><img
                                             src="https://cf.joara.com/joara30FE/assets/badge/badge_contest.png"
                                             alt="공모전참여"></span><span><img
                                             src="https://cf.joara.com/joara30FE/assets/badge/badge_challenge.png"
                                             alt="도전"></span>
                                       </div>
                                       <div class="view-count">
                                          <span class="i-eye"><img
                                             src="https://cf.joara.com/joara30FE/assets/icon/ico_eye.png"
                                             alt=""></span><span class="in-txt">${list.views }</span>
                                       </div>
                                    </div>
											</div></a>
									</div></li>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<div style="text-align: center" height="200px">
								내역이 없습니다.</div>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="/resources/js/myPage/myLikedWriterList.js"></script>
</html>
