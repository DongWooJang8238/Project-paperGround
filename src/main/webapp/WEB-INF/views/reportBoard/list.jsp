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
	<div class="panel-heading">
    <button type="button" class="btn btn-fir" id="registerBtn">새 게시글 등록</button>
    <select id="categoryFilter" class="category-filter">
        <option value="">전체</option>
        <option value="reportUser" ${selectedCategory == 'reportUser' ? 'selected' : ''}>회원 신고</option>
        <option value="reportWriter" ${selectedCategory == 'reportWriter' ? 'selected' : ''}>작가 문의</option>
        <option value="reportSystem" ${selectedCategory == 'reportSystem' ? 'selected' : ''}>시스템 문의</option>
        <option value="reportShop" ${selectedCategory == 'reportShop' ? 'selected' : ''}>구매 문의</option>
        <option value="reportRefund" ${selectedCategory == 'reportRefund' ? 'selected' : ''}>환불 문의</option>
        <option value="reportProfile" ${selectedCategory == 'reportProfile' ? 'selected' : ''}>프로필 문의</option>
        <option value="reportFesta" ${selectedCategory == 'reportFesta' ? 'selected' : ''}>대회 문의</option>
        <option value="reportHeadhunter" ${selectedCategory == 'reportHeadhunter' ? 'selected' : ''}>캐스팅 문의</option>
        <option value="reportAll" ${selectedCategory == 'reportAll' ? 'selected' : ''}>기타 문의</option>
    </select>
</div>

	<div class="board-list">
		<table class="board-table">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>문의 분류</th>
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
					<tr>
						<td>${bvo.reportBoardno }</td>
						<td>${bvo.reportCategory }</td>
						<td><a href="${bvo.reportBoardno}"> ${bvo.title }</td>
						<td>${bvo.replyCount }</td>
						<td>${bvo.writer }</td>
						<td>${bvo.readCount }</td>
						<td>${bvo.regDate }</td>
					</tr>
					<br>
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
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}" step="1">
					<li><a
						href="${num }${category != null ? '&category=' + category : ''}"
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
<script type="text/javascript" src="/resources/js/reportBoard/boardList.js"></script>
</body>
</html>