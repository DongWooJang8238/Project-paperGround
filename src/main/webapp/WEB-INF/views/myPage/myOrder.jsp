<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/myPage.css">
<title>마이페이지</title>
<style>
.order-history {
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
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

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<form>
		<!-- Main content -->
		<div class="main-content">
			<div class="header">
				<h1>${sessionScope.vo.userId}님은${sessionScope.vo.userRole}입니다.${sessionScope.vo.mno }</h1>
				<h2>보유 포인트: ${sessionScope.vo.userPoint} P</h2>
				<c:if test="${empty vo.userIcon}">
					<a href="/User/changeIcon?userId=${sessionScope.vo.userId}"> <img
						src="../resources/images/usericon.jpg" alt="User Icon" width="100"
						height="100">
					</a>
				</c:if>

				<c:if test="${not empty vo.userIcon}">
					<a href="/User/changeIcon?userId=${sessionScope.vo.userId}"> <img
						src="${sessionScope.vo.userIcon}" id="userIcon" alt="userIcon" width="100"
						height="100">
					</a>
				</c:if>

				<input type="hidden" name="userId" value="${sessionScope.vo.userId}"> <input
					type="hidden" id="mno" value="${sessionScope.vo.mno}">
			</div>
		</div>
		<!-- 주문 내역 테이블 -->
		<div class="order-history">
			<h2>주문 내역</h2>
			<h4>주문목록 / 배송 내역 총 ${orderCount } 개</h4>
			<div class="date-selector">
				<button type="button" class="date-button"
					onclick="setPeriod('today')">오늘</button>
				<button type="button" class="date-button"
					onclick="setPeriod('7days')">7일</button>
				<button type="button" class="date-button"
					onclick="setPeriod('1month')">1개월</button>
				<button type="button" class="date-button"
					onclick="setPeriod('3months')">3개월</button>

				<label for="startDate">기간별 조회:</label> <input type="date"
					id="startDate" name="startDate" min="2024-10-10-01"
					max="2030-10-01" required> <label for="endDate"> ~
				</label> <input type="date" id="endDate" name="endDate"
					max="2030-10-01" required>
				<button type="button" class="query-button" onclick="queryData()">조회</button>
			</div>
			<!-- 주문 데이터 개수 -->
			<table>
				<thead>
					<tr>
						<th>구매날짜</th>
						<th>주문번호</th>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>배송상태</th>
						<th>결제금액</th>
					</tr>
				</thead>
				<!-- + 버튼 위치 조정 -->
				<c:if test="${orderCount > 1}">
					<button type="button" class="toggle-button"
						onclick="toggleDetails()">더보기</button>
				</c:if>
				<tbody id="tbody">
					<c:choose>
						<c:when test="${orderCount > 1 }">
							<c:forEach var="order" items="${list}">
							    <tr class="order-row ${loop.index < 3 ? 'visible' : ''}" data-odno="${order.odno}" data-title="${order.orderMainBookName}">
							        <td>${order.orderDate} <button type="button" id="odno" onclick="orderDetail('${order.odno }')">상세 주문내역</button></td>
							        <td>${order.odno}</td>
							        <td><img src="${order.orderMainImage}" alt="책 이미지" width="100" height="150"></td>
							        <td>${order.orderMainBookName}</td>
							        <td>${order.orderStatus}</td>
							        <c:choose>
							        	<c:when test="${order.totalPrice > 20000 }">
							        <td>총 ${order.totalPrice} 원 <button type="button" onclick="showOrder(${order.odno})">더보기</button></td>
							        	</c:when>
							        	<c:otherwise>
							        	 <td>총 ${order.totalPrice} 원</td>
							        	</c:otherwise>
							        </c:choose>
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

		<div class="sidebar">
				<h3>마이페이지</h3>
				<ul>
					<li><a href="userShoping"
						onclick="toggleSubMenu('shopping-info')">쇼핑정보</a>
						<ul id="shopping-info" class="sub-menu">
							<li><a id="myOrder"
								href="/User/OrderSelect?mno=${sessionScope.vo.mno }">주문목록/배송조회</a></li>
							<li><a href="#">취소/반품/교환 내역</a></li>
						</ul></li>
					<li><a href="#" onclick="toggleSubMenu('benefit-management')">혜택관리</a>
						<ul id="benefit-management" class="sub-menu">
							<li><a a id ="myPoint" href="/User/selectMyPoint?mno=${sessionScope.vo.mno }">내 포인트</a></li>
							<li><a href="#">적립금</a></li>
						</ul></li>
					<li><a href="userInfo" onclick="toggleSubMenu('member-info')">회원정보</a>
						<ul id="member-info" class="sub-menu">
							<li><a id="checkPage"
								href="/User/checkPassword?userId=${sessionScope.vo.userId }">회원정보 수정</a></li>
							<li><a href="#">배송지 관리</a></li>
						</ul></li>
					<li><a href="/report/selectReport"
						onclick="toggleSubMenu('serviceCenter-info')">고객센터</a>
						<ul id="serviceCenter-info" class="sub-menu">
							<li><a id="reportCategory" href="/report/reportCategory">Q&A</a></li>
							<li><a id="reportBoard" href="/report/reportBoard?mno="1>문의센터</a></li>
							<li><a id="directReport" href="/report/directReport?mno="1>1:1문의</a></li>
						</ul></li>
					<li><a href="#">나의 게시글</a></li>
				</ul>
			</div>
	</form>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/myPage/myOrder.js"></script>
<script type="text/javascript" src="/resources/js/myPage/sidebar.js"></script>
</html>
