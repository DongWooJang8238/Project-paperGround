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
      border-radius: 4px;
    } */

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
				<button id="sell" class="tab-button active" value="onSale">판매중</button>
				<button id="end" class="tab-button" value="saleEnd">판매완료</button>
			</div>
			<input type="date" id="startDate" class="date-input"> <span>~</span> 
			<input type="date" id="endDate" class="date-input">
			<button class="query-button" onclick="queryData()">조회하기</button>
		</div>
		
		<input type="hidden" id="filterType" value="${pageMaker.cri.filterType }">


		<table class="order-table" id="onSale">
			<tr>
				<th>상품 이미지</th>
				<th>상품</th>
				<th>판매 날짜</th>
				<th>가격</th>
			</tr>
				<c:forEach var="list" items="${list }">
				<tr class="book-data" data-date="">
					<td>
						<div class="book-info"  >
							<a href="/used/goGet?bno=${list.ubno }"> <img
								src="${list.ubookImage.replace('\\', '/')}" alt="책 이미지"
								class="card-image"
								onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
							</a>
						</div>
					</td>
					<td>
						<div>${list.title }</div>
						<div style="font-size: 0.9em; color: #777;">색상: 회색 | 옵션:
							Grey</div>
					</td>
					<td>${list.ubookDate }</td>
					<td>${list.ubookPrice }원</td>
				</tr>
			</c:forEach>
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
	<div class="page-wrap" data-startDate="${pageMaker.cri.startDate}" data-endDate="${pageMaker.cri.endDate}">
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
<script type="text/javascript" src="/resources/js/myPage/myPageUsedOrder.js"></script>
</html>
