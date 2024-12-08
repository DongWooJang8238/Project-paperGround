<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list</title>
<!-- Add Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/boardStyles.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div class="board-container">
		<!-- 카테고리 부분 -->
		<h1 style="font-size : 1.5em; margin-bottom : 30px;">
		    <c:choose>
		   		<c:when test="${isBestList}">인기게시판</c:when>
		        <c:when test="${selectedCategory == '0'}">공지사항</c:when>
		        <c:when test="${selectedCategory == '1'}">자유게시판</c:when>
		        <c:when test="${selectedCategory == '2'}">리뷰게시판</c:when>
		        <c:when test="${selectedCategory == '3'}">토론게시판</c:when>
		        <c:when test="${selectedCategory == '4'}">문의게시판</c:when>
		        <c:when test="${selectedCategory == '5'}">자료게시판</c:when>
		        <c:when test="${selectedCategory == '6'}">요청게시판</c:when>
		        <c:otherwise>게시판</c:otherwise>
		    </c:choose>
		</h1>
		<div class="categoryList">
		    <hr>
		    <a href="list?pageNum=1&amount=10&category=0" class="${selectedCategory == '0' ? 'active' : ''}"><i class="bi bi-megaphone"></i> 공지</a>
		    <a href="list?pageNum=1&amount=10&category=1" class="${selectedCategory == '1' ? 'active' : ''}"><i class="bi bi-chat-dots"></i> 자유게시판</a>
		    <a href="list?pageNum=1&amount=10&category=2" class="${selectedCategory == '2' ? 'active' : ''}"><i class="bi bi-star"></i> 리뷰게시판</a>
		    <a href="list?pageNum=1&amount=10&category=3" class="${selectedCategory == '3' ? 'active' : ''}"><i class="bi bi-columns-gap"></i> 토론게시판</a>
		    <a href="list?pageNum=1&amount=10&category=4" class="${selectedCategory == '4' ? 'active' : ''}"><i class="bi bi-question-circle"></i> 문의게시판</a>
		    <a href="list?pageNum=1&amount=10&category=5" class="${selectedCategory == '5' ? 'active' : ''}"><i class="bi bi-folder"></i> 자료게시판</a>
		    <a href="list?pageNum=1&amount=10&category=6" class="${selectedCategory == '6' ? 'active' : ''}"><i class="bi bi-box-arrow-down"></i> 요청게시판</a>
		    <a href="bestList?pageNum=1&amount=20" class="${isBestList ? 'active' : ''}"><i class="bi bi-trophy"></i> 인기게시판</a>
		    <hr>
		</div>
		<div class="panel-heading">
			<sec:authorize access="isAuthenticated()">
			    <!-- 로그인된 사용자만 볼 수 있는 내용 -->
			    <button type="button" class="btn btn-fir" id="registerBtn">새 게시글 등록</button>
			</sec:authorize>
		</div>
		<!-- 게시판 리스트 -->
		<div class="board-list">
			<table class="board-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>댓글수</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<!-- 게시글 목록 반복 출력 -->
					<c:forEach var="bvo" items="${list}">
					    <c:if test="${bvo.category == selectedCategory}"> <!-- 기존 조건 유지 -->
					        <tr>
					            <td>${bvo.boardno }</td>
					            <td><a href="/board/get?boardno=${bvo.boardno}">${bvo.title}</a></td>
					            <td>${bvo.replyCount }</td>
					            <td>${bvo.writer }</td>
					            <td>${bvo.readCount }</td>
					            <td>${bvo.regDate }</td>
					        </tr>
					    </c:if>
					</c:forEach>
					<c:if test="${empty list}">
						<p>게시글이 없습니다.</p>
					</c:if>
				</tbody>
			</table>
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
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
<script type="text/javascript" src="/resources/js/board/boardList.js"></script>
<!-- Add Bootstrap Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</html>