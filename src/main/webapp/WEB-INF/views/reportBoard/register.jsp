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
						<th>건의 상세 분류</th>
						<td><select name="reportCategory">
          					  <option value="reportall">기타사항</option>
           					  <option value="reportUser">회원정보</option>
           					  <option value="reportWriter">작가</option>
          					  <option value="reportSystem">시스템</option> 
          					  <option value="reportShop">구매</option> 
          					  <option value="reportRefund">환불</option> 
          					  <option value="reportProfile">프로필</option> 
          					  <option value="reportFesta">대회</option> 
          					  <option value="reportHeadhunter">캐스팅</option> 
          					  </select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer" value="${vo.userName}" readonly/></td>
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

	<div class="panel-body-btns">
		<button type="button" class="btn btn-sec" id="registerBtn">새 게시글 등록</button>
		<button type="button" class="btn btn-fir" id="resetBtn">다시 작성</button>
		<button type="button" class="btn btn-fir" id="indexBtn">목록으로 이동</button>
	</div>
<jsp:include page="../layout/footer.jsp" />
	<script type="text/javascript" src="/resources/js/reportBoard/register.js"></script>
	<script type="text/javascript" src="/resources/js/reportBoard/reply.js"></script>
</body>
</html>