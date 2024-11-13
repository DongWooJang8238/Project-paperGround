<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문학 커뮤니티</title>
<link rel="stylesheet" href="/resources/css/writeHome.css">
<link rel="stylesheet" href="/resources/css/writeSidebar.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="root">
		<div class="wrap">
			<div class="main-content-wrap">
				<div class="left-category-content">
					<div class="left-quick-menu">
						<ul>
							<li class=""><a data-testid="joa-bottommenu-finish"
								data-path="/finishbooks" href="#"><div
										class="icon">
										<img
											src="https://cf.joara.com/joara30FE/assets/icon/ico_bottom_list_pc.png"
											alt="완결작품">
									</div>
									<p>완결작품</p></a></li>
							<li class=""><a data-testid="joa-bottommenu-new"
								data-path="/latestbooks" href="#"><div
										class="icon">
										<img
											src="https://cf.joara.com/joara30FE/assets/icon/ico_bottom_mylibrary_pc.png"
											alt="최신작품">
									</div>
									<p>최신작품</p></a></li>
							<li class=""><a data-testid="joa-bottommenu-best"
								data-path="/todaybest" href="#"><div class="icon">
										<img
											src="https://cf.joara.com/joara30FE/assets/icon/ico_bottom_ranking_pc.png"
											alt="베스트">
									</div>
									<p>베스트</p></a></li>
						</ul>
					</div>
				</div>
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
										style="width: 7224px; left: -2580px; opacity: 1;">
										<div data-index="-2" tabindex="-1"
											class="slick-slide slick-cloned" aria-hidden="true"
											style="width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="4"
														data-banner-idx="30143"
														data-uri="/bridge/request/itemshop-cash" data-target=""
														class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240619_150343.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>아이템샵</span><span>첫 결제 혜택</span>
															</div>
															<div class="tit">첫 결제요? 딱지 더 받아가요!</div>
															<p class="txt">웰컴! 첫 결제자는 딱지 30% 추가 지급</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="-1" tabindex="-1"
											class="slick-slide slick-cloned" aria-hidden="true"
											style="width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="5"
														data-banner-idx="30142"
														data-uri="/bridge/request/itemshop-cash" data-target=""
														class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240619_150315.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>정주행 대비 </span><span> 딱지 충전</span>
															</div>
															<div class="tit">웹결제 필수공식 [1딱지 = 100원]</div>
															<p class="txt">추가 수수료 없는 웹결제!</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="0" class="slick-slide" tabindex="-1"
											aria-hidden="true" style="outline: none; width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="0"
														data-banner-idx="32777" data-uri="/book/1684491"
														data-target="" class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20241104_222411.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>공포</span><span>프리미엄</span><span>미스터리</span><span>한국무속</span>
															</div>
															<div class="tit">
																부두술 하나로 <br>노예에서 전설까지!
															</div>
															<p class="txt">&lt;부두레코드&gt; 젊은단테</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="1" class="slick-slide" tabindex="-1"
											aria-hidden="true" style="outline: none; width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="1"
														data-banner-idx="32778" data-uri="/book/1627078"
														data-target="" class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20241104_222453.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>공포</span><span>프리미엄</span><span>괴담</span><span>호러</span>
															</div>
															<div class="tit">
																괴담 마니아가 전해주는 <br>무시무시한 이야기
															</div>
															<p class="txt">&lt;괴담 바이러스&gt; 전건우</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="2" class="slick-slide" tabindex="-1"
											aria-hidden="true" style="outline: none; width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="2"
														data-banner-idx="31737" data-uri="/latestbooks?tab=1"
														data-target="" class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240912_183100.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>제10회 판무 테마공모전</span><span>점화</span><span>작품
																	보러 가기🔥</span>
															</div>
															<div class="tit">창작의 불씨를 키울 때!</div>
															<p class="txt">10. 10(목) 10:00 ~ 11. 27(수) 23:59</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="3"
											class="slick-slide slick-active slick-center slick-current"
											tabindex="-1" aria-hidden="false"
											style="outline: none; width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="3"
														data-banner-idx="30144" data-uri="/notice/1000189"
														data-target="" class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240619_150408.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>정기구독</span><span>가격할인</span><span>무제한 연장</span>
															</div>
															<div class="tit">하루 400원대로 만나는 웹소설</div>
															<p class="txt">노블레스 1달 이용료가 반값!</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="4" class="slick-slide" tabindex="-1"
											aria-hidden="true" style="outline: none; width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="4"
														data-banner-idx="30143"
														data-uri="/bridge/request/itemshop-cash" data-target=""
														class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240619_150343.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>아이템샵</span><span>첫 결제 혜택</span>
															</div>
															<div class="tit">첫 결제요? 딱지 더 받아가요!</div>
															<p class="txt">웰컴! 첫 결제자는 딱지 30% 추가 지급</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="5" class="slick-slide" tabindex="-1"
											aria-hidden="true" style="outline: none; width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="5"
														data-banner-idx="30142"
														data-uri="/bridge/request/itemshop-cash" data-target=""
														class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240619_150315.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>정주행 대비 </span><span> 딱지 충전</span>
															</div>
															<div class="tit">웹결제 필수공식 [1딱지 = 100원]</div>
															<p class="txt">추가 수수료 없는 웹결제!</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="6" tabindex="-1"
											class="slick-slide slick-cloned" aria-hidden="true"
											style="width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="0"
														data-banner-idx="32777" data-uri="/book/1684491"
														data-target="" class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20241104_222411.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>공포</span><span>프리미엄</span><span>미스터리</span><span>한국무속</span>
															</div>
															<div class="tit">
																부두술 하나로 <br>노예에서 전설까지!
															</div>
															<p class="txt">&lt;부두레코드&gt; 젊은단테</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="7" tabindex="-1"
											class="slick-slide slick-cloned" aria-hidden="true"
											style="width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="1"
														data-banner-idx="32778" data-uri="/book/1627078"
														data-target="" class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20241104_222453.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>공포</span><span>프리미엄</span><span>괴담</span><span>호러</span>
															</div>
															<div class="tit">
																괴담 마니아가 전해주는 <br>무시무시한 이야기
															</div>
															<p class="txt">&lt;괴담 바이러스&gt; 전건우</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="8" tabindex="-1"
											class="slick-slide slick-cloned" aria-hidden="true"
											style="width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="2"
														data-banner-idx="31737" data-uri="/latestbooks?tab=1"
														data-target="" class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240912_183100.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>제10회 판무 테마공모전</span><span>점화</span><span>작품
																	보러 가기🔥</span>
															</div>
															<div class="tit">창작의 불씨를 키울 때!</div>
															<p class="txt">10. 10(목) 10:00 ~ 11. 27(수) 23:59</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="9" tabindex="-1"
											class="slick-slide slick-center slick-cloned"
											aria-hidden="true" style="width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="3"
														data-banner-idx="30144" data-uri="/notice/1000189"
														data-target="" class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240619_150408.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>정기구독</span><span>가격할인</span><span>무제한 연장</span>
															</div>
															<div class="tit">하루 400원대로 만나는 웹소설</div>
															<p class="txt">노블레스 1달 이용료가 반값!</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="10" tabindex="-1"
											class="slick-slide slick-cloned" aria-hidden="true"
											style="width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="4"
														data-banner-idx="30143"
														data-uri="/bridge/request/itemshop-cash" data-target=""
														class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240619_150343.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>아이템샵</span><span>첫 결제 혜택</span>
															</div>
															<div class="tit">첫 결제요? 딱지 더 받아가요!</div>
															<p class="txt">웰컴! 첫 결제자는 딱지 30% 추가 지급</p>
														</div></a>
												</div>
											</div>
										</div>
										<div data-index="11" tabindex="-1"
											class="slick-slide slick-cloned" aria-hidden="true"
											style="width: 516px;">
											<div>
												<div tabindex="-1"
													style="width: 100%; display: inline-block;">
													<a href="#" data-testid="joa-slideBanner-link" data-idx="5"
														data-banner-idx="30142"
														data-uri="/bridge/request/itemshop-cash" data-target=""
														class=""><div class="thumb">
															<img
																src="https://cf.joara.com/banner_file/20240619_150315.jpg"
																alt="배너">
														</div>
														<div class="title">
															<div class="badge-txt">
																<span>정주행 대비 </span><span> 딱지 충전</span>
															</div>
															<div class="tit">웹결제 필수공식 [1딱지 = 100원]</div>
															<p class="txt">추가 수수료 없는 웹결제!</p>
														</div></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="banner-dots top pc">
									<div class="gage-wrap">
										<div class="gage-count">
											<strong>4</strong><span>&nbsp;/&nbsp;6</span>
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
								<li><a data-testid="joa-mainShort-3" href="#"><div	class="icon">
											<img
												src="https://cf.joara.com/version_3_0/shortcut/20240619_120531.jpg"
												alt="자유게시판">
										</div>
										<p>자유게시판</p></a></li>
								<li><a data-testid="joa-mainShort-5"
									data-link="https://writer.joara.com/bridge/result/token?t=2915afde8952da986c5fad2bb571bd50"
									data-method="push" data-lnbclose="true" data-target="" href="#"><div
											class="icon">
											<img
												src="https://cf.joara.com/version_3_0/shortcut/20240619_090831.gif"
												alt="작품등록">
										</div>
										<p>작품등록</p></a></li>
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
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/cover_file/20240624_1010145206.jpg"
																alt="1776048표지">
														</div>
														<div class="ranking-num">1</div>
														<div class="info">
															<div class="tit">악역이 되는 법</div>
															<div class="txt">
																<span>잊지못할거야</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/cover_file/20240624_1001024705.jpg"
																alt="1781928표지">
														</div>
														<div class="ranking-num">2</div>
														<div class="info">
															<div class="tit">고인물이 뉴비 납치해서 키운다</div>
															<div class="txt">
																<span>우울또a</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/2069423_1730602250_thumb.png"
																alt="1780419표지">
														</div>
														<div class="ranking-num">3</div>
														<div class="info">
															<div class="tit">집착엔 약도 없습니다</div>
															<div class="txt">
																<span>파인애플샤베트</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="swiper-slide swiper-slide-next"
											style="margin-right: 15px;">
											<div class="horizontal-scroll-list">
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/2073150_1728661681_thumb.jpeg"
																alt="1767688표지">
														</div>
														<div class="ranking-num">4</div>
														<div class="info">
															<div class="tit">[화산귀환] 역하렘 시뮬레이션</div>
															<div class="txt">
																<span>원정대원</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/cover_file/20190328_164317.png"
																alt="1779697표지">
														</div>
														<div class="ranking-num">5</div>
														<div class="info">
															<div class="tit">악역은 하차가 하고 싶다</div>
															<div class="txt">
																<span>개나리콘</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/1791670_1731129235_thumb.jpeg"
																alt="1771645표지">
														</div>
														<div class="ranking-num">6</div>
														<div class="info">
															<div class="tit">[원피스]소원 들어준 놈 나와봐</div>
															<div class="txt">
																<span>오저비</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="swiper-slide" style="margin-right: 15px;">
											<div class="horizontal-scroll-list">
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/1329865_1730647929_thumb.jpg"
																alt="1781833표지">
														</div>
														<div class="ranking-num">7</div>
														<div class="info">
															<div class="tit">어느 미친 황녀님의 문제적 가출</div>
															<div class="txt">
																<span>수지Suzy</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/555476_1722697685_thumb.png"
																alt="1746594표지">
														</div>
														<div class="ranking-num">8</div>
														<div class="info">
															<div class="tit">
																<span class="i-adult"><img
																	src="https://cf.joara.com/joara30FE/assets/badge/badge_adult.png"
																	alt="19"></span>반비례
															</div>
															<div class="txt">
																<span>틸틴</span><span>노블레스</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/20240905_2351071403.jpg_thumb.png"
																alt="1770248표지">
														</div>
														<div class="ranking-num">9</div>
														<div class="info">
															<div class="tit">피버 타임 (fever time)</div>
															<div class="txt">
																<span>한모래</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="swiper-slide" style="margin-right: 15px;">
											<div class="horizontal-scroll-list">
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/1398233_1730367704_thumb.png"
																alt="1778105표지">
														</div>
														<div class="ranking-num">10</div>
														<div class="info">
															<div class="tit">바닥에서 한 뼘</div>
															<div class="txt">
																<span>할로윈1</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/cover_file/20221221_1448041541.jpg"
																alt="1775010표지">
														</div>
														<div class="ranking-num">11</div>
														<div class="info">
															<div class="tit">시한부 엑스트라가 건강합니다</div>
															<div class="txt">
																<span>괴강</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/cover_file/20190329_154631.jpg"
																alt="1760252표지">
														</div>
														<div class="ranking-num">12</div>
														<div class="info">
															<div class="tit">
																<span class="i-adult"><img
																	src="https://cf.joara.com/joara30FE/assets/badge/badge_adult.png"
																	alt="19"></span>오늘 너의 세상은
															</div>
															<div class="txt">
																<span>금자목발</span><span>노블레스</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
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
					<section class="main-section paneThumbnail">
						<div class="section-head">
							<div class="title">내가 바라는 건 하나야, 재밌는 이야기😁</div>
						</div>
						<div class="section-list-panel-normal">
							<div class="horizontal-scroll panel-slide" data-num="509">
								<div
									class="swiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden">
									<div class="swiper-wrapper"
										style="transform: translate3d(0px, 0px, 0px);">
										<div class="swiper-slide swiper-slide-active"
											style="margin-right: 15px;">
											<div class="horizontal-scroll-list">
												<div class="special-box">
													<a href="#"><div
															class="special-tit">부산국제영화제 ACFM 선정작!🎉</div>
														<div class="special-thumb">
															<div class="num">총 6 작품</div>
															<div class="img">
																<img
																	src="https://cf.joara.com/version_3_0/gnb_section_content/20240930_142217.jpg"
																	alt="%total_cnt%">
															</div>
														</div></a>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/20240830_2003403258.jpg_thumb.png"
																alt="1754398표지">
														</div>
														<div class="info">
															<div class="tit">리딩, 읽을 수 없음</div>
															<div class="txt">
																<span>세유아</span><span>노블X프리</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/20230912_1327037833.jpg_thumb.png"
																alt="1633207표지">
														</div>
														<div class="info">
															<div class="tit">여름내 (개정판)</div>
															<div class="txt">
																<span>진소민jsomin</span><span>노블X프리</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="swiper-slide swiper-slide-next"
											style="margin-right: 15px;">
											<div class="horizontal-scroll-list">
												<div class="special-box">
													<a href="#"><div
															class="special-tit">범인은 분명, 현장에 돌아온다🔎</div>
														<div class="special-thumb">
															<div class="img">
																<img
																	src="https://cf.joara.com/version_3_0/gnb_section_content/20241031_095008.jpg"
																	alt="">
															</div>
														</div></a>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/1289711_1724586916_thumb.jpg"
																alt="1645854표지">
														</div>
														<div class="info">
															<div class="tit">도시전설의 탐정과 기록하는 조수</div>
															<div class="txt">
																<span>TZS</span><span>무료 연재</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
												<div class="item-box">
													<a data-link-type="book-preview" class="box" href="#"><div
															class="cover bookImg">
															<img
																src="https://cf.joara.com/literature_file/20211214_1438565029.jpg_thumb.png"
																alt="1595039표지">
														</div>
														<div class="info">
															<div class="tit">별자리 살인마 : 너를 추억한다</div>
															<div class="txt">
																<span>[징구빙구]</span><span>프리미엄</span>
															</div>
														</div></a>
													<div class="icon-favorite">
														<button>
															<img
																src="https://cf.joara.com/joara30FE/assets/icon/ico_star.png"
																alt="선호작 등록">
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div
									class="slide-button-prev slide-panel-normal-thumbnail-prev-509 swiper-button-disabled swiper-button-lock"></div>
								<div
									class="slide-button-next slide-panel-normal-thumbnail-next-509 swiper-button-disabled swiper-button-lock"></div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/write/writeSidebar.js"></script>
<script type="text/javascript" src="/resources/js/write/wirteHome.js"></script>
</html>