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
<link rel="stylesheet" href="/resources/css/myPage.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
<title>마이페이지</title>
<style>
.order-history {
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff; /* 테이블 배경을 흰색으로 설정 */
}

th, td {
    border: 1px solid #ccc;
    padding: 12px;
    text-align: left;
    transition: background-color 0.3s; /* 마우스 오버 시 부드러운 전환 효과 */
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

tr {
    transition: transform 0.2s, box-shadow 0.2s; /* 트랜지션 효과 추가 */
}

tr:hover {
    background-color: #f9f9f9; /* 마우스 오버 시 배경색 변경 */
    transform: translateY(-2px); /* 살짝 위로 이동하는 효과 */
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

/* 카드 이미지 스타일 */
.card-image {
    width: 300px; /* 이미지 너비 조정 */
    height: 200px; /* 높이를 자동으로 맞춤 */
    border-radius: 4px; /* 이미지 모서리를 둥글게 */
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1); /* 이미지에 살짝 그림자 추가 */
}

.order-details {
    background-color: #f9f9f9;
}

.order-row {
    display: none; /* 기본적으로 모든 주문을 숨김 */
}

.order-row.visible {
    display: table-row; /* visible 클래스를 가진 행은 보임 */
}

/* 하위 주문 내역 스타일 */
.orderNewDetail {
    background-color: #f0f0f0; /* 배경 색상 조정 */
    font-size: 0.9em; /* 상위보다 작게 */
    color: #666; /* 글자 색상 조정 */
}

.order-history button {
	background-color: #ffffff; /* 버튼 배경 색상 */
    border: 1px solid #ccc; /* 테두리 색상 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    padding: 10px 15px; /* 버튼 패딩 */
    font-size: 14px; /* 버튼 텍스트 크기 */
    cursor: pointer; /* 커서 포인터 */
    transition: background-color 0.3s, border-color 0.3s; /* 부드러운 전환 효과 */
}

.order-history button:hover {
	background-color: #e2e2e2; /* 호버 시 배경 색상 변경 */
    border-color: #888; /* 호버 시 테두리 색상 변경 */
}

.toggle-button{
	left: 0%;
	display: block;
}

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<form>
		<!-- Main content -->
		<div class="mypage-container">
      <div class="sidebar">
			<ul>
				<li><a href="#"> <i class="bx bx-user"></i> 회원정보
				</a>
					<ul class="sub-menu">
						<li><a href="/User/myPageUpdate?userId=${vo.userId}">회원정보
								수정</a></li>
						<!-- <li><a href="#">내 찜리스트</a></li> -->
						<li><a href="/User/selectMyPoint?mno=${vo.mno}">내 포인트</a></li>
					</ul></li>
				<li><a href="#"> <i class="bx bx-cart"></i> 쇼핑정보
				</a>
					<ul class="sub-menu">
						<li><a href="/User/OrderSelect?mno=${vo.mno}">주문목록/배송조회</a></li>
						<!-- <li><a href="#">취소/반품 내역</a></li> -->
					</ul></li>
				<li><a href="#"> <i class="bx bx-bar-chart"></i> 활동정보
				</a>
					<ul class="sub-menu">
						<li><a
							href="/User/myCommenPost?userMno=${vo.mno}&filterType=posts">내
								게시글/댓글</a></li>
						<li><a href="/User/myLikedWriterBookList?userMno=${vo.mno}">집필
								북마크</a></li>
					</ul></li>
				<li><a href="/User/deleteAccount"> <i class="bx bx-log-out"></i>
						회원 탈퇴
				</a></li>
			</ul>
		</div>
		<div class="main-content" style="padding: 5px 0 0; background-color: white; color: black;">
			<div class="header" style="display: block;">
				<h1>${vo.userId}님,환영합니다!</h1>
				<h2>보유 포인트: ${vo.userPoint} P</h2>
				<c:if test="${empty vo.userIcon}">
					<img src="../resources/images/usericon.jpg" alt="User Icon"
						width="100" height="100">
				</c:if>
				<c:if test="${not empty vo.userIcon}">
					<img src="${vo.userIcon}" id="userIcon" alt="userIcon"
						width="100" height="100" onerror="this.onerror=null; this.src='../resources/images/usericon.jpg';">
				</c:if>

				<input type="hidden" name="userId" value="${vo.userId}"> 
			</div>
		<!-- 주문 내역 테이블 -->
		<div class="order-history">
			<h2>주문 내역</h2>
			<h4>주문목록 / 배송 내역 총 ${orderCount} 개</h4>
			<div class="date-selector">
				<button type="button" class="date-button"
					onclick="setPeriod('today')">오늘</button>
				<button type="button" class="date-button"
					onclick="setPeriod('7days')">7일</button>
				<button type="button" class="date-button"
					onclick="setPeriod('1month')">1개월</button>
				<button type="button" class="date-button"
					onclick="setPeriod('3months')">3개월</button>

				<c:if test="${orderCount > 1}">
					<button type="button" class="toggle-button"
						onclick="toggleDetails()">더보기</button>
				</c:if>
				<!-- <label for="startDate">기간별 조회:</label> <input type="date"
					id="startDate" name="startDate" min="2024-10-10-01"
					max="2030-10-01" required> <label for="endDate"> ~
				</label> <input type="date" id="endDate" name="endDate"
					max="2030-10-01" required>
				<button type="button" class="query-button" onclick="queryData()">조회</button> -->
			</div>
			<!-- 주문 데이터 개수 -->
					<table>
						<thead>
							<tr>
								<th style="width: 330px;">상품이미지</th>
								<th style="width: 230px;">상품명</th>
								<th>결제금액</th>
								<th style="width: 180px;">구매날짜</th>
							</tr>
						</thead>
						<!-- + 버튼 위치 조정 -->
						<tbody id="tbody">
							<c:choose>
								<c:when test="${orderCount >= 1 }">
									<c:forEach var="order" items="${list}">
										<tr class="order-row ${loop.index < 3 ? 'visible' : ''}"
											data-odno="${order.odno}"
											data-title="${order.orderMainBookName}">
											<td><img style="margin: 0px 0;" class="card-image" src="${order.orderMainImage}" alt="책 이미지"
												width="100" height="150"></td>
											</td>
											<td>${order.orderMainBookName}</td>
											<td>총 <fmt:formatNumber value="${order.totalPrice}" type="number" pattern="#,###" /> 원 (${order.orderStatus})</td>
											<td>${order.orderDate}
												<button type="button" id="odno"
													onclick="orderDetail('${order.odno }')">상세 주문내역</button>
										</tr>
									</c:forEach>

								</c:when>
								<c:when test="${orderCount == 0 }">
									<tr>
										<td style="text-align: center" height="200px" colspan="6">조회된
											주문내역이 없습니다.</td>
									</tr>
								</c:when>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
			
	</form>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/myPage/myOrder.js"></script>
</html>
