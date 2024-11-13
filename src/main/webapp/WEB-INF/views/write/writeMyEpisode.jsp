<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/writeHome.css">
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
					<div class="link">
						<a href="/bridge/request/novel">조아라 웹소설 바로가기<img
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
						<div class="name">으닁</div>
					</div>
					<div class="pen-info">
						<button>
							<img src="/assets/ic/hint_icon.png" alt="">작가펜 안내
						</button>
					</div>
					<div class="work-subnav-list">
						<a class="list-item" href="/books/series"><div>
								연재작품<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">2</div></a><a class="list-item"
							href="/books/finish"><div>
								완결작품<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">0</div></a><a class="list-item"
							href="/books/study"><div>
								습작작품<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">1</div></a>
					</div>
					<div class="banner-primary">
						<a
							href="https://www.joara.com/writers-support?exdest=https%3A%2F%2Fwriter.joara.com%2F"><p>
								작가와 독자가 모두 만족한<br>작가지원 정책
							</p>
							<div class="link">
								이동하기<img src="/assets/ic/list-item/subnav-list-ic_wt.png" alt="">
							</div></a>
					</div>
					<div class="banner-secondary moduled-bookWrite"
						data-testid="joa-Mainpage-onClickNewBook">
						<div class="moduled-bookWrite-left">
							<p data-testid="joa-Mainpage-onClickNewBook">새 작품 등록</p>
						</div>
						<div class="link" data-testid="joa-Mainpage-onClickNewBook">
							이동하기<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../layout/header.jsp"></jsp:include>
</body>
</html>