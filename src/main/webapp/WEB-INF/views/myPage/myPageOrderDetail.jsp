<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문/배송 정보</title>
<style>
body {
   font-family: Arial, sans-serif;
   background-color: #f9f9f9;
   margin: 0;
   padding: 0;
}

.container {
   width: 80%;
   margin: 20px auto;
   background-color: #fff;
   border: 1px solid #ddd;
   padding: 20px;
   border-radius: 8px;
}

.order-info {
   font-size: 18px;
   margin-bottom: 20px;
}

.order-info h2 {
   margin-bottom: 10px;
}

/* 취소 버튼 스타일 */
.cancel-btn {
   font-size: 16px;
   color: #555;
   background-color: #fff;
   border: 1px solid #555;
   padding: 5px 15px;
   border-radius: 5px;
   cursor: pointer;
   transition: background-color 0.3s, color 0.3s;
}

.cancel-btn:hover {
   background-color: #555;
   color: #fff;
}

.book-info {
   display: flex;
   align-items: center;
   border-bottom: 1px solid #ddd;
   padding-bottom: 20px;
   margin-bottom: 20px;
}

.book-info img {
   width: 100px;
   height: 150px;
   object-fit: cover;
   margin-right: 20px;
}

.book-details {
   flex-grow: 1;
}

.book-details h3 {
   margin: 0;
   font-size: 18px;
   color: #333;
}

.book-details p {
   margin: 5px 0;
   color: #777;
}

.price {
   font-size: 18px;
   color: #333;
   margin-right: 20px;
}

.status {
    font-size: 16px;
    color: green;
    border: 1px solid green;
    padding: 5px 10px;
    border-radius: 5px;
    margin-right: 20px; /* status와 취소 버튼 사이 간격 추가 */
}

.delivery-info {
   margin-top: 20px;
}

.delivery-info h3 {
   font-size: 20px;
   margin-bottom: 10px;
}

ul {
   list-style: none;
   padding: 0;
}

li {
   font-size: 16px;
   margin-bottom: 8px;
   display: flex;
   justify-content: space-between;
}

li span.label {
   font-weight: bold;
   color: #333;
}

li span.value {
   color: #555;
}

/* 포인트 및 결제 금액 정보 스타일 */
.payment-info ul {
   list-style: none;
   padding: 0;
   margin-top: 20px;
}

.payment-info li {
   font-size: 16px;
   margin-bottom: 8px;
   display: flex;
   justify-content: space-between;
}

.payment-info .total {
   font-weight: bold;
}

.total-price {
   font-size: 24px; /* 총 결제 금액 폰트 크기 */
   color: #e60000; /* 강조 색상 */
}
</style>
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>
   <div class="container">
      <input type="hidden" id="odno" name="odno" value="${list[0].odno}"/>   
      <!-- 주문 정보 -->

      <div class="order-info">
         <h2>주문/배송 조회 상세</h2>
         <p>${list[0].orderDate }</p>
         <p>주문번호: ${list[0].odno }</p>
      </div>

      <c:forEach var="order" items="${list }">
         <!-- 책 정보 -->
         <div class="book-info">
            <a href="/shop/get?bno=${order.bno }" >
            <img src="${order.bookCover }" alt="책 표지 이미지">
            </a>
            <div class="book-details">
               <a href="/shop/get?bno=${order.bno }" >
               <h3>${order.title}(국내도서)</h3>
               </a>
               <p>수량 : ${order.count }개</p>
            </div>
            <div class="price">${order.bookPrice * order.count}원</div>
            <div class="status">${order.orderStatus }</div>
            
            <!-- 취소 버튼 -->
            <input type="button" value="취소 신청" class="cancel-btn" />
         </div>
      </c:forEach>

      <!-- 포인트 사용 및 총 결제 금액 -->
      <div class="payment-info">
         <ul>
            <li><span class="label">포인트 사용:</span><span class="value">-${list[0].usePoint }P</span></li>
            <li><span class="label total">총 결제 금액:</span><span class="value total-price">${list[0].totalPrice }원</span></li>
         </ul>
      </div>

      <!-- 배송 정보 -->
      <div class="delivery-info">
         <h3>배송 정보</h3>
         <ul>
            <li><span class="label">받는 사람:</span><span class="value">${vo.userName }</span></li>
            <li><span class="label">연락처:</span><span class="value">${vo.userPhonenumber }</span></li>
            <li><span class="label">주소:</span><span class="value">${vo.streetAddress }${vo.detailAddress }</span></li>
            <li><span class="label">신논현 솔데스크</span></li>
         </ul>
      </div>

   </div>
   <jsp:include page="../layout/footer.jsp"></jsp:include>
         <script type="text/javascript" src="/resources/js/myPage/myPageOrderDetail.js"></script>
   
</body>
</html>
