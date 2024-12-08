<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/shopGet.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../layout/header.jsp" />
	<div class="containerBody" style="width: 70%; margin-left: 15%; border-top: 1px solid black; margin-top: 4%;">
	<div class="get-container">
		<div class="product-info">
			<div class="product-image">
				<img src="${bvo.bookcover}" alt="책 표지">
			</div>
			<div class="product-details">
				<h1 class="price" style="font-size: 40px;">${bvo.title}</h1>
				<h3 class="price"><fmt:formatNumber value="${bvo.bookPrice}" type="number" pattern="#,###" />원</h3>
				<p>작가 : <span class="details">${bvo.writer}</span></p>
				<p>출판사 : <span class="details">${bvo.publisher}</span></p>
				<p>ISBN : <span class="details">${bvo.isbn}</span></p>
				<p>출판일 : <span class="details">${bvo.ordDate}</span></p>
				<div class="avg-rating"><p>평균 평점:
					<span class="details">${bvo.avgRating}(${bvo.likeCount})</span></p></div>
				<div class="stars" data-rating="${bvo.avgRating}">
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9733;</span>
				</div>
				<div class="total-price">
					총 가격: <span bp="${bvo.bookPrice}"><fmt:formatNumber value="${bvo.bookPrice}" type="number" pattern="#,###" /></span>원
				</div>
				<div class="quantity-control">
					<button id="minus">-</button>
					<input type="number" value="1" min="1" max="99">
					<button id="plus">+</button>
				</div>
				<div class="action-buttons">
					<button id="shopingList">장바구니</button>
					<button id="buy">구매</button>
					<button id="cu">찜하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 본문 영역 -->

	<div style="text-align: center;">
		<div style="border-bottom: 1px solid #777; width: 100%; margin-bottom: 40px; margin-top: 20px;"></div>
		<div class="product-image">
			<img src="${bvo.bookcover}" alt="책 표지">
		</div>
		<h1>${bvo.shortText}</h1>
	</div>
	<br>
	<hr>
	<br>
	<!-- 리뷰(댓글) 영역 -->
	<div class="review-section">
		<!-- 댓글 영역 -->
		<div class="comment-section">
			<div class="panel-footer">
				<div class="panel-footer-header">
					<div class="panel-footer-title">
						<h1>리뷰</h1>
					</div>
				</div>
				<div class="panel-footer-body">
					<ul class="chat">
						<li data-rno="1">
							<div>
								<div class="chat-header">
									<strong class="primary-font">작성자1</strong> <small
										class="pull-right">2024-10-10</small>
								</div>
								<div class="stars" data-rating="4">
									<span class="star">&#9733;</span> <span class="star">&#9733;</span>
									<span class="star">&#9733;</span> <span class="star">&#9733;</span>
									<span class="star">&#9733;</span>
								</div>
								<p>이 책 정말 재밌어요!</p>
								<!-- 예시 댓글에 사용할 이미지 -->
								<img src="${bvo.bookcover}" alt="예시 이미지" class="comment-image"
									style="max-width: 200px;" />
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="review-header">
			<img id="imagePreview" class="image-preview" alt="첨부한 이미지 미리보기" />
		</div>
		
		<div class="ratings" data-rating="1">
			<span class="rating" data-value="1">&#9733;</span> <span
				class="rating" data-value="2">&#9733;</span> <span class="rating"
				data-value="3">&#9733;</span> <span class="rating" data-value="4">&#9733;</span>
			<span class="rating" data-value="5">&#9733;</span>
		</div>

		<div class="review-input">
			<div class="file-upload">
				<input type="file" id="imageUpload" accept="image/*"
					onchange="previewImage(event)" /> <label for="imageUpload">이미지
					첨부</label>
			</div>
			<img id="imagePreview" class="image-preview" alt="첨부한 이미지 미리보기" />
		</div>

		<div class="review-input">
			<textarea class="review-body" placeholder="리뷰 내용을 입력하세요..."></textarea>
			<input type="hidden" name="ReviewImgUuid"> <input
				type="hidden" name="ReviewImgName">

			<button class="submit-review">리뷰 달기</button>
		</div>
	</div>
</div>


	<div class="move-bar">
		<button id="goTop">Top</button>
		<button id="gobottom">Bottom</button>
		<button id="goShopList">목록으로 가기</button>
		<!-- 관리자용 -->
		<!-- <button id="goDelete">상품 삭제</button> -->
	</div>

	<jsp:include page="../layout/footer.jsp" />

	<div class="fixed-bar">
		<div class="total-price">
			총 가격: <span bp="${bvo.bookPrice}"><fmt:formatNumber value="${bvo.bookPrice}" type="number" pattern="#,###" /></span>원
		</div>
		<div class="quantity-control">
			<button id="minus">-</button>
			<input type="number" value="1" min="1" max="99">
			<button id="plus">+</button>
		</div>
		<div class="action-buttons">
			<button id="shopingList">장바구니 담기</button>
			<button id="buy">구매</button>
			<button id="cu">찜하기</button>
			<button id="goShopList">목록으로 가기</button>
		</div>
	</div>
	<div id="tooltip">
	장바구니에 담겼습니다
	<button onclick="goToCart();">장바구니 이동</button>
	</div>
</body>
<script type="text/javascript" src="/resources/js/shop/shopGet.js"></script>
<script type="text/javascript" src="/resources/js/shop/shopReview.js"></script>
</html>
