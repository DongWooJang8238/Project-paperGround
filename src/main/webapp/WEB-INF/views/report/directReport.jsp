<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의하기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/inquiry.css">
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

.inquiry-container {
	width: 1000px;
	margin: 50px auto;
	padding: 5px;
	background: #fff;
}

.inquiry-container h2 {
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	margin-bottom: 20px;
	color: #333;
	padding-bottom: 25px;
}

.form-group {
	margin-bottom: 20px;
	display: flex;
	flex-direction: column;
}

.form-group label {
	font-size: 14px;
	font-weight: bold;
	color: #333;
	margin-bottom: 8px;
}

.form-group input[type="text"], .form-group select, .form-group textarea
	{
	width: 100%;
	padding: 12px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #fff;
	box-sizing: border-box;
	transition: border-color 0.3s;
}

.form-group input[type="text"]:focus, .form-group select:focus,
	.form-group textarea:focus {
	border-color: #007BFF;
	outline: none;
}

.form-group textarea {
	height: 120px;
	resize: none;
}

.form-actions {
	display: flex;
	gap: 10px;
}

.form-actions .btn {
	font-size: 14px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.form-actions .submit-btn {
	background-color: #7fb5ff88;
	color: white;
	font-weight: bold;
	transition: background-color 0.3s;
}

.form-actions .submit-btn:hover {
	background-color: #2f6bbd88;
}

.form-actions .reset-btn {
	background-color: #7fb5ff88;
	color: white;
	font-weight: bold;
	transition: background-color 0.3s;
}

.form-actions .reset-btn:hover {
	background-color: #2f6bbd88;
}

@media ( max-width : 768px) {
	.inquiry-container {
		width: 90%;
		padding: 20px;
	}
}

.reportText {
	border-bottom: 3px solid #f0f0f0;
}

#content {
	height: 450px;
}
</style>

</head>

<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="inquiry-container">
		<h2 class="reportText">1:1 문의</h2>
		<form method="post">
			<div class="form-group">
				<label for="category">문의 유형</label> <select id="category"
					name="DRcategory">
					<option value="reportUser">회원 신고</option>
					<option value="reportWriter">작가 신고</option>
					<option value="reportSystem">시스템 신고</option>
					<option value="reportShop">구매 문의</option>
					<option value="reportRefund">환불 문의</option>
					<option value="reportProfile">프로필 문의</option>
					<option value="reportFesta">대회 문의</option>
					<option value="reportHeadhunter">캐스팅 문의</option>
					<option value="reportall">기타 문의</option>
				</select>
			</div>
			<div class="form-group">
				<label for="title">제목 (필수)</label> <input type="text" id="title"
					name="DRtitle" placeholder="제목을 입력하세요" required> <input
					type="hidden" id="mno" name="mno" value="${mno}">
			</div>
			<div class="form-group">
				<label for="content">문의 내용 (필수)</label>
				<textarea id="content" name="DRcontent" placeholder="문의 내용을 입력하세요"
					required></textarea>
			</div>
			<div class="form-actions">
				<button type="button" class="btn submit-btn" id="registerBtn">1대
					1 문의 등록하기</button>
				<button type="button" class="btn reset-btn" id="resetBtn">초기화</button>
			</div>
		</form>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript"
		src="/resources/js/report/directReport.js"></script>
</body>
</html>
