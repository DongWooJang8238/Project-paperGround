<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q&A Page</title>
<style>
body {

	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
}

.main-content1 {
	width: 70%; /* 콘텐츠 너비를 70%로 설정 */
	max-width: 1000px; /* 최대 너비를 1000px로 제한 */
	margin: 0 auto; /* 가운데 정렬 */
	padding: 20px; /* 안쪽 여백 추가 */
}

h1, h2 {
    color: #0095ff; /* 제목 색상 */
    font-weight: 600;
    font-size: 2rem; /* 제목 크기 */
    margin-bottom: 20px;
}


/* 카테고리 탭 스타일 */
.category-tabs {
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
    border-bottom: 3px solid #f0f0f0; /* 하단 경계선 */
    padding-bottom: 10px;
}


.category-tabs button {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 12px 24px;
    cursor: pointer;
    font-size: 1rem;
    font-weight: 600;
    color: #555;
    transition: all 0.3s ease; /* 버튼 효과 */
}


.category-tabs button:hover {
    background-color: #0095ff;
    color: white;
    border-color: #0095ff; /* 호버 시 테두리 색상 변경 */
}


.category-tabs button.active {
    background-color: #0095ff;
    color: white;
    border-color: #0095ff;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

th, td {
    padding: 12px 18px;
    text-align: left;
    border-bottom: 1px solid #f2f2f2; /* 가벼운 하단 테두리 */
}

th {
    background-color: #7fb5ff88; /* 헤더 배경색 */
    color: white; /* 헤더 텍스트 색상 */
    font-weight: 600;
    font-size: 20px;
}

td {
    background-color: #f9f9f9; /* 데이터 셀 배경색 */
    color: #555; /* 데이터 텍스트 색상 */
}

td:nth-child(1) {
    border-right: 3px solid #f0f0f0; /* 질문 열 오른쪽에 세로선 추가 */
}

tr:hover td {
    background-color: #f1f9ff; /* 행에 마우스를 올리면 배경색 변경 */
}

.category-tabs {
	margin: 20px 0;
	display: flex;
	justify-content: space-between;
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
    flex-direction: column;
    padding: 15px;
    margin-bottom: 10px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 카드 스타일로 그림자 추가 */
}

.qna-item .label {
    color: #0095ff;
    font-weight: bold;
    font-size: 16px;
    margin-bottom: 8px;
}

.qna-item p {
    color: #333;
    font-size: 14px;
    line-height: 1.6;
    margin: 0;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="main-content1">
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
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/report/qna.js"></script>


</body>
</html>

