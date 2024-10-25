<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 등록 페이지</title>
<link rel="stylesheet" href="/resources/css/shopGetInsert.css">
</head>
<body>

	<jsp:include page="../layout/header.jsp" />

	<div class="get-container">
				<input type="file" id="imageUpload" accept="image/*"
					onchange="previewImage(event)" /> <label for="imageUpload">이미지
					첨부</label>
		<form action="#" method="get">
		<h1 class="product-name">
			<input type="text" name="title" placeholder="제목을 입력 해 주세요" required>
		</h1>
		<div class="product-info">
				<div class="product-image">
					<img id="imagePreview" class="image-preview" alt="첨부한 이미지 미리보기" />
				</div>
			<div class="product-details">
				<p>작가: <input type="text" name="writer" required></p>
				<p>출판사: <input type="text" name="publisher" required></p>
				<p>ISBN: <input type="text" name="isbn" required></p>
				<p>출판일: <input type="date" name="ordDate" required></p>
				<p>재고: <input type="text" name="inventory" required></p>
				<p>장르: <select name="gno">
					<option value="1">소설</option>
					<option value="2">역사</option>
					<option value="3">과학</option>
					<option value="4">예술</option>
					<option value="5">철학</option>
					<option value="6">자기계발</option>
					<option value="7">기술/공학</option>
					<option value="8">경제/경영</option>
					<option value="9">사회과학</option>
					<option value="10">종교</option>
				</select></p>
				<input type="hidden" name="bookcover">
				<h3 class="price">₩<input type="text" name="bookPrice" required></h3>
			</div>
		</div>
		</form>
	</div>

	<hr>
	<!-- 본문 영역 -->
	<div>
		<h1>[본문]</h1>
		<div class="product-image">
			<img id="imagePreview" class="image-preview" alt="첨부한 이미지 미리보기" />
		</div>
		<h1><textarea name="content" placeholder="본문 내용 입력.."></textarea></h1>
	</div>
	
	<button onclick="goInsert()">등록</button>

	<jsp:include page="../layout/footer.jsp" />

</body>
<script type="text/javascript" src="/resources/js/shop/shopGetInsert.js"></script>
</html>
