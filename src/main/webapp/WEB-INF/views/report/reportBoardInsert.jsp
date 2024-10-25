	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
		<div class="page-header">
		<h1>게시판 등록</h1>
	</div>
	<div class="panel-body">
		<form method="POST" id="insertForm">
			<table>
				<tbody>
					<tr>
						<td><input type="hidden" name="mno" value="1"></td>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer" /></td>
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
<script type="text/javascript" src="/resources/js/report/reportBoardInsert.js"></script>
	
</body>
</html>
