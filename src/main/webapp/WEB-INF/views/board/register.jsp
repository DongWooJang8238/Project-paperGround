	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" />
	<div class="page-header">
		<h1>게시판 등록</h1>
	</div>
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
           					  <option value="5">자료게시판</option>
           					  <option value="6">요청게시판</option>
          					  <option value="0">공지사항</option> <!-- 추후 어드민만 보이게 설정? --></select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
						<td><input type="hidden" name="writer" value="${vo.userName}" readonly/></td>
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