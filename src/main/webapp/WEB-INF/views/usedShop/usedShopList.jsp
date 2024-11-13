<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/usedShopList.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div class="selfil">
		<div class="select-body">
			<label>검색</label>
			<input type="search" name="selectBook" placeholder="제목으로 검색" value="${selectValue}">
			<button onclick="selectBookShoping()">🔍</button>
		</div>
		
		<div class="filterType-body">
			<input type="hidden" name="filter" value="${filterType}">
			<ul>
				<li><button id="newdate">최신순</button></li>
				<li><button id="olddate">오래된순</button></li>
				<li><button id="minbookprice">낮은 가격순</button></li>
				<li><button id="maxbookprice">높은 가격순</button></li>
				<li><button id="goodstatus">상태 좋은순</button></li>
				<li><button id="badstatus">상태 나쁜순</button></li>
			</ul>
		</div>
		
		<div class="category-body">
			<label id="tt" data-check-check="${checkCategorys}">장르</label>
			<button type="button" id="resetBtn">초기화</button>
			<span>
			<span>소설</span><input type="checkbox" name="gno" value="1">
			</span>
			<span>
			<span>역사</span><input type="checkbox" name="gno" value="2">
			</span>
			<span>
			<span>과학</span><input type="checkbox" name="gno" value="3">
			</span>
			<span>
			<span>예술</span><input type="checkbox" name="gno" value="4">
			</span>
			<span>
			<span>철학</span><input type="checkbox" name="gno" value="5">
			</span>
			<span>
			<span>자기계발</span><input type="checkbox" name="gno" value="6">
			</span>
			<span>
			<span>기술/공학</span><input type="checkbox" name="gno" value="7">
			</span>
			<span>
			<span>경제/경영</span><input type="checkbox" name="gno" value="8">
			</span>
			<span>
			<span>사회과학</span><input type="checkbox" name="gno" value="9">
			</span>
			<span>
			<span>종교</span><input type="checkbox" name="gno" value="10">
			</span>
		</div>
	</div>
	<div class="panel-body">
	    <button onclick="goShopInsert()" class="register-btn">상품 등록</button> <!-- 상품 등록 버튼 -->
	    <table class="used-shop-table">
	        <thead>
	            <tr>
	                <th width="300px">이미지</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>가격</th>
	                <th>등록 날짜</th>
	            </tr>
	        </thead>
	        <tbody>
			    <c:forEach var="ubvo" items="${list}">
				    <tr class="product-row" onclick="goGet(${ubvo.ubno})" style="display: none;"> <!-- 기본적으로 숨김 처리 -->
				       	<td>
				       		<c:if test="${ubvo.status == 0}">
							    <div class="card-image-container soldout">
							        <img src="${ubvo.ubookImage.replace('\\', '/')}" alt="책 이미지" class="card-image soldout" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
							    </div>
							</c:if>
				       		<c:if test="${ubvo.status > 0}">
				                <div class="card-image-container">
				                    <img src="${ubvo.ubookImage.replace('\\', '/')}" alt="책 이미지" class="card-image" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
				                </div>
				       		</c:if>
				        </td>
				        <td>${ubvo.title}</td>
				        <td>유저이름</td>
				        <td><fmt:formatNumber value="${ubvo.ubookPrice}" type="number" pattern="#,###" />원</td>
				        <td>${ubvo.ubookDate}</td>
				    </tr>
			    </c:forEach>
			</tbody>
	    </table>
	    <button id="load-more" style="display: none;" class="load-more-btn">더보기 <i class="bi bi-caret-down-fill"></i></button> <!-- 더보기 버튼 -->
	</div>

	<jsp:include page="../layout/footer.jsp" />

</body>
<script type="text/javascript" src="/resources/js/usedShop/usedShopList.js"></script>
</html>