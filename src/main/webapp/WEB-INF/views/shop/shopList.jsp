<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/shopList.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../layout/header.jsp" />
	<div class="selfil">
		<div class="select-body">
			<select name="selectOption">
				<c:choose>
					<c:when test="${selectOption == 'writer'}">
						<option value="title">제목</option>
						<option value="writer" selected="selected">작가</option>
					</c:when>
					<c:otherwise>
						<option value="title" selected="selected">제목</option>
						<option value="writer">작가</option>
					</c:otherwise>
				</c:choose>
			</select>
			<input type="search" name="selectBook" placeholder="제목으로 검색" value="${selectValue}">
			<button onclick="selectBookShoping()"><img src="https://cf.joara.com/joara30FE/assets/icon/ico_top_search.png" alt="검색" class="search-icon"></button>
		</div>
		
		<div class="filterType-body">
			<input type="hidden" name="filter" value="${filterType}">
			<ul>
				<li><button id="sellcount">인기순</button></li>
				<li><button id="avgrating">평점순</button></li>
				<li><button id="minbookprice">낮은 가격순</button></li>
				<li><button id="maxbookprice">높은 가격순</button></li>
				<li><button id="likecount">리뷰 많은순</button></li>
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
		<span>자기계발</span><input type="checkbox" name="gno" value="6">
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
			<c:choose>
				<c:when test="${not empty list}">
		<c:forEach var="bvo" items="${list}">
				<div class="card" onclick="goGet(${bvo.bno})">
					<img style="object-fit: cover;" src="${bvo.bookcover }" alt="책 이미지">
					<div class="card-title">
						<a href="${bvo.bno}">${bvo.title}</a>
					</div>
					<div class="card-price"><fmt:formatNumber value="${bvo.bookPrice}" type="number" pattern="#,###" />원</div>
					<div class="card-author">${bvo.writer}</div>
					<!-- 평점 표시 부분 -->
					<div class="card-rating">
						<div class="stars" data-rating="${bvo.avgRating}">
							<span class="star">&#9733;</span> 
							<span class="star">&#9733;</span>
							<span class="star">&#9733;</span> 
							<span class="star">&#9733;</span>
							<span class="star">&#9733;</span>
						</div>
						<div class="avg-rating">평균 평점: ${bvo.avgRating}(${bvo.likeCount})</div>
					</div>
	
				</div>
		</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="card" style="width: 1200px; right: 1400px;">
						<h1>검색 결과가 없습니다.</h1>
					</div>
				</c:otherwise>
			</c:choose>
		
		<!-- 시큐리티 적용 시 판매권한 있는 유저에게만 할당하기! -->
		<button type="button" onclick="goShopInsert();">상품 등록</button>
	</div>

	<!-- page -->
	<div class="page-wrap">
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

	<jsp:include page="../layout/footer.jsp" />
</body>
<script type="text/javascript" src="/resources/js/shop/shopList.js"></script>
</html>