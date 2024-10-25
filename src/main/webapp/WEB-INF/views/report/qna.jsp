<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .category-tabs {
            margin: 20px 0;
            display: flex;
            justify-content: space-between;
            max-width: 1000px;
        }
        .category-tabs button {
            padding: 10px 20px;
            border: none;
            background-color: #f4f4f4;
            cursor: pointer;
        }
        .category-tabs button.active {
            background-color: #0095ff;
            color: white;
        }
        .qna-list {
            margin: 20px 0;
        }
        .qna-item {
            display: flex;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .qna-item .label {
            color: #0095ff;
            font-weight: bold;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="category-tabs">
		<button type="button" class="btn" id="reportall">전체보기</button>
		<button type="button" class="btn" id="reportUser">회원정보</button>
		<button type="button" class="btn" id="reportWriter">작가</button>
		<button type="button" class="btn" id="reportSystem">시스템</button>
		<button type="button" class="btn" id="reportShop">구매</button>
		<button type="button" class="btn" id="reportRefund">환불</button>
		<button type="button" class="btn" id="reportProfile">프로필</button>
		<button type="button" class="btn" id="reportFesta">대회</button>
		<button type="button" class="btn" id="reportHeadhunter">캐스팅</button>
	</div>

	<table>
        <thead>
            <tr>
                <th>자주하는 질문</th>
                <th>답변</th>
            </tr>
        </thead>
        <tbody>
    <c:forEach var="qna" items="${qnaList}">
        <tr>
            <td>${qna.qnaQuestion}</td>
            <td>${qna.qnaAnswer}</td>
        </tr>
    </c:forEach>
</tbody>

    </table>

    
    <jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/report/qna.js"></script>
    
   
</body>
</html>
    
