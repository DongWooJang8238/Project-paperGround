<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="sidebar">
				<h3>마이페이지</h3>
				<ul>
					<li><a href="userInfo" onclick="toggleSubMenu('member-info')">회원정보</a>
						<ul id="member-info" class="sub-menu">
							<li><a id="checkPage"
								href="/User/myPageUpdate?userId=${sessionScope.vo.userId }">회원정보 수정</a></li>
							<li><a href="#">내 찜리스트</a></li>
							<li><a a id ="myPoint" href="/User/selectMyPoint?mno=${sessionScope.vo.mno }">내 포인트</a></li>
						</ul></li>
					<li><a href="userShoping"
						onclick="toggleSubMenu('shopping-info')">쇼핑정보</a>
						<ul id="shopping-info" class="sub-menu">
							<li><a id="myOrder"
								href="/User/OrderSelect?mno=${sessionScope.vo.mno }">주문목록/배송조회</a></li>
							<li><a href="#">취소/반품/내역</a></li>
							<li><a id="myOrder"
								href="/User/">내 중고상품</a></li>
						</ul></li>
					<li><a href="#" onclick="toggleSubMenu('benefit-management')">활동정보</a>
						<ul id="benefit-management" class="sub-menu">
							<li><a href="#">내 게시글/댓글</a></li>
							<li><a href="#">집필 북마크</a></li>
						</ul></li>
					<li><a href="/report/selectReport"
						onclick="toggleSubMenu('serviceCenter-info')">고객센터</a>
						<ul id="serviceCenter-info" class="sub-menu">
							<li><a id="reportCategory" href="/report/qna">Q&A</a></li>
							<li><a id="reportBoard" href="/report/reportBoard?mno=${sessionScope.vo.mno}">문의센터</a></li>
							<li><a id="directReport" href="/report/directReport?mno=${sessionScope.vo.mno}">1:1문의</a></li>
						</ul></li>
					<li><a href="#">회원 탈퇴</a></li>
				</ul>
			</div>
</body>
<script type="text/javascript" src="/resources/js/myPage/sidebar.js"></script>
</html>