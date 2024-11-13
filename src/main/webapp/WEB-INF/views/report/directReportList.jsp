<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1 대 1 문의</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }
    .board-container {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .categoryList {
        text-align: center;
        margin-bottom: 20px;
    }
    .board-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    .board-table th, .board-table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    .board-table th {
        background-color: #f2f2f2;
        color: #333;
    }
    .board-table tr:hover {
        background-color: #f1f1f1;
    }
    .page-wrap {
        text-align: center;
        margin-top: 20px;
    }
    .page-nation {
        list-style: none;
        padding: 0;
    }
    .page-nation li {
        display: inline;
        margin: 0 5px;
    }
    .page-nation a {
        color: #007bff;
        text-decoration: none;
        padding: 5px 10px;
        border-radius: 4px;
        border: 1px solid #ddd;
    }
    .page-nation a.active, .page-nation a:hover {
        background-color: #007bff;
        color: #fff;
    }
    .no-posts {
        text-align: center;
        color: #888;
        margin-top: 20px;
    }
    #inquiryCategory {
    overflow: hidden;
    transition: height 0.3s ease-out;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="board-container">
		<div class="categoryList">
			<hr>
			<h2>1 대 1 문의</h2>
			<hr>
		</div>
		<div class="board-list">
			<table class="board-table">
				<thead>
					<tr>
						<th>게시글 번호</th>
						<th>제목</th>
						<th>  문의 종류
                <!-- 드롭다운을 추가 -->
                <select id="inquiryCategory" style="display: none;">
                    <option value="category1">reportUser </option>
                    <option value="category2">reportWriter</option>
                    <option value="category3">reportSystem</option>
                    <option value="category4">reportShop</option>
                    <option value="category5">reportRefund</option>
                    <option value="category6">reportProfile</option>
                    <option value="category7">reportFesta</option>
                    <option value="category8">reportHeadhunter</option>
                    <option value="category9">reportall</option>
                </select>
            </th>

						<th>내용</th>
						<th>회원정보</th>
					</tr>
				</thead>
				<tbody>
					<input type="hidden" name="mno" value="${vo.mno }" />
					<!-- 게시글 목록 반복 출력 -->
					<c:forEach var="bvo" items="${list}">
						<c:if test="${vo.mno == 1 || bvo.mno == vo.mno}">
							<tr>
								<td>${bvo.drno }</td>
								<td><a href="/report/getDR?drno=${bvo.drno}">${bvo.DRtitle }</a></td>
								<td>${bvo.DRcategory }</td>
								<td>${bvo.DRcontent }</td>
								<td>${bvo.mno }</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${empty list}">
				<p class="no-posts">게시글이 없습니다.</p>
			</c:if>

			<!-- page -->
			<div class="page-wrap">
				<ul class="page-nation">
					<c:if test="${pageMaker.prev}">
						<li><a href="${pageMaker.startPage - 1}">&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" step="1">
						<li><a href="${num}"
							class="${pageMaker.cri.pageNum == num ? 'active' : ''}">${num}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li><a href="${pageMaker.endPage + 1}">&gt;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />

	<script type="text/javascript"
		src="/resources/js/report/directReportList.js"></script>
</body>
</html>
