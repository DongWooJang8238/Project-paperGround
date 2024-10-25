<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/usedShopList.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../layout/header.jsp" />

	<h1>
	중고 상점 리스트 페이지
	</h1>
	
	<div class="sidebar">
		<h3>카테고리</h3>
		<hr>
		<a href="0">초기화</a> 
		<hr>
		<a href="1">소설</a> <a href="2">역사</a> <a href="3">과학</a>
		<a href="4">예술</a> <a href="5">철학</a> <a href="6">자기계발</a> <a href="7">기술/공학</a>
		<a href="8">경제/경영</a> <a href="9">사회과학</a> <a href="10">종교</a>
		<hr>
	</div>
	
	<div class="panel-body">
    <table class="used-shop-table">
        <thead>
            <tr>
                <th>이미지</th>
                <th>제목</th>
                <th>작성자</th>
                <th>가격</th>
                <th>등록 날짜</th>
                <th>판매 상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ubvo" items="${list}">
                <tr onclick="goGet(${ubvo.ubno})">
                    <td>
                        <div class="card-image-container">
                            <img src="${ubvo.ubookImage.replace('\\', '/')}" alt="책 이미지" class="card-image">
                        </div>
                    </td>
                    <td>${ubvo.title}</td>
                    <td>유저이름</td>
                    <td>${ubvo.ubookPrice}원</td>
                    <td>${ubvo.ubookDate}</td> <!-- 이 부분은 실제 날짜 데이터로 대체 -->
                    <td>${ubvo.status}</td> <!-- 판매 상태 -->
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button onclick="goShopInsert()">상품 등록</button>
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
<script type="text/javascript" src="/resources/js/usedShop/usedShopList.js"></script>
</html>