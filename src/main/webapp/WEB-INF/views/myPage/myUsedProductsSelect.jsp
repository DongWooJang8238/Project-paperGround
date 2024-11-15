<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Management</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
	background-color: #f8f8f8;
}

.container {
	width: 100%;
	max-width: 1100px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.filter-bar {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
}

.filter-bar label {
	font-weight: bold;
}

.filter-bar input[type="checkbox"] {
	margin-right: 5px;
}

.status-buttons button {
	padding: 8px 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: #f1f1f1;
	cursor: pointer;
	font-size: 14px;
}

.status-buttons button.active {
	background-color: #007bff;
	color: #fff;
}

.order-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.order-table th, .order-table td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: left;
}

.order-table th {
	background-color: #efefef;
	font-weight: bold;
	color: #555;
}

.order-table td {
	color: #333;
}

/*     .book-icon {
      width: 32px;
      height: 32px;
      display: inline-block;
      background-color: #ccc; /* 임시 이미지로 설정 */
border-radius












:






 






4
px












;
}
* /

    .action-icons {
	display: flex;
	gap: 10px;
	align-items: center;
}

.action-icons button {
	border: none;
	background: none;
	cursor: pointer;
}

.date-input {
	padding: 6px 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
}

.search-button {
	padding: 6px 12px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

/* 카드 이미지 스타일 */
.card-image {
	width: 100px;
	height: 150px;
	border-radius: 4px; /* 이미지 모서리를 둥글게 */
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1); /* 이미지에 살짝 그림자 추가 */
}

.book-info img {
	width: 100px;
	height: 150px;
	object-fit: cover;
	margin-right: 20px;
}

.page-nation {
	display: flex;
	justify-content: center;
	list-style-type: none;
	padding: 0;
}

.page-nation li {
	margin: 0 5px;
}

.page-nation li a {
	color: #5d4037; /* 우드톤 페이지 링크 */
	padding: 8px 12px;
	text-decoration: none;
	border-radius: 5px;
	background-color: #e0e0e0;
}

.page-nation li a:hover, .page-nation li a.active {
	background-color: #6d4c41; /* 선택된 페이지, 호버 효과 */
	color: #fff;
}

/* 카드 이미지에 솔드아웃 스타일 추가 */
.card-image-container {
	position: relative;
	overflow: hidden;
}

.card-image.soldout {
	opacity: 0.5; /* 이미지를 흐리게 */
	filter: grayscale(100%); /* 흑백 처리 */
}

/* 카드 이미지에 솔드아웃 스타일 추가 */
.book-info.soldout::after {
	content: 'SOLD OUT';
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: red; /* 'SOLD OUT' 텍스트 색상 */
	font-size: 1.5em;
	font-weight: bold;
	background-color: rgba(255, 255, 255, 0.7); /* 배경 색상 */
	padding: 10px;
	border-radius: 5px;
}

/* .order-table.active {
    display: none;
} */
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="container">
		<!-- Filter Bar -->
		<div class="filter-bar">
			<input type="checkbox"> <label for="select-all">전체 선택</label>
			<div class="status-buttons">
				<c:choose>
					<c:when test="${pageMaker.cri.filterType eq 1 }">
						<button id="sell" class="tab-button active" value="onSale">판매중</button>
						<button id="end" class="tab-button" value="saleEnd">판매완료</button>
					</c:when>
					<c:otherwise>
						<button id="sell" class="tab-button" value="onSale">판매중</button>
						<button id="end" class="tab-button active" value="saleEnd">판매완료</button>
					</c:otherwise>
				</c:choose>
			</div>
			<input type="date" id="startDate" class="date-input"> <span>~</span>
			<input type="date" id="endDate" class="date-input">
			<button class="query-button" onclick="queryData()">조회하기</button>
		</div>

		<input type="hidden" id="filterType"
			value="${pageMaker.cri.filterType }">


		<table class="order-table" id="onSale">
			<tr>
				<th>상품 이미지</th>
				<th>상품</th>
				<th>판매 날짜</th>
				<th>가격</th>
			</tr>
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach var="list" items="${list }">
						<tr class="book-data" data-date="">
							<td><c:choose>
									<c:when test="${list.status > 0 }">
										<div class="book-info">
											<a href="/used/goGet?bno=${list.ubno }"> <img
												src="${list.ubookImage.replace('\\', '/')}" alt="책 이미지"
												class="card-image"
												onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
											</a>
										</div>
									</c:when>

									<c:otherwise>
										<div class="book-info soldout">
											<a href="/used/goGet?bno=${list.ubno }"> <img
												src="${list.ubookImage.replace('\\', '/')}" alt="책 이미지"
												class="card-image soldout"
												onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
											</a>
										</div>
									</c:otherwise>
								</c:choose></td>
							<td>
								<div>${list.title }</div>
								<div style="font-size: 0.9em; color: #777;">색상: 회색 | 옵션:
									Grey</div>
							</td>
							<td>${list.ubookDate }</td>
							<td>${list.ubookPrice }원</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<th style="text-align: center" height="200px" colspan="6">
							조회된 판매내역이 없습니다.</th>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>


		<!-- 		<table class="order-table" id="saleEnd">
			<tr>
				<th>상품 이미지</th>
				<th>상품</th>
				<th>판매 날짜</th>
				<th>가격</th>
			</tr>
				<th>
					<p>판매내역이 없습니다.</p>
				</th>
		</table>
		 -->
	</div>
	<!-- page -->
	<div class="page-wrap" data-startDate="${pageMaker.cri.startDate}"
		data-endDate="${pageMaker.cri.endDate}">
		<ul class="page-nation">
			<c:if test="${pageMaker.prev }">
				<li class="previous"><a href="${pageMaker.startPage-1 }">
						&lt; </a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" step="1">
				<li><a href="${num }"
					class="${pageMaker.cri.pageNum == num ? 'active' : '' }"> ${num }
				</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li><a href="${pageMaker.endPage+1 }"> &gt; </a></li>
			</c:if>
		</ul>
	</div>



	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="/resources/js/myPage/myPageUsedOrder.js"></script>
</html>
