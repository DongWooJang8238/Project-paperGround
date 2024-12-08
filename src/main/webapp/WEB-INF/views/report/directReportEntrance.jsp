<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/directReportEntrance.css">
    <title>1 대 1 문의 선택</title>
    
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

 <input type="hidden" class="mno" value="${sessionScope.vo.mno}" />
 <input type="hidden" class="alertMessage" value="${alertMessage}" />
 <!-- 씨큐리티 적용시 받아오기. -->
 
<!-- <div class="button-container">
<form action="JenreCheck" method="get">
	<div class="panel-body-btns">
		<button type="button" class="btns" id="godirectReport">1 대 1 문의 하기</button>
		<button type="button" class="btns" id="godirectReportCheck">1대 1 문의 확인하기</button>
		<button type="button" class="btns" id="qna">Q&A</button>
	</div>
</form>
</div>     -->

   <jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="../resources/js/report/directReportEntracne.js"></script>
</body>
</html>