<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1 대 1 문의</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
/* 기본 스타일 */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
    color: #333;
}

/* 제목 스타일 */
h2 {
    text-align: center;
    margin-top: 30px;
    font-size: 24px;
    font-weight: bold;
    color: #444;
}

/* 카드 컨테이너 */
.board-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* 카드 리스트 */
.board-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    margin-top: 30px;
}

/* 카드 스타일 */
.card {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

/* 카드 제목 */
.card-title {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #007bff;
    text-decoration: none;
}

.card-title:hover {
    text-decoration: underline;
}

/* 카드 내용 */
.card-content {
    font-size: 14px;
    line-height: 1.5;
    color: #666;
    margin-bottom: 10px;
}

/* 카테고리 스타일 */
.card-category {
    display: inline-block;
    padding: 5px 10px;
    background-color: #e9ecef;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
    color: #555;
    margin-bottom: 10px;
}

/* 회원정보 */
.card-user {
    font-size: 12px;
    color: #888;
    margin-top: 10px;
    text-align: right;
}

/* 페이지네이션 */
.page-wrap {
    text-align: center;
    margin: 20px 0;
}

.page-nation a {
    display: inline-block;
    margin: 0 5px;
    padding: 8px 12px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
}

.page-nation a:hover {
    background-color: #0056b3;
}

.page-nation .active {
    background-color: #0056b3;
    font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="board-container">
    <h2>1 대 1 문의</h2>
    <div class="board-list">
        <c:forEach var="bvo" items="${list}">
            <c:if test="${mno == 1 || bvo.mno == mno}">
                <div class="card">
                    <span class="card-category">${bvo.DRcategory}</span>
                    <a href="/report/getDR?drno=${bvo.drno}" class="card-title">${bvo.DRtitle}</a>
                    <p class="card-content">${bvo.DRcontent}</p>
                    <div class="card-user">회원 번호: ${bvo.mno}</div>
                </div>
            </c:if>
        </c:forEach>
        <c:if test="${empty list}">
            <p class="no-posts">게시글이 없습니다.</p>
        </c:if>
    </div>

    <!-- 페이지네이션
    <div class="page-wrap">
            <ul class="page-nation" style="display: flex; justify-content: center;">
               <c:if test="${pageMaker.prev}">
                  <li><a href="${pageMaker.startPage - 1}">&lt;</a></li>
               </c:if>
               <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">
                  <li><a href="${num}" class="${pageMaker.cri.pageNum == num ? 'active' : ''}">${num}</a></li>
               </c:forEach>
               <c:if test="${pageMaker.next}">
                  <li><a href="${pageMaker.endPage + 1}">&gt;</a></li>
               </c:if>
            </ul>
         </div> 
   -->
         
</div>
<jsp:include page="../layout/footer.jsp" />
<script type="text/javascript" src="/resources/js/report/directReportList.js"></script>
</body>
</html>
