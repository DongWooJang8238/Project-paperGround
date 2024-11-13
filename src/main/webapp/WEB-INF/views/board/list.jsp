<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="board-container">
		<!-- 카테고리 부분 -->
		<h1>
		    <c:choose>
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
		    <a href="list?category=0" class="${selectedCategory == '0' ? 'active' : ''}">공지</a>
		    <a href="list?category=1" class="${selectedCategory == '1' ? 'active' : ''}">자유게시판</a>
		    <a href="list?category=2" class="${selectedCategory == '2' ? 'active' : ''}">리뷰게시판</a>
		    <a href="list?category=3" class="${selectedCategory == '3' ? 'active' : ''}">토론게시판</a>
		    <a href="list?category=4" class="${selectedCategory == '4' ? 'active' : ''}">문의게시판</a>
		    <a href="list?category=5" class="${selectedCategory == '5' ? 'active' : ''}">자료게시판</a>
		    <a href="list?category=6" class="${selectedCategory == '6' ? 'active' : ''}">요청게시판</a>
		    <hr>
		</div>
		<div class="panel-heading">
			<button type="button" class="btn btn-fir" id="registerBtn">새
				게시글 등록</button>
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
					            <td><a href="${bvo.boardno}">${bvo.title }</a></td>
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
</body>
<jsp:include page="../layout/footer.jsp" />
<script type="text/javascript" src="/resources/js/board/boardList.js"></script>
</body>
</html>