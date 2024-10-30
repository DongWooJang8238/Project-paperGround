<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/gameEntrance.css">
    <title>한국 문학 위인 게임</title>
    
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

 <input type="hidden" class="userMno" value="${sessionScope.vo.mno}" />
 <input type="hidden" class="alertMessage" value="${alertMessage}" />
 <!-- 씨큐리티 적용시 받아오기. -->
 
<div class="button-container">
<form action="JenreCheck" method="get">
	<div class="panel-body-btns">
		<button type="button" class="btns" id="easyBtn">쉬움 난이도</button>
		<button type="button" class="btns" id="nomalBtn">기본 난이도</button>
	</div>
</form>
</div>    

   <jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="../resources/js/game/gameEntrance.js"></script>
</body>
</html>