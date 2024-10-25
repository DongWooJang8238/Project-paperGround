<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>
<style>
body {
	background-color: #f5deb3; /* Light brown background */
	font-family: Arial, sans-serif;
}

.container {
	width: 80%;
	margin: 0 auto;
}

.title-box {
	background-color: #cccccc;
	padding: 15px;
	font-size: 24px;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #333;
	color: white;
}

.paging {
	text-align: center;
	margin-top: 20px;
}

.paging a {
	margin: 0 5px;
	text-decoration: none;
	color: #333;
}

.paging a.active {
	font-weight: bold;
	color: red;
}
</style>

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
		<div class="page-header">
		<h1>게시글 화면</h1>
	</div>
	<div class="panel-body">
		<form method="POST">
			<table>
				<tbody>
					<tr>
						<th>글 번호</th>
						<td><input type="text" name="bno" value="${bvo.bno}" readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="${bvo.title }"
							readonly></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer" value="${bvo.writer }"
							readonly></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="76" name="content" readonly>${bvo.content }</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="file-container">
		   <div class="file-header">
		      <div class="file-title">
		         <a>파일 첨부</a>
		      </div>
		   </div>
		    <div class="file-body">
		      
		      <div class="uploadResult">
		         <ul></ul>
		      </div>
		   </div>
		</div>
		<div class="panel-body-btns">
			<sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.username eq bvo.writer }">
					<button type="button" class="btn btn-sec" id="modifyBtn">수정버튼</button>
				</c:if>
			</sec:authorize>
			
			<button type="button" class="btn btn-fir" id="indexBtn">목록으로 이동</button>
		</div>
	</div>
	<div class="panel-footer">
		<div class="panel-footer-header">
			<div class="panel-footer-title">
				<a href="mainPage">댓글</a>
			</div>
			<div class="panel-footer-register">
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username != null }">
						<button type="button" class="btn btn-sec" id="replyBtn">댓글 달기</button>
					</c:if>
				</sec:authorize>

			</div>
		</div>
		<div class="panel-footer-body">
			<ul class="chat">
				<li data-rno="10">
					<div>
						<div class="chat-header">
							<strong class="primary-font">작성자</strong>
							 <small class="pull-right">0000-00-00</small>
						</div>
						<p>내용</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="modal">
      <div class="modal-content">
         <div class="modal-title">
            <a>새 게시글 등록</a>
         </div>
         <hr>
         <div class="modal-body">
            <ul class="chat">
               <li>
                  <div>
                     <div>
                        <span class="modal-font">댓글</span>
                     </div>
                     <p><input type="text" name="reply" ></p>
                  </div>
               </li>
               <li>
                  <div>
                     <div>
                        <span class="modal-font">작성자</span>
                     </div>
                     <p><input type="text" name="replyer"></p>
                  </div>
               </li>
               <li>
                  <div>
                     <div>
                        <span class="modal-font">등록 날짜</span>
                     </div>
                     <p><input type="text" name="replydate"></p>
                  </div>
               </li>
            </ul>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-sec" id="addReplyBtn">등록</button>
            <button type="button" class="btn btn-thi" id="modifyReplyBtn">수정</button>
            <button type="button" class="btn btn-fou" id="removeReplyBtn">삭제</button>
            <button type="button" class="btn btn-fir" id="closeModalBtn">취소</button>
         </div>
      </div>
   </div>

		<jsp:include page="../layout/footer.jsp"></jsp:include>
		<script type="text/javascript" src="/resources/js/report/reportBoardRead.js"></script>
</body>
</html>
