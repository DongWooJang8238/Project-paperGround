<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/usedShopList.css">
<title>adminEntrance</title>
<style>
.dropdown-button-content1 {
    display: none;
    position: absolute;
    top: 58%;
    left: 42.4%;
    background-color: #fff;
    box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.2);
    padding: 10px 0;
    border-radius: 10px;
    z-index: 1;
    font-weight: normal;
    min-width: 150px;
    text-align: center;
    font-weight: bold;
}

.dropdown-button-content2 {
    display: none;
    position: absolute;
    top: 58%;
    left: 48.7%;
    background-color: #fff;
    box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.2);
    padding: 10px 0;
    border-radius: 10px;
    z-index: 1;
    font-weight: normal;
    min-width: 150px;
    text-align: center;
    font-weight: bold;
}
</style>
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="main-content" style="width: 100%;height: 100%;min-width: 100%;min-height: 400px;display: flex;justify-content: space-around;flex-direction: column;align-items: center;">
	    <div class="text-container" style="width: 70%;display: flex;flex-direction: column;align-items: center;">
	    	<h1 style="margin-bottom: 30px;">관리자 페이지</h1>
	    	<div class="border-container" style="border-bottom: 1px solid #777; width: 100%;"></div>
	    </div>
	    <div class="button-container">
	        <button class="register-btn" onclick="location.href='/admin/userList'">사용자 관리</button>
	        <span class="dropdown-button-content1"> 
				<p>가입 유저 목록</p>
				<p>유저 권한 변경</p>
				<p>유저 삭제</p>
			</span>
	        <button class="register-btn" onclick="location.href='/admin/scriptList'">게시물 관리</button>
	        <span class="dropdown-button-content2"> 
				<p>게시글 목록</p>
				<p>게시글 숨기기</p>
			</span>
	    </div>
	</div>    

    <jsp:include page="../layout/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/report/adminEntrance.js"></script>
</body>
<script type="text/javascript">
	document.querySelectorAll('.register-btn').forEach(span => {
		span.addEventListener('mouseover', e => {
			if(span.innerHTML === '사용자 관리'){
				document.querySelector('.dropdown-button-content1').style.display = 'block';
			}else {
				document.querySelector('.dropdown-button-content2').style.display = 'block';
			}
		});
		
		span.addEventListener('mouseleave', e => {
			if(span.innerHTML === '사용자 관리'){
				document.querySelector('.dropdown-button-content1').style.display = 'none';
			}else {
				document.querySelector('.dropdown-button-content2').style.display = 'none';
			}
		});
	});
</script>
</html>
