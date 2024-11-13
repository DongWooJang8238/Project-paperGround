<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="panel-body">
		<form method="POST">
		<div class="text-container">
			<table>
				<tbody>
					<tr>
					    <td>
					    	<input type="hidden" name="mno" value="${bvo.mno}">
					        <input type="hidden" name="boardno" value="${bvo.boardno}" readonly>
					        		<div class="boardcategory">
								        <c:choose>
								            <c:when test="${bvo.category == 1}">자유게시판</c:when>
								            <c:when test="${bvo.category == 2}">리뷰게시판</c:when>
								            <c:when test="${bvo.category == 3}">토론게시판</c:when>
								            <c:when test="${bvo.category == 4}">문의게시판</c:when>
								            <c:when test="${bvo.category == 5}">자료게시판</c:when>
								            <c:when test="${bvo.category == 6}">요청게시판</c:when>
								            <c:when test="${bvo.category == 0}">공지사항</c:when>
								        </c:choose>
								    </div>
					        	<div class="title-container">
								    <br><div class="title">${bvo.title}</div>
								</div>
								<hr>
								<div class="title-container">
								    <div class="writer">${bvo.writer}</div>
								    <div class="regDate">${bvo.regDate}</div>
								</div>
					    </td>
					</tr>
					<tr>
					    <td>
					        <br><div class="content-display">${bvo.content}</div>
					    </td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
		<div class="file-container">
			<div class="file-header">
				<div class="file-title">
					<a>첨부 파일▼</a>
				</div>
			</div>
			<div class="file-body">
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
		<div id="like-section">
			<div id="like-count">
				<h1 id="like-countMy">${likecount}</h1>
			</div>
			<button id="like-btn" data-boardno="${bvo.boardno}" data-mno="${bvo.mno}">👍</button>
		</div>
		<div class="panel-body-btns">
			<button type="button" class="btn btn-sec" id="modifyBtn" data-boardmno="${bvo.mno}">수정</button>
			<button type="button" class="btn btn-fir" id="indexBtn">목록으로
				이동</button>
		</div>


		<div id="reply">
			<div class="reply-content">
				<div class="reply-title">
					<a>댓글</a>
				</div>
				<hr>
				<div class="reply-body">
					<div>
						<p>
							<input type="hidden" name="replyer" value="${vo.userName}" readonly>
						</p>
					</div>
					<div>
						<p>
							<input type="text" name="reply">
						</p>
					</div>
				</div>
				<div class="reply-footer">
					<button type="button" class="btn btn-sec" id="addReplyBtn">등록</button>
				</div>
			</div>
		</div>
		<br>
		<div class="panel-footer">
			<div class="panel-footer-body">
				<ul class="chat">
					<li data-replyno="10">
						<div>
							<div class="chat-header">
								<strong class="primary-font">작성자</strong> <small
									class="pull-right">0000-00-00</small>
							</div>

							<p>내용</p>

						</div>
					</li>
					<!-- 댓글 좋아요 버튼 및 개수 -->
				 	<div class="reply-like-section">
						<input type="hidden" name="mno" value="${bvo.mno}" readonly>
						<div class="reply-like-count" id="reply-like-count-10">0</div>
						<%-- <button type="button" class="reply-like-btn" id="replyLikeBtn" data-boardno="${bvo.boardno}">👍</button> --%>
						<button type="button" id="openModalBtn">수정</button>
						<!-- 기본 값 0 -->
					</div>
				</ul>
			</div>

		</div>

		<div id="modal">
			<div class="modal-content">
				<div class="modal-title">
					<a>댓글 수정</a>
				</div>
				<hr>
				<div class="modal-body">
					<ul class="chat">
						<li>
							<div>
								<div>
									<span class="modal-font">댓글</span>
								</div>
								<p>
									<input type="text" name="modalreply">
								</p>
							</div>
						</li>
						<li>
							<div>
								<div>
									<span class="modal-font">작성자</span>
								</div>
								<p>
									<input type="text" name="modalreplyer">
								</p>
							</div>
						</li>
						<input type="hidden" name="modalreplydate">
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-thi" id="modifyReplyBtn" data-replymno="${vo.mno}">수정</button>
					<button type="button" class="btn btn-fou" id="removeReplyBtn" data-delreplymno="${vo.mno}">삭제</button>
					<button type="button" class="btn btn-fir" id="closeModalBtn">취소</button>
				</div>
			</div>

		</div>
		</div>
		<jsp:include page="../layout/footer.jsp" />
		<script type="text/javascript" src="/resources/js/board/reply.js"></script>
		<script type="text/javascript" src="/resources/js/board/get.js"></script>
		<script type="text/javascript" src="/resources/js/board/like.js"></script>
		<script type="text/javascript" src="/resources/js/board/commentLike.js"></script>
</body>
</html>