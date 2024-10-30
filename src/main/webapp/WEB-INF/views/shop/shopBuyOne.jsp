<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
    <link rel="stylesheet" href="/resources/css/shopBuy.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
    <div class="payment-container">
        <h1 class="page-title">결제 정보</h1>

        <form action="#" method="POST" class="buyer-info-form">

    <!-- 상품 정보 섹션 -->
    <section class="product-info-section">
    <h2>주문 상품 정보</h2>
    <ul class="product-list">
            <li class="product-details">
                <img src="${bvo.bookcover}" alt="상품 이미지" class="product-image">
                <div class="product-description">
                    <p><strong>상품명:</strong> <span data-title="${bvo.title}">${bvo.title}</span></p>
                    <p><strong>가격:</strong> ₩<span class="bookPrice" data-price="${bvo.bookPrice}">${bvo.bookPrice * count}</span></p>
                    <p><strong>수량:</strong>
                        <button class="minus">-</button>
                        <span class="spanCount">${count}</span>
                        <button class="plus">+</button>
                    </p>
                    <p><strong>배송비:</strong> 무료</p>
                    <!-- 숨겨진 상품 번호 입력 필드 추가 -->
                    <input type="hidden" name="bno" value="${bvo.bno}">
                    <input type="hidden" name="count" value="${count}">
                </div>
            </li>
    </ul>
    <p><strong>총 결제 금액:</strong> ₩<span id="totalPrice"></span></p> <!-- 총 결제 금액 -->
</section>

    <!-- 구매자 정보 섹션 -->
    <section class="buyer-info-section">
        <h2>구매자 정보</h2>
        <div class="form-group">
            <label for="orderName">이름 (필수)</label>
            <input type="text" id="orderName" name="orderName" value="${sessionScope.vo.userName}" required>
        </div>
        <div class="form-group">
            <label for="orderPhone">전화번호 (필수)</label>
            <input type="tel" id="orderPhone" name="orderPhone" value="${sessionScope.vo.userPhonenumber}" required>
        </div>
        <div class="form-group">
            <label for="jangsick">기본 배송지 (필수)</label>
            <input type="text" id="ShowAddress" value="${sessionScope.vo.address }" placeholder="우편번호" disabled="disabled">
   			<input type="text" id="ShowStreetAddress" value="${sessionScope.vo.streetAddress }"  placeholder="주소" disabled="disabled"><br>
   			<input type="text" id="ShowDetailAddress" value="${sessionScope.vo.detailAddress }" placeholder="상세주소" disabled="disabled">
            <button type="button" onclick="addrChange();">배송지 입력(변경)</button>
        </div>
        <div class="form-group" id="newAddr">
            <div class="input-group">
				<label for="userAddress">주소</label> 
				<input type="text" id="address" name="address" value="${sessionScope.vo.address }" placeholder="우편번호">
   				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
   				<input type="text" id="streetAddress" name="streetAddress" value="${sessionScope.vo.streetAddress }"  placeholder="주소"><br>
   				<input type="text" id="detailAddress" name="detailAddress" value="${sessionScope.vo.detailAddress }" placeholder="상세주소">
    			<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			</div>
        </div>
        <div>
        <label>정보 저장</label>
        <input type="checkbox" name="userCheck" value="1">
        </div>
        <div class="form-group">
            <label for="userDeposit">계좌번호 (선택)</label>
            <input type="text" id="userDeposit" name="userDeposit" required>
        </div>
    </section>

    <!-- 결제 정보 섹션 -->
    <section class="payment-info-section">
    	<h2>포인트 할인</h2>
    	<div class="form-group">
    		<p>사용 가능 포인트 : ${sessionScope.vo.userPoint}</p>
    		<select name="point">
    			<option value="0">0</option>
    			<option value="100">100</option>
    			<option value="200">200</option>
    			<option value="300">300</option>
    			<option value="400">400</option>
    			<option value="500">500</option>
    			<option value="600">600</option>
    			<option value="700">700</option>
    			<option value="800">800</option>
    			<option value="900">900</option>
    			<option value="1000">1000</option>
    		</select>
    	</div>
        <h2>결제 방식</h2>
        <div class="payment-methods">
            <div class="form-group">
                <input type="radio" id="cardPayment" name="paymentMethod" value="card" checked>
                <label for="cardPayment">신용카드</label>
            </div>
            <div class="form-group">
                <input type="radio" id="bankTransfer" name="paymentMethod" value="bank">
                <label for="bankTransfer">계좌이체</label>
            </div>
            <div class="form-group">
                <input type="radio" id="kakaoPay" name="paymentMethod" value="kakaoPay">
                <label for="kakaoPay">카카오페이</label>
            </div>
        </div>
    </section>
</form>
    
    <!-- 결제 버튼 ( 누르면 선택한 결제 방식의 최종 결제 페이지 이동 ) -->
    <div class="payment-action">
        <button class="pay-button">결제하기</button>
        <button class="cancel-button">취소</button>
    </div>

    </div>
	<jsp:include page="../layout/footer.jsp" />
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/shop/shopBuyOne.js"></script>
</html>
