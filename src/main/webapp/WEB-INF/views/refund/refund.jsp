<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exchange/Refund Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .info-section {
            border: 2px solid red;
            padding: 15px;
            margin: 15px 0;
            background-color: #f9f9f9;
        }
        .product-section, .refund-section {
            padding: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            margin-top: 15px;
        }
        .amount-text {
            font-size: 1.25em;
            font-weight: bold;
        }
    </style>
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>


<div class="container my-4">

    <!-- Header Section -->
   <input type="hidden" id="mno" name="mno" value="<sec:authentication property="principal.user.mno"/>">

   <input type="hidden" id="odno" name="odno" value="${uvo.odno }" />
    
    <div class="d-flex justify-content-between align-items-center">
       <div>
             <h5> <sec:authentication property="principal.user.userName"/>  님 안녕하세요.</h5>
             <% int totalSpendMoney = (int) request.getAttribute("totalSpendMoney"); %>
             <% DecimalFormat df = new DecimalFormat("#,###");
             String formattedTotalSpendMoney = df.format(totalSpendMoney); %>
             <p>누적 구매금액: <%= formattedTotalSpendMoney %> 원</p>
      </div>
        <div>
            <p><strong> 보유 포인트</strong> <sec:authentication property="principal.user.userPoint"/> P </p>
        </div>
    </div>

    <!-- Order ID Section -->
    <div class="mt-3">
        <h6><sec:authentication property="principal.user.userName"/></h6>
    </div>

    <!-- Information Section -->
    <div class="info-section">
        <h6>환불/취소 안내</h6>
        <p>환불 및 취소 신청 페이지에 모든 항목을 기재하신 후, 상품을 우체국을 이용해 착불로 보내주세요.</p>
    </div>

    <!-- Exchange/Refund Section -->
    <div class="row">
        <!-- Left Column -->
        <div class="col-md-6">
            <!-- Exchange/Refund Options -->
            <div class="product-section">
                <h6>반품 상품 선택</h6>
                <form>
                    <div class="form-group">
                        <div class="form-check form-check-inline" data-status="${status}">
                        	<c:if test="${status == '배송전'}">
	                            <input class="form-check-input" type="radio" name="option" id="exchange" value="exchange">
                        	</c:if>
                        	<c:if test="${status == '배송중'}">
	                            <input class="form-check-input" type="radio" name="option" id="exchange" value="exchange" checked="checked">
                        	</c:if>
                        	<c:if test="${status == '배송완료'}">
	                            <input class="form-check-input" type="radio" name="option" id="exchange" value="exchange" checked="checked">
                        	</c:if>
                            <label class="form-check-label" for="return">환불</label>
                        </div>
                        <div class="form-check form-check-inline">
                        	<c:if test="${status == '배송전'}">
	                            <input class="form-check-input" type="radio" name="option" id="cancel" value="cancel" checked="checked">
                        	</c:if>
                        	<c:if test="${status == '배송중'}">
	                            <input class="form-check-input" type="radio" name="option" id="cancel" value="cancel">
                        	</c:if>
                        	<c:if test="${status == '배송완료'}">
	                            <input class="form-check-input" type="radio" name="option" id="cancel" value="cancel">
                        	</c:if>
                            <label class="form-check-label" for="exchange">취소</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="reason">반품 사유를 선택해 주세요</label>
                        <select id="reason" class="form-control">
                            <option>사유를 선택하세요</option>
                            <option>상품 불량</option>
                            <option>사이즈 문제</option>
                            <option>기타(상세 사유 입력)</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="details">상세 사유 입력 (선택사항)</label>
                        <textarea id="details" class="form-control" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="bankName">은행명</label>
                        <input type="text" id="bankName" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="accountNumber">계좌번호</label>
                        <input type="text" id="accountNumber" class="form-control">
                    </div>
                </form>
            </div>
        </div>

        <!-- Right Column -->
        <div class="col-md-6">
            <!-- Selected Product Section -->
            <div class="product-section">
                <h6>반품 상품 선택</h6>
                   <c:forEach var="order" items="${list }">                
                <div class="d-flex align-items-center">
                    <img src="${order.bookCover}" alt="이미지 실종" width="60" height="60" class="mr-3">
                    <div>
                        <p>${order.title } <br>${order.bookPrice} ₩ / ${order.count }</p>
                    </div>
                </div>
            </div>

            <!-- Refund Amount Section -->
            <div class="refund-section mt-3">
                <h6>환불 예정 금액</h6>
                <p class="amount-text">취소상품 금액 합계: ${order.bookPrice * order.count} ₩ </p>
                </c:forEach>
            </div>
            <div>
                <button type="button" class="refundBtn" id="goRefund">제출하기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>
   <script type="text/javascript" src="/resources/js/refund/refund.js"></script>

</body>
</html>
