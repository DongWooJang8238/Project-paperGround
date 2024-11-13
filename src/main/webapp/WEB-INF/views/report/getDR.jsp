<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .completed {
        font-weight: bold;
        color: red;
        text-decoration: underline;
    }
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div class="panel-body">
		<form method="POST">
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" id="title" name="title" value="${drvo.DRtitle}" readonly></td>
					</tr>
					<tr>
						<th>문의 카테고리</th>
						<td><input type="text" name="title" value="${drvo.DRcategory}" readonly></td>
					</tr>
					<tr>
						<th>작성자 회원 번호</th>
						<td><input type="text" name="writer" value="${drvo.mno}" readonly></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="76" name="content" readonly>${drvo.DRcontent}</textarea>
						</td>
					</tr>
					<tr>
						<td><input type="hidden" name="drno" value="${drvo.drno}" readonly></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="panel-body-btns">
			<c:if test="${vo.mno == 1}">
				<button type="button" class="btn btn-sec" id="markAsCompleted" onclick="markAsCompleted()">확인</button>
			</c:if>
			<button type="button" class="btn btn-fir" id="indexBtn">목록으로 이동</button>
		</div>
	</div>
	
	<jsp:include page="../layout/footer.jsp" />
	<script type="text/javascript" src="/resources/js/report/getDR.js"></script>
	
</body>
</html>
