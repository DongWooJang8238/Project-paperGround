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
						<div class="filter-list">
							<ul>
								<li class=""><button type="button" data-filter="category"
										class="filter-btn">
										<div>장르</div>
									</button></li>
								<li class=""><button type="button" data-filter="store"
										class="filter-btn">
										<div>종류</div>
									</button></li>
								<li class=""><button type="button" data-filter="orderby"
										class="filter-btn">
										<div>정렬</div>
									</button></li>
							</ul>
						</div>
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
							<li><div class="books-detail">
									<a data-link-type="book-preview" class="" href="/"><div
											class="sub-book-item col list col-100">
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

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/write/writeSidebar.js"></script>
<script type="text/javascript" src="/resources/js/write/wirteAllSelect.js"></script>
</html>
