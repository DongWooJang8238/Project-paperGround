<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문학 커뮤니티</title>
<!-- Swiper 스타일 시트 (CSS) -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="/resources/css/writeHome.css">
<link rel="stylesheet" href="/resources/css/writeSidebar.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="root">
		<div class="wrap">
			<div class="main-content-wrap">
				<div class="main-content">
					<div class="main-top-banner-wrap top">
						<div class="main-top-banner-container top">
							<div class="banner-page-arrow top hide">
								<button class="ic-arrow left">
									<img
										src="https://cf.joara.com/joara30FE/assets/icon/ico_arrow_banner.png"
										alt="left">
								</button>
								<button class="ic-arrow right">
									<img
										src="https://cf.joara.com/joara30FE/assets/icon/ico_arrow_banner.png"
										alt="right">
								</button>
							</div>
							<div class="slick-slider center slick-initialized" dir="ltr">
								<div class="slick-list" style="padding: 0px 245px;">
									<div class="slick-track"
										style="width: 7224px; left: -550px; opacity: 1;">
										<c:forEach var="write" items="${list}" varStatus="status" end="3">
											<div data-index="${status.index}" data-wno="${write.wno}" class="slick-slide slick-active slick-center slick-current"
											tabindex="-1" aria-hidden="false"
											style="outline: none; width: 516px;">
												
												<div>
													<div tabindex="-1"
														style="width: 100%; display: inline-block;">
														<a href="#" data-wno="${write.wno}" data-link-type="book-preview" data-testid="joa-slideBanner-link" data-idx="${status.index}"
															data-banner-idx="30143"
															data-uri="/bridge/request/itemshop-cash" data-target=""
															class=""><div class="thumb">
																<img
																	src="${write.coverImage}"
																	alt="배너" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
															</div>
															<div class="title">
																<div class="badge-txt">
																	<span>${write.genre}</span><span>${write.writeType}</span>
																</div>
																<div class="tit">${write.title}</div>
																<p class="txt">${write.writer}</p>
															</div></a>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="banner-dots top pc">
									<div class="gage-wrap">
										<div class="gage-count">
											<strong>1</strong><span>&nbsp;/&nbsp;3</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="main-quick-menu">
						<div class="inner">
							<ul>
								<li><a data-testid="joa-mainShort-1"
									href="#"><div class="icon">
											<img
												src="https://cf.joara.com/version_3_0/shortcut/20240729_121000.jpg"
												alt="전체작품">
										</div>
										<p>전체작품</p></a></li>
								<li><a data-testid="joa-mainShort-3" href="/board/list?pageNum=1&amount=10&category=1"><div	class="icon">
											<img
												src="https://cf.joara.com/version_3_0/shortcut/20240619_120531.jpg"
												alt="자유게시판">
										</div>
										<p>자유게시판</p></a></li>
								<li>
									<a id="myEp" data-testid="joa-mainShort-5"
										data-link="https://writer.joara.com/bridge/result/token?t=2915afde8952da986c5fad2bb571bd50"
										data-method="push" data-lnbclose="true" href="/"><div
												class="icon">
												<img
													src="https://cf.joara.com/version_3_0/shortcut/20240619_090831.gif"
													alt="작품등록">
											</div>
											<p>작품등록</p></a>
								</li>
							</ul>
						</div>
					</div>
					<section class="main-section paneNormal">
						<div class="section-head">
							<div class="title">투데이 베스트</div>
						</div>
						<div class="section-list-panel-normal">
							<div class="horizontal-scroll panel-slide" data-num="71">
								<div
									class="swiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden">
									<div class="swiper-wrapper"
										style="transform: translate3d(0px, 0px, 0px);">
										<div class="swiper-slide swiper-slide-active"
											style="margin-right: 15px;">
											<div class="horizontal-scroll-list">
												<c:forEach var="write" items="${list}" end="3" varStatus="status">
													<div class="item-box">
														<a data-wno="${write.wno}" data-link-type="book-preview" class="box" href="#"><div
																class="cover bookImg">
																<img
																	src="${write.coverImage}"
																	alt="표지" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
															</div>
															<div class="ranking-num">${status.count}</div>
															<div class="info">
																<div class="tit">${write.title}</div>
																<div class="txt">
																	<span>${write.writer}</span><span>${write.writeType}</span>
																</div>
															</div></a>
														<div class="icon-favorite">
															<button>
																<c:choose>
																	<c:when test="${write.writeBookMark == 'yes'}">
																		<img
																			src="https://cf.joara.com/joara30FE/assets/icon/ico_star_toggle.png"
																			alt="선호작 등록" data-wno="${write.wno}">
																	</c:when>
																	<c:otherwise>
																		<img
																			src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																			alt="선호작 등록" data-wno="${write.wno}">
																	</c:otherwise>
																</c:choose>
															</button>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<div class="swiper-slide swiper-slide-next"
											style="margin-right: 15px;">
											<div class="horizontal-scroll-list">
												<c:forEach var="write" items="${list}" begin="3" end="6" varStatus="status">
													<div class="item-box">
														<a data-wno="${write.wno}" data-link-type="book-preview" class="box" href="#"><div
																class="cover bookImg">
																<img
																	src="${write.coverImage}"
																	alt="표지" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
															</div>
															<div class="ranking-num">${status.count + 4}</div>
															<div class="info">
																<div class="tit">${write.title}</div>
																<div class="txt">
																	<span>${write.writer}</span><span>${write.writeType}</span>
																</div>
															</div></a>
														<div class="icon-favorite">
															<button>
																<c:choose>
																	<c:when test="${write.writeBookMark == 'yes'}">
																		<img
																			src="https://cf.joara.com/joara30FE/assets/icon/ico_star_toggle.png"
																			alt="선호작 등록" data-wno="${write.wno}">
																	</c:when>
																	<c:otherwise>
																		<img
																			src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																			alt="선호작 등록" data-wno="${write.wno}">
																	</c:otherwise>
																</c:choose>
															</button>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<div class="swiper-slide" style="margin-right: 15px;">
											<div class="horizontal-scroll-list">
												<c:forEach var="write" items="${list}" begin="6" end="9" varStatus="status">
													<div class="item-box">
														<a data-wno="${write.wno}" data-link-type="book-preview" class="box" href="#"><div
																class="cover bookImg">
																<img
																	src="${write.coverImage}"
																	alt="표지" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
															</div>
															<div class="ranking-num">${status.count + 8}</div>
															<div class="info">
																<div class="tit">${write.title}</div>
																<div class="txt">
																	<span>${write.writer}</span><span>${write.writeType}</span>
																</div>
															</div></a>
														<div class="icon-favorite">
															<button>
																<c:choose>
																	<c:when test="${write.writeBookMark == 'yes'}">
																		<img
																			src="https://cf.joara.com/joara30FE/assets/icon/ico_star_toggle.png"
																			alt="선호작 등록" data-wno="${write.wno}">
																	</c:when>
																	<c:otherwise>
																		<img
																			src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																			alt="선호작 등록" data-wno="${write.wno}">
																	</c:otherwise>
																</c:choose>
															</button>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div
									class="slide-button-prev slide-panel-normal-botton-prev-71 swiper-button-disabled"></div>
								<div class="slide-button-next slide-panel-normal-botton-next-71"></div>
							</div>
						</div>
					</section>
					<section class="main-section frameNormal">
						<div class="section-head">
							<div class="title">장르별</div>
						</div>
						<div class="section-tab-menu">
							<ul>
								<li class="active"><button data-tab_no="75">판타지</button></li>
								<li class=""><button data-tab_no="76">무협</button></li>
								<li class=""><button data-tab_no="77">로맨스</button></li>
								<li class=""><button data-tab_no="78">BL</button></li>
								<li class=""><button data-tab_no="79">패러디</button></li>
							</ul>
						</div>
						<div date-type="VERTICAL" class="section-list ">
							<div class="horizontal-scroll">
								<div>
									<div class="react-horizontal-scrolling-menu--wrapper ">
										<div class="react-horizontal-scrolling-menu--header"></div>
										<div class="react-horizontal-scrolling-menu--inner-wrapper">
											<div class="react-horizontal-scrolling-menu--arrow-left">
												<button
													style="cursor: pointer; display: flex; flex-direction: column; justify-content: center; right: 1%; opacity: 0; user-select: none;"
													disabled="">Left</button>
											</div>
											<div
												class="react-horizontal-scrolling-menu--scroll-container ">
												<c:forEach var="write" items="${list}" varStatus="status">
													<div class="react-horizontal-scrolling-menu--item "
														data-key="${status.index}" data-index="${status.index}" data-genre="${write.genre}">
														<div class="horizontal-scroll-list">
															<a data-wno="${write.wno}" data-link-type="book-preview" class="" href="/"><div
																	class="sub-book-item col base main">
																	<div class="cover col">
																		<div class="icon-favorite">
																			<button>
																				<c:choose>
																	<c:when test="${write.writeBookMark == 'yes'}">
																		<img
																			src="https://cf.joara.com/joara30FE/assets/icon/ico_star_toggle.png"
																			alt="선호작 등록" data-wno="${write.wno}">
																	</c:when>
																	<c:otherwise>
																		<img
																			src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																			alt="선호작 등록" data-wno="${write.wno}">
																	</c:otherwise>
																</c:choose>
																			</button>
																		</div>
																		<div class="img bookImg">
																			<img
																				src="${write.coverImage}"
																				alt="표지" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
																		</div>
																	</div>
																	<div class="caption">
																		<div class="info">
																			<span>${write.genre}</span><span>${write.writeType}</span>
																		</div>
																		<div class="tit clamp2">${write.title}</div>
																		<div class="nickname">${write.writer}</div>
																		<div class="view-count">
																			<span class="i-eye"><img
																				src="https://cf.joara.com/joara30FE/assets/icon/ico_eye.png"
																				alt=""></span><span class="in-txt">${write.views}</span>
																		</div>
																	</div>
																</div></a>
														</div>
													</div>
												</c:forEach>
											</div>
											<div class="react-horizontal-scrolling-menu--arrow-right">
												<button
													style="cursor: pointer; display: flex; flex-direction: column; justify-content: center; right: 1%; opacity: 1; user-select: none;">Right</button>
											</div>
										</div>
										<div class="react-horizontal-scrolling-menu--footer"></div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<!-- Swiper 스크립트 (JS) -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/resources/js/write/writeSidebar.js"></script>
<script type="text/javascript" src="/resources/js/write/wirteHome.js"></script>

</html>
