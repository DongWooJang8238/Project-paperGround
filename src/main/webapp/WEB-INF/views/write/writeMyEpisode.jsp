<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/writeMyEp.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="root">
		<div class="wrap">
			<div class="profile-writer-wrap">
				<div class="literature-gnb">
					<div class="logo">
						<img src="/assets/img/toplogo_blue.png" alt=""> 작품관리 <img
							class="beta-ic" src="/assets/ic/beta_icon.png" alt="">
					</div>
					<div class="link writeHome">
						<a href="#">조아라 웹소설 바로가기<img
							src="/assets/ic/list-item/subnav-list-ic.png" alt=""></a>
					</div>
				</div>
				<div class="profile-content custom">
					<div class="profile-ic">
						<img class="img"
							src="https://cf.joara.com/user_file/default_01.png" alt="">
						<div class="inner-border"></div>
					</div>
					<div class="profile-name">
						<div class="pen-ic"></div>
						<div class="name"><sec:authentication property="principal.user.nickName"/></div>
					</div>
					<div class="work-subnav-list">
						<a class="list-item" href="#">
							<div>
								연재작품<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">${series}</div></a>
						<a class="list-item"
							href="#"><div>
								완결작품<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">${complete}</div></a>
						<a class="list-item"
							href="#"><div>
								습작작품<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">${etude}</div></a>
					</div>
					<div class="banner-secondary moduled-bookWrite"
						data-testid="joa-Mainpage-onClickNewBook">
						<div class="moduled-bookWrite-left">
							<p data-testid="joa-Mainpage-onClickNewBook">새 작품 등록</p>
						</div>
						<div id="goWriteInsert" class="link" data-testid="joa-Mainpage-onClickNewBook">
							이동하기<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
						</div>
					</div>
						<c:forEach var="write" items="${list}">
					<div class="banner-secondary moduled-bookWrite"
						data-testid="joa-Mainpage-onClickNewBook">
							<div class="moduled-bookWrite-left">
								<h2 data-wno="${write.wno}" data-testid="joa-Mainpage-onClickNewBook">${write.title}</h2>
								<p data-testid="joa-Mainpage-onClickNewBook">${write.genre}</p>
							</div>
							<div class="link" data-wno="${write.wno}" data-testid="joa-Mainpage-onClickNewBook">
								<p>마지막 수정일 : ${write.updateDate}</p>
								연재하기<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
					</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/write/writeMyEp.js"></script>
</html>