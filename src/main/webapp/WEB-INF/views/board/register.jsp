	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	/* styles.css */
body {
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
    color: #333;
}

.panel-body {
    margin: 20px auto;
    padding: 20px;
    max-width: 800px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.panel-body table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.panel-body th {
    text-align: left;
    padding: 10px;
    background: #f4f4f4;
    border: 1px solid #ddd;
}

.panel-body td {
    padding: 10px;
    border: 1px solid #ddd;
}

.panel-body select, .panel-body input[type="text"], .panel-body textarea {
    width: calc(100% - 20px);
    padding: 8px;
    margin: 5px 0;
    box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.panel-body textarea {
    resize: vertical;
}

.file-container {
    margin: 20px auto;
    padding: 15px;
    max-width: 800px;
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.file-header {
    padding: 5px 10px;
    background-color: #f4f4f4;
    border-bottom: 1px solid #ddd;
    font-weight: bold;
}

.uploadDiv input[type="file"] {
    display: block;
    margin: 10px 0;
}

.uploadResult ul {
    list-style: none;
    padding: 0;
}

.uploadResult li {
    margin: 5px 0;
    padding: 5px;
    background: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.panel-body-btns {
    text-align: center;
    margin: 20px 0;
}

.panel-body-btns .btn {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    margin: 5px;
}

.btn-sec {
    background-color: #7fb5ff88;
    color: white;
}

.btn-sec:hover {
    background-color: #007bff;
}

.btn-fir {
    background-color: #f44336;
    color: white;
}

.btn-fir:hover {
    background-color: #e53935;
}

.panel-body a {
    text-decoration: none;
    color: #4CAF50;
}

.panel-body a:hover {
    color: #388E3C;
}
	
</style>
<body>
<jsp:include page="../layout/header.jsp" />
	<div class="panel-body">
		<form method="POST">
			<table>
				<tbody>
					<tr>
						<th>카테고리</th>
						<td><select name="category">
								<option value="1">자유게시판</option>
								<option value="2">리뷰게시판</option>
								<option value="3">토론게시판</option>
								<option value="4">문의게시판</option>
								<option value="6">요청게시판</option>
								<sec:authorize access="principal.user.userRole == 'ADMIN_ROLE'">
									<option value="5">자료게시판</option>
									<option value="0">공지사항</option>
									<!-- 추후 어드민만 보이게 설정? -->
								</sec:authorize>
						</select></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
						<sec:authorize access="isAuthenticated()">
						<input type="hidden" name="writer" value="<sec:authentication property="principal.user.nickName"/>" readonly>
						</sec:authorize>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="76" name="content"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="file-container">
		<div class="file-header">
			<div class="file-title">
				<a>파일 첨부</a>
			</div>
		</div>
		<div class="file-body">
			<div class="uploadDiv">
				<input type="file" name="uploadFile" multiple="multiple">
			</div>
			<div class="uploadResult">
				<ul></ul>
			</div>
		</div>
	</div>
	<div class="panel-body-btns">
		<button type="button" class="btn btn-sec" id="registerBtn">새 게시글 등록</button>
		<button type="button" class="btn btn-fir" id="resetBtn">다시 작성</button>
		<button type="button" class="btn btn-fir" id="indexBtn">목록으로 이동</button>
	</div>

<jsp:include page="../layout/footer.jsp" />
	<script type="text/javascript" src="/resources/js/board/register.js"></script>
	<script type="text/javascript" src="/resources/js/board/upload.js"></script>
</body>
</html>