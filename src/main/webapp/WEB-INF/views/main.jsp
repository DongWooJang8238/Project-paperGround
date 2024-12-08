<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/main.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 화면</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style type="text/css">
.slide {
	/* layout */
	display: flex;
	flex-wrap: nowrap;
	/* 컨테이너의 내용물이 컨테이너 크기(width, height)를 넘어설 때 보이지 않도록 하기 위해 hidden을 준다. */
	overflow: hidden;
	/* position */
	/* slide_button의 position absolute가 컨테이너 안쪽에서 top, left, right offset이 적용될 수 있도록 relative를 준다. (기본값이 static인데, static인 경우 그 상위 컨테이너로 나가면서 현재 코드에선 html을 기준으로 offset을 적용시키기 때문) */
	position: relative;
	/* size */
	width: 100%;
	/* slide drag를 위해 DOM요소가 드래그로 선택되는것을 방지 */
	user-select: none;
}

.slide_item {
	/* layout */
	display: flex;
	align-items: center;
	justify-content: center;
	/* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
	position: relative;
	left: 0px;
	/* size */
	width: 100%;
	height: 350px;
	/* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
	flex-shrink: 0;
	/* transition */
	transition: left 0.15s;

	/* margin: 20px; */
}

.slide_button {
	/* layout */
	display: flex;
	justify-content: center;
	align-items: center;
	/* position */
	position: absolute;
	/* 버튼이 중앙에 위치하게 하기위해 계산 */
	top: calc(50% - 16px);
	/* size */
	width: 32px;
	height: 32px;
	/* style */
	border-radius: 100%;
	cursor: pointer;
}

.slide_prev_button {
	left: 10px;
}

.slide_next_button {
	right: 10px;
}

/* 각 슬라이드가 변경되는 것을 시각적으로 확인하기 쉽도록 각 슬라이드별 색상 적용 */

/* 페이지네이션 스타일 */
ul, li {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.slide_pagination {
	/* layout */
	display: flex;
	gap: 5px;
	/* position */
	position: absolute;
	bottom: 0;
	/* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
	left: 50%;
	transform: translateX(-50%);
}

.slide_pagination>li {
	/* 현재 슬라이드가 아닌 것은 투명도 부여 */
	color: #7fb5ff88;
	cursor: pointer;
	font-size: 37px;
}

.slide_pagination>li.active {
	/* 현재 슬라이드 색상은 투명도 없이 */
	color: #7fb5ff;
}

.slide_item_duplicate {
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	left: 0px;
	width: 100%;
	height: 400px;
	flex-shrink: 0;
	transition: left 0.15s;
}
/* 이미지 크기 조정 */
img.right-arrow {
	width: 50px; /* 원하는 너비 */
	height: auto; /* 비율 유지 */
	transform: scaleX(-1); /* 좌우 반전 */
}

/* 좌우 반전 적용 */
img.left-arrow {
	width: 50px; /* 동일 크기로 설정 */
	height: auto; /* 비율 유지 */
}

/* 기본적으로 화살표를 숨김 */
.slide_button {
	opacity: 0;
	transition: opacity 0.3s;
}

/* 마우스를 올리면 화살표를 표시 */
.slide:hover .slide_button {
	opacity: 1;
}

.main-cover {
	flex-shrink: 0;
	text-align: center;
	background-color: #ffffff; /* 흰색 */
	border-radius: 10px; /* 둥근 모서리 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 가벼운 그림자 */
	width: 400px; /* 너비를 조금 키움 */
	height: 650px; /* 높이를 조금 키움 */
	padding: 20px; /* 내부 여백을 추가 */
}

.main-cover img {
	width: 320px;
	height: auto;
	border-radius: 10px;
}

.title {
	font-size: 16px;
	margin-top: 10px;
}

.side-covers {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.cover-item {
	display: flex;
	gap: 15px;
	margin: 5px 0;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 15px;
	width: 100%;
}

.cover-item img {
	width: 110px; /* 표지 크기 */
	height: auto; /* 비율 유지 */
	border-radius: 8px; /* 모서리 둥글게 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 가벼운 그림자 */
}

.cover-text {
	display: flex; /* 텍스트들을 세로로 정렬 */
	flex-direction: column;
	justify-content: center;
	gap: 5px; /* 제목과 저자 간 간격 */
}

.cover-title {
	font-size: 18px; /* 제목 크기 */
	font-weight: bold; /* 굵은 텍스트 */
	margin: 0; /* 기본 여백 제거 */
	line-height: 1.4; /* 줄 간격 */
}

.cover-author {
	font-size: 14px; /* 저자 크기 */
	color: #666666; /* 약간 흐린 글자 색상 */
	margin: 0; /* 기본 여백 제거 */
}

/* 순위 아이콘 스타일 */
.cover-rank {
	font-size: 25px;
	color: #767676;
	margin-right: 10px;
}

.cover-rank i {
	display: inline-block;
	vertical-align: middle;
}

.today-book-label {
	font-size: 24px;
	font-weight: bold;
	text-align: left; /* 왼쪽 정렬 */
	margin-left: 2px; /* 왼쪽 여백 */
	margin-bottom: 35px; /* 아래 여백 */
	color: #333333; /* 텍스트 색상 */
}

.all {
	background-color: #f5f5f5; 
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif; /* 기본 폰트 */
	height: 1100px;
}

.ranking_list li {
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	margin-bottom: 10px;
}

/* 댓글 수 빨간색으로 표시 */
.replyCount {
	color: red;
}

/* .container1의 책들 간 간격을 띄우고, 각 표지가 div에 맞게 설정 */
.container1 {
	display: flex;
	gap: 200px;
	padding: 20px;
	gap: 200px;
}

}

/* 각 책의 스타일 */
.book {
	text-align: center;
	width: 150px; /* 책 표지의 크기를 고정 */
}

.book img {

	width: 100%; /* 원하는 크기 */
	min-width : 250px;
	max-width : 250px;
    height: 300px; /* 원하는 크기 */
    image-rendering: crisp-edges; /* 픽셀 형태로 렌더링 */
    object-fit: cover; /* 이미지를 비율에 맞게 잘라 표시 */
	border-radius: 5px;
	box-shadow: 0 9px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 10px;
}



.book-info {
	text-align: center; /* 내용 가운데 정렬 */
	margin-top: 10px; /* 제목과 장르, 출판사 간격 */
}

/* 타이틀과 작가 이름을 표지 밑에 가운데 정렬 */
.book-info .book .genre, .book h3, .book .publisher {
	text-align: center;
	margin: 5px 0; /* 각 요소 간 간격 */
}

/* 타이틀과 작가 이름의 스타일 */
.book h3 {
	font-size: 14px; /* 타이틀 크기 */
	margin-bottom: 5px;
	color: #333333; /* 타이틀 색상 */
}

.book .publisher {
	font-size: 12px; /* 저자 이름 크기 */
	color: gray; /* 색상 */
}

.userRecommended{
	background-color: #fffff;
	width: 100%;
	margin: 50px;
	padding: 10px;
}

.userRecommended h1{
	margin-left: 11%
}

.badge {
    position: absolute; /* 메인 이미지 위에 배치 */
    top: 690px; /* 상단 간격 */
    left: 270px; /* 좌측 간격 */
    width: 50px; /* 배지 이미지 크기 조정 */
    z-index: 1; /* 메인 이미지 위로 오도록 */
}

.notice-box {
         display: inline-block; /* 글자 크기에 맞게 박스 크기 조정 */
         padding: 5px 10px; /* 내부 여백 */
         background-color: #f0f0f0; /* 박스 배경색 */
         border: 1px solid #ccc; /* 테두리 색상 */
         border-radius: 10px; /* 모서리 둥글게 */
         font-family: Arial, sans-serif; /* 글꼴 */
         font-size: 14px; /* 글자 크기 */
         color: #333; /* 글자 색상 */
         text-align: center; /* 글자 정렬 */
         box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 박스 그림자 */
     }
</style>
</head>
<body>
	<form class="all">
		<div class="container">
			<div class="slide slide_wrap">
				<div class="slide_item item1" data-href="/"><img style="max-width: 100%;" class="swiper-lazy swiper-lazy-loaded" alt="급류" src="/resources/images/pageGroundBaner.png"></div>
				<div class="slide_item item2" data-href="https://soldesk.com/"><img style="max-width: 100%;" class="swiper-lazy swiper-lazy-loaded" alt="급류" src="/resources/images/soldesk.png"></div>
				<div class="slide_item item3" data-href="https://chatgpt.com/"><img style="max-width: 100%;" class="swiper-lazy swiper-lazy-loaded" alt="급류" src="/resources/images/winterLife.png"></div>
				<sec:authorize access="isAuthenticated()">
					<div class="slide_item item4" data-href="/write/home?mno=<sec:authentication property="principal.user.mno"/>"><img style="max-width: 100%;" class="swiper-lazy swiper-lazy-loaded" alt="급류" src="/resources/images/writing.png"></div>
          		</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<div class="slide_item item4" data-href="/write/home?mno=0"><img style="max-width: 100%;" class="swiper-lazy swiper-lazy-loaded" alt="급류" src="/resources/images/writing.png"></div>
				</sec:authorize>
				<div class="slide_item item5" data-href=""><img style="max-width: 100%;" class="swiper-lazy swiper-lazy-loaded" alt="급류" src="https://contents.kyobobook.co.kr/advrcntr/IMAC/creatives/2024/11/13/41296/i_1624_45033.png"></div>
				<div class="slide_prev_button slide_button">
					<img class="left-arrow"
						src="https://cf.joara.com/joara30FE/assets/icon/ico_arrow_banner.png"
						alt="left">
				</div>
				<div class="slide_next_button slide_button">
					<img class="right-arrow"
						src="https://cf.joara.com/joara30FE/assets/icon/ico_arrow_banner.png"
						alt="right">
				</div>
				<ul class="slide_pagination"></ul>
			</div>
			<br> <br>
				<div class="section">
					<div class="main-cover" data-bno="${BestSellerList[0].bno}">
						<!-- 	<div class="cover-rank">
							<i class="bi bi-1-square"></i>
							1등 아이콘
						</div> -->
						<div class="today-book-label">베스트 셀러</div>
						<img
							onerror="this.onerror=null; this.src=&quot;https:\/\/contents.kyobobook.co.kr\/resources\/dig-fo\/dig\/images\/ink\/treatise\/no_img_treatise.png&quot;"
							loading="lazy"
							src="https://contents.kyobobook.co.kr/sih/fit-in/250x400/pdt/480D240943480.jpg"
							alt="">
						<img src="../resources/images/best-seller.png" class="badge" alt="베스트셀러"  style="width: 160px;" />
						<p class="title">${BestSellerList[0].title }</p>
						<p class="cover-author">${BestSellerList[0].writer }·
							${BestSellerList[0].publisher }</p>
					</div>
					<div class="side-covers">
						<div class="cover-item" data-bno="${BestSellerList[1].bno}">
							<div class="cover-rank">
								<i class="bi bi-2-square"></i>
								<!-- 2등 아이콘 -->
							</div>
							<img
								onerror="this.onerror=null; this.src='https://contents.kyobobook.co.kr/resources/dig-fo/dig/images/ink/treatise/no_img_treatise.png'"
								loading="lazy"
								src="https://contents.kyobobook.co.kr/sih/fit-in/250x400/pdt/480D240926790.jpg"
								alt="">
							<div class="cover-text">
								<p>${BestSellerList[1].title }</p>
								<span class="cover-author">${BestSellerList[1].writer }·
									${BestSellerList[1].publisher }</span>
							</div>
						</div>

						<div class="cover-item" data-bno="${BestSellerList[2].bno}">
							<div class="cover-rank">
								<i class="bi bi-3-square"></i>
								<!-- 3등 아이콘 -->
							</div>
							<img
								onerror="this.onerror=null; this.src='https://contents.kyobobook.co.kr/resources/dig-fo/dig/images/ink/treatise/no_img_treatise.png'"
								loading="lazy"
								src="https://contents.kyobobook.co.kr/sih/fit-in/250x400/pdt/480N241041650.jpg"
								alt="">
							<div class="cover-text">
								<p>${BestSellerList[2].title }</p>
								<span class="cover-author">${BestSellerList[2].writer }·
									${BestSellerList[2].publisher }</span>
							</div>
						</div>

						<div class="cover-item" data-bno="${BestSellerList[3].bno}">
							<div class="cover-rank">
								<i class="bi bi-4-square"></i>
								<!-- 4등 아이콘 -->
							</div>
							<img
								onerror="this.onerror=null; this.src='https://contents.kyobobook.co.kr/resources/dig-fo/dig/images/ink/treatise/no_img_treatise.png'"
								loading="lazy"
								src="https://contents.kyobobook.co.kr/sih/fit-in/250x400/pdt/4801170612002.jpg"
								alt="">
							<div class="cover-text">
								<p>${BestSellerList[3].title }</p>
								<span class="cover-author">${BestSellerList[3].writer }·
									${BestSellerList[3].publisher }</span>
							</div>
						</div>
					</div>
					<div class="popular">
						<div class="box_access_ranking box_content lc">
							<div class="headings"></div>

							<div class="tabs">
								<ul class="tabs_menu">
									<li class="tabs_menu01 active"><a href="#tabs_content01"
										style="">인기 게시글</a></li>
									<li class="tabs_menu02"><a href="#tabs_content02" style="">공지사항</a></li>
									<!-- /.tabs_menu -->
								</ul>
								<div id="tabs_content01" class="tab_content" style="display: block;">
									<div>
										<c:forEach var="BL" items="${boardLikesList}" end="5">
											<ul class="seller_ranking_list ranking_list">
												<li><a href="/board/get?boardno=${BL.boardno}" class="clr">
														<p class="title">${BL.title}
															<span class="replyCount">[${BL.replyCount }]</span>
														</p>
												</a></li>
											</ul>
										</c:forEach>
									</div>

									<p class="bt_more">
										<a id="boradMore" href="/ranking-review">더보기</a>
									</p>
								</div>

								<div id="tabs_content02" class="tab_content"
									style="display: none;">
									<!-- Ranklet4 https://ranklet4.com/ BookBangニュース -->
									<div>
										<c:forEach var="BAL" items="${boardAnnouncementList }" end="5">
											<ul class="seller_ranking_list ranking_list">
												<li>
														<a href="/board/get?boardno=${BAL.boardno}" style="left: 0%"><p class="title"><div class="notice-box">공지</div>&ensp;${BAL.title }</p></a>
												</li>
											</ul>
										</c:forEach>
									</div>
									<style></style>

									<p class="bt_more">
										<a id="newsMore" href="/ranking-news">더보기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
			</div>
			</div>
	</form>

	<div class="userRecommended">
		<h1>유저들의 Pick</h1>
		<br>
		<div class="section2">
			<c:forEach var="list" items="${BestLikesWriteList}" end="4">
				<div class="book">
					<a href="/write/goEpisodeList?wno=${list.wno}&mno="> <img
						onerror="this.onerror=null; this.src='https://contents.kyobobook.co.kr/resources/dig-fo/dig/images/ink/treatise/no_img_treatise.png'"
						loading="lazy"
						src="${list.coverImage}"
						alt="이미쥐">
					</a>
					<div class="book-info">
						<div class="genre">${list.genre}</div>
						<h3>${list.title}</h3>
						<div class="publisher">${list.writer} · ${list.writeType}</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/main.js"></script>
</html>