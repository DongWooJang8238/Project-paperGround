<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>
<style>
body {
	background-color: #f5deb3; /* Light brown background */
	font-family: Arial, sans-serif;
}

.container {
	width: 80%;
	margin: 0 auto;
}

.title-box {
	background-color: #cccccc;
	padding: 15px;
	font-size: 24px;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #333;
	color: white;
}

.paging {
	text-align: center;
	margin-top: 20px;
}

.paging a {
	margin: 0 5px;
	text-decoration: none;
	color: #333;
}

.paging a.active {
	font-weight: bold;
	color: red;
}
</style>

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div>
		<h1 class="page-header">문의 게시판</h1>
	</div>
	<div class="panel-heading">
		<button type="button" class="btn btn-fir" id="registerBtn">새 게시물 등록</button>
	</div>
	<div class="panel-body">
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bvo" items="${list}">
				<tr>
					<td>${bvo.boardNO }</td>
					<td><a href="${bvo.boardNO }">${bvo.title } <b>[${bvo.replyCount }]</b></a></td>
					<td>${bvo.writer }</td>
					<td>${bvo.regdate }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- page -->
      <div class="page-wrap">
         <ul class="page-nation">
            <c:if test="${pageMaker.prev }">
               <li class="previous">
                  <a href="${pageMaker.startPage-1 }"> &lt; </a>
               </li>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
               <li>
                  <a href="${num }" class="${pageMaker.cri.pageNum == num ? 'active' : '' }"> ${num } </a>
               </li>
            </c:forEach>
            <c:if test="${pageMaker.next }">
               <li><a href="${pageMaker.endPage+1 }"> &gt; </a></li>
            </c:if>
         </ul>
       </div>
		
	</div>

		<jsp:include page="../layout/footer.jsp"></jsp:include>
		<script type="text/javascript" src="/resources/js/report/reportBoard.js"></script>
</body>
</html>
