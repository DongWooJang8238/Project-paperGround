<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reportCategory.css">
<title>Q&A 선택</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<input type="hidden" class="qnaList" value="${qnaList }">

<form id="reportForm">
	
	<div class="panel-body-btns">
		<button type="button" class="btn" id="reportall">전체보기</button>
		<button type="button" class="btn" id="reportUser">회원정보</button>
		<button type="button" class="btn" id="reportWriter">작가</button>
		<button type="button" class="btn" id="reportSystem">시스템</button>
		<button type="button" class="btn" id="reportShop">구매</button>
		<button type="button" class="btn" id="reportRefund">환불</button>
		<button type="button" class="btn" id="reportProfile">프로필</button>
		<button type="button" class="btn" id="reportFesta">대회</button>
		<button type="button" class="btn" id="reportHeadhunter">캐스팅</button>
	</div>
</form>
<div id="dataList"></div>
    
<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/report/reportCategory.js"></script>

</body>
</html>