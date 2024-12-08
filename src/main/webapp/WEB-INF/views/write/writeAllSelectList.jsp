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
<link rel="stylesheet" href="/resources/css/writeHome.css">
<link rel="stylesheet" href="/resources/css/writeSidebar.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="root">
		<div class="wrap">
			<div class="sub-container">
				<div class="sub-filter-tab">
					<div class="inner">
						<div class="detailed-filter">
							<button type="button">
								<img
									src="https://cf.joara.com/joara30FE/assets/icon/ico_filter.png"
									alt="상세검색">
							</button>
						</div>
					</div>
				</div>
				<div
					style="right: 50%; height: 60px; justify-content: center; align-items: center; position: absolute; z-index: 10; transform: translate(50%, -400px); transition: 0.2s ease-in-out 0.2s;">
					<div
						style="width: 100%; height: 100px; display: flex; justify-content: center; align-items: center;">
						<div
							style="width: 40px; height: 40px; align-items: center; display: flex; justify-content: center; background-color: white; box-shadow: rgb(250, 239, 239) 0px 0px 0px 2px; border-radius: 100%;">
							<div
								class="MuiCircularProgress-root MuiCircularProgress-colorSecondary MuiCircularProgress-indeterminate"
								role="progressbar" style="width: 20px; height: 20px;">
								<svg class="MuiCircularProgress-svg" viewBox="22 22 44 44">
									<circle
										class="MuiCircularProgress-circle MuiCircularProgress-circleIndeterminate"
										cx="44" cy="44" r="20.2" fill="none" stroke-width="3.6"></circle></svg>
							</div>
						</div>
					</div>
				</div>
				<div class="sub-books-base">
					<ul>
						<c:forEach var="write" items="${list}">
							<li class="writeLi" data-genre="${write.genre}" data-filter="${write.writeType}"><div class="books-detail">
									<a data-link-type="book-preview" class="" href="/" data-wno="${write.wno}"><div
											class="sub-book-item col list col-100">
											<div class="cover col">
												<div class="icon-favorite">
													<button data-wno="${write.wno}">
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
													<img src="${write.coverImage}" alt="표지" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
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
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="filterDiv" style="display:none; position: fixed; inset: 0px; overflow: hidden; pointer-events: none; z-index: 9999999; visibility: visible;">
		<div
			class="react-modal-sheet-container pop-modal-pc-wrap pop-modal-pc-max380"
			style="z-index: 2; position: absolute; left: 0px; bottom: 0px; width: 100%; background-color: rgb(255, 255, 255); border-top-right-radius: 8px; border-top-left-radius: 8px; box-shadow: rgba(0, 0, 0, 0.3) 0px -2px 16px; display: flex; flex-direction: column; pointer-events: auto; transform: none;">
			<div class="react-modal-sheet-content "
				style="flex-grow: 1; display: flex; flex-direction: column; min-height: 0px; position: relative;">
				<div class="modal-sheet-background">
					<div class="modal-sheet">
						<div class="filter-content">
							<div id="filterGenre" class="item active">
								<div class="title">
									<div class="tit">장르</div>
									<div class="more">
										<button type="button" class="btn-cancel"
											data-filter="category">
											<img
												src="https://cf.joara.com/joara30FE/assets/icon/ico_minus.png"
												alt="접기">
										</button>
									</div>
								</div>
								<div class="cnt">
									<ul>
										<li><input type="checkbox" name="category"
											id="category_all" value="all" checked=""><label
											for="category_all">전체</label></li>
										<li><input type="checkbox" name="category"
											id="category_love" value="5"><label
											for="category_love">로맨스</label></li>
										<li><input type="checkbox" name="category"
											id="category_mofan" value="25"><label
											for="category_mofan">현대판타지</label></li>
										<li><input type="checkbox" name="category"
											id="category_gl" value="23"><label for="category_gl">GL</label></li>
										<li><input type="checkbox" name="category"
											id="category_rofan" value="22"><label
											for="category_rofan">로맨스판타지</label></li>
										<li><input type="checkbox" name="category"
											id="category_sports" value="21"><label
											for="category_sports">스포츠</label></li>
										<li><input type="checkbox" name="category"
											id="category_bl" value="20"><label for="category_bl">BL</label></li>
										<li><input type="checkbox" name="category"
											id="category_ltnovel" value="19"><label
											for="category_ltnovel">라이트노벨</label></li>
										<li><input type="checkbox" name="category"
											id="category_history" value="12"><label
											for="category_history">역사</label></li>
										<li><input type="checkbox" name="category"
											id="category_parody" value="9"><label
											for="category_parody">패러디</label></li>
										<li><input type="checkbox" name="category"
											id="category_military" value="8"><label
											for="category_military">밀리터리</label></li>
										<li><input type="checkbox" name="category"
											id="category_sf" value="7"><label for="category_sf">SF</label></li>
										<li><input type="checkbox" name="category"
											id="category_fanfic" value="6"><label
											for="category_fanfic">팬픽</label></li>
										<li><input type="checkbox" name="category"
											id="category_detect" value="15"><label
											for="category_detect">추리</label></li>
										<li><input type="checkbox" name="category"
											id="category_game" value="4"><label
											for="category_game">게임</label></li>
										<li><input type="checkbox" name="category"
											id="category_fusion" value="3"><label
											for="category_fusion">퓨전</label></li>
										<li><input type="checkbox" name="category"
											id="category_muhyep" value="2"><label
											for="category_muhyep">무협</label></li>
										<li><input type="checkbox" name="category"
											id="category_fantasy" value="1"><label
											for="category_fantasy">판타지</label></li>
										<li><input type="checkbox" name="category"
											id="category_horror" value="14"><label
											for="category_horror">공포</label></li>
										<li><input type="checkbox" name="category"
											id="category_poem" value="10"><label
											for="category_poem">시</label></li>
										<li><input type="checkbox" name="category"
											id="category_novel" value="11"><label
											for="category_novel">소설</label></li>
										<li><input type="checkbox" name="category"
											id="category_essay" value="13"><label
											for="category_essay">수필</label></li>
										<li><input type="checkbox" name="category"
											id="category_play" value="17"><label
											for="category_play">시나리오/희곡</label></li>
										<li><input type="checkbox" name="category"
											id="category_child" value="16"><label
											for="category_child">아동</label></li>
										<li><input type="checkbox" name="category"
											id="category_criticism" value="18"><label
											for="category_criticism">비평</label></li>
									</ul>
								</div>
							</div>
							<div id="filterType" class="item active">
								<div class="title">
									<div class="tit">종류</div>
									<div class="more">
										<button type="button" class="btn-cancel" data-filter="store">
											<img
												src="https://cf.joara.com/joara30FE/assets/icon/ico_minus.png"
												alt="접기">
										</button>
									</div>
								</div>
								<div class="cnt">
									<ul>
										<li><input type="radio" name="store" id="store_all"
											data-inputname="store" value="all" checked=""><label
											for="store_all">전체</label></li>
										<li><input type="radio" name="store" id="store_premium"
											data-inputname="store" value="premium"><label
											for="store_premium">유료연재</label></li>
										<li><input type="radio" name="store" id="store_series"
											data-inputname="store" value="series"><label
											for="store_series">무료연재</label></li>
									</ul>
								</div>
							</div>
							<div class="btn-zone">
								<button class="btn-reset">
									<img
										src="https://cf.joara.com/joara30FE/assets/icon/ico_restart.png"
										alt=""><span>초기화</span>
								</button>
								<button class="btn-apply">적용</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<button class="react-modal-sheet-backdrop "
			style="z-index: 1; position: fixed; top: 0px; left: 0px; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.2); touch-action: none; border: none; pointer-events: auto; opacity: 1;"></button>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/write/writeSidebar.js"></script>
<script type="text/javascript" src="/resources/js/write/wirteAllSelect.js"></script>
</html>
