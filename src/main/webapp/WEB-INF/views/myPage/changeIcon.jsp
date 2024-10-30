<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/myPage.css">
<title>프로필 변경</title>
<style type="text/css">
/* 전체 페이지 설정 */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

/* 메인 제목 섹션 */
.myPage-main {
    text-align: center;
    margin-top: 20px;
}

.myPage-title {
    font-size: 28px;
    color: #333;
    margin-bottom: 5px;
}

.myPage-subject {
    font-size: 16px;
    color: #777;
}

/* 메인 콘텐츠 */
.main-content {
    width: 100%;
    max-width: 800px;
    margin: 30px auto;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 유저 아이콘 이미지와 아이디 */
.header {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
}

#userIcon {
    border-radius: 50%;
    margin-right: 20px;
    border: 2px solid #ddd;
    width: 100px;
    height: 100px;
}

#userId {
    font-size: 18px;
    border: none;
    background-color: transparent;
    text-align: center;
    color: #333;
}

/* 이미지 삭제 버튼 */
#deleteImage {
    display: inline-block;
    cursor: pointer;
    font-size: 14px;
    color: #ff5a5a;
    margin-left: 10px;
}

#deleteImage:hover {
    color: #ff2a2a;
    text-decoration: underline;
}

/* 파일 선택과 버튼 영역 */
.profile-btn-area {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.profile-btn-area label {
    font-size: 16px;
    background-color: #5a67d8;
    color: #ffffff;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
    margin-bottom: 15px;
}

.profile-btn-area label:hover {
    background-color: #434bb7;
}

#imageInput {
    display: none;
}

#goChange {
    font-size: 16px;
    padding: 10px 20px;
    background-color: #38b2ac;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#goChange:hover {
    background-color: #319795;
}

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<form method="POST" enctype="multipart/form-data">
		<!-- 오른쪽 마이페이지 주요 내용 부분 -->
		<section class="myPage-main">

			<h1 class="myPage-title">유저 프로필</h1>
			<span class="myPage-subject">프로필 이미지를 변경할 수 있습니다.</span>

			<%--
                - multipart/form-data : 모든 문자를 인코딩하지 않음
				(원본 데이터가 유지되어 이미지, 파일 등을 서버로 전송할 수 있음)
               	--%>
		</section>


		<!-- Main content -->
		<div class="main-content">
			<div class="header">
				<c:if test="${empty result.userIcon}">
					 <img src="../resources/images/usericon.jpg" id="userIcon" alt="userIcon" width="100" height="100">
				</c:if>
				
				<c:if test="${not empty result.userIcon}">
					 <img src="${result.userIcon }" id="userIcon" alt="userIcon" width="100" height="100">
				</c:if>
				<input type="text" name="userId" id="userId" value="${result.userId }">
			</div>
			
			  <span id="deleteImage">x</span>

			<div class="profile-btn-area">
				<label for="imageInput">이미지 선택</label> 
				<input type="file"	name="userIcon" id="imageInput" value="" >
				<button type="button" id="goChange" onclick="goChangeIcon(this.form)">변경하기</button>
			</div>
			
			<div class="sidebar">
				<h3>마이페이지</h3>
				<ul>
					<li><a href="userShoping"
						onclick="toggleSubMenu('shopping-info')">쇼핑정보</a>
						<ul id="shopping-info" class="sub-menu">
							<li><a id="myOrder"
								href="/User/OrderSelect?mno=${sessionScope.vo.mno }">주문목록/배송조회</a></li>
							<li><a href="#">취소/반품/교환 내역</a></li>
						</ul></li>
					<li><a href="#" onclick="toggleSubMenu('benefit-management')">혜택관리</a>
						<ul id="benefit-management" class="sub-menu">
							<li><a a id ="myPoint" href="/User/selectMyPoint?mno=${sessionScope.vo.mno }">내 포인트</a></li>
							<li><a href="#">적립금</a></li>
						</ul></li>
					<li><a href="userInfo" onclick="toggleSubMenu('member-info')">회원정보</a>
						<ul id="member-info" class="sub-menu">
							<li><a id="checkPage"
								href="/User/checkPassword?userId=${sessionScope.vo.userId }">회원정보 수정</a></li>
							<li><a href="#">배송지 관리</a></li>
						</ul></li>
					<li><a href="/report/selectReport"
						onclick="toggleSubMenu('serviceCenter-info')">고객센터</a>
						<ul id="serviceCenter-info" class="sub-menu">
							<li><a id="reportCategory" href="/report/reportCategory">Q&A</a></li>
							<li><a id="reportBoard" href="/report/reportBoard?mno="1>문의센터</a></li>
							<li><a id="directReport" href="/report/directReport?mno="1>1:1문의</a></li>
						</ul></li>
					<li><a href="#">나의 게시글</a></li>
				</ul>
			</div>
	</form>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/myPage/changeIcon.js"></script>
<script type="text/javascript" src="/resources/js/myPage/sidebar.js"></script>
</html>
