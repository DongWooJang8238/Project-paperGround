<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/myPage.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 관리</title>
<style>
/* 기본 스타일 */
.container {
	width: 100%;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	margin: 0 auto;
}

/* 탭 스타일 */
.tabs {
	display: flex;
	border-bottom: 1px solid #ddd;
	background-color: #f1f1f1;
}

.tab {
	flex: 1;
	padding: 15px;
	text-align: center;
	cursor: pointer;
	color: #555;
	transition: color 0.3s, border-bottom 0.3s;
}

.tab.active {
	color: #28a745;
	font-weight: bold;
	border-bottom: 2px solid #28a745;
}

/* 콘텐츠 스타일 */
.content {
	display: none;
	color: #333;
}

.content.active {
	display: block;
}

/* 테이블 스타일 */
.table-container {
	width: 100%;
}

.table {
	width: 100%;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
}

.table th {
	background-color: #f7f7f7;
	font-weight: bold;
	color: #555;
}

.no-data {
	color: #777;
	padding: 20px 0;
}

.page-nation {
	display: flex;
	justify-content: center;
	list-style-type: none;
	padding: 0;
}

.page-nation li {
	margin: 0 5px;
}

.page-nation li a {
	color: #5d4037; /* 우드톤 페이지 링크 */
	padding: 8px 12px;
	text-decoration: none;
	border-radius: 5px;
	background-color: #e0e0e0;
}

 .page-nation li a:hover, .page-nation li a.active {
   background-color: #7fb5ff88; /* 선택된 페이지, 호버 효과 */
   color: #fff;
} 

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="mypage-container">
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
		<div class="main-content" style="padding: 5px 0 0; background-color: white; color: black;">
			<div class="header" style="display: block;">
				<h1>${vo.userId}님의 활동 내역</h1>
				<c:if test="${empty vo.userIcon}">
					<img src="../resources/images/usericon.jpg" alt="User Icon"
						width="100" height="100">
				</c:if>
				<c:if test="${not empty vo.userIcon}">
					<img src="${vo.userIcon}" id="userIcon" alt="userIcon"
						width="100" height="100" onerror="this.onerror=null; this.src='../resources/images/usericon.jpg';">
				</c:if>

				<input type="hidden" name="userId" value="${vo.userId}"> 
			</div>
	<div class="container" style="padding-left: 0px; padding-right: 0px; padding-bottom: 0px;">
		<!-- 탭 -->
		<div class="tabs">
			<c:choose>
				<c:when test="${pageMaker.cri.filterType == 'posts'}">
					<div id="posts" class="tab active"
						onclick="showContent(this,'posts')">작성글</div>
					<div id="comments" class="tab"
						onclick="showContent(this,'comments')">작성댓글</div>
					<div id="liked" class="tab" onclick="showContent(this,'liked')">좋아요한 글</div>
				</c:when>
				<c:when test="${pageMaker.cri.filterType == 'comments'}">
					<div id="posts" class="tab" onclick="showContent(this,'posts')">작성글</div>
					<div id="comments" class="tab active" onclick="showContent(this,'comments')">작성댓글</div>
					<div id="liked" class="tab" onclick="showContent(this,'liked')">좋아요한 글</div>
				</c:when>
				<c:when test="${pageMaker.cri.filterType == 'liked'}">
					<div id="posts" class="tab" onclick="showContent(this,'posts')">작성글</div>
					<div id="comments" class="tab " onclick="showContent(this,'comments')">작성댓글</div>
					<div id="liked" class="tab active" onclick="showContent(this,'liked')">좋아요한 글</div>
				</c:when>
			</c:choose>
		</div>

		<c:choose>
			<c:when test="${pageMaker.cri.filterType == 'posts'}">
				<!-- 작성글 콘텐츠 -->
				<div id="posts" class="content active">
					<div class="table-container">
						<table class="table" style="margin-bottom: 0px;">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody id="posts-list">
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach var="list" items="${list }">
											<tr data-bno="${list.boardno}">
												<td>${list.title }</td>
												<td>${list.updateDate }</td>
												<td>${list.readCount }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="3" class="no-data">작성하신 게시글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
			<c:when test="${pageMaker.cri.filterType == 'comments'}">
				<div id="comments" class="content active">
					<div class="table-container">
						<table class="table">
							<thead>
								<tr>
									<th>댓글 내용</th>
									<th>작성일</th>
									<th>게시글 제목</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody id="comments-list">
								<c:choose>
									<c:when test="${not empty commentsList}">
										<c:forEach var="list" items="${commentsList}">
											<tr data-bno="${list.boardno}">
												<td>${list.reply}</td>
												<td>${list.updateDate}</td>
												<td>${list.title}</td>
												<td>${list.readCount}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="no-data">작성하신 댓글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
			<c:when test="${pageMaker.cri.filterType == 'liked'}">
				<!-- 좋아요한 글 콘텐츠 -->
				<div id="liked" class="content active">
					<div class="table-container">
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody id="liked-list">
									<c:choose>
									<c:when test="${not empty likesList}">
										<c:forEach var="list" items="${likesList}">
											<tr data-bno="${list.boardno}">
												<td>${list.title}</td>
												<td>${list.updateDate}</td>
												<td>${list.readCount}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="3" class="no-data">좋아요 게시글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
		</c:choose>
			</div>
			</div>
			</div>
		<!-- 작성댓글 콘텐츠 -->
		<input type="hidden" id="filterType"
			value="${pageMaker.cri.filterType }">
		<!-- page -->
		<div class="page-wrap">
			<ul class="page-nation">
				<c:if test="${pageMaker.prev }">
					<li class="previous"><a href="${pageMaker.startPage-1 }">
							&lt; </a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" step="1">
					<li><a href="${num }"
						class="${pageMaker.cri.pageNum == num ? 'active' : '' }">
							${num } </a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li><a href="${pageMaker.endPage+1 }"> &gt; </a></li>
				</c:if>
			</ul>
		</div>
		<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="/resources/js/myPage/myPageCommenPost.js"></script>
</html>
