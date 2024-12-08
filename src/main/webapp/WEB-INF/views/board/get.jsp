<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="panel-body">
		<form method="POST">
			<div class="text-container">
				<table>
					<tbody>
						<c:choose>
							<c:when test="${isBestList}">인기게시판</c:when>
							<c:when test="${selectedCategory == '0'}">공지사항</c:when>
							<c:when test="${selectedCategory == '1'}">자유게시판</c:when>
							<c:when test="${selectedCategory == '2'}">리뷰게시판</c:when>
							<c:when test="${selectedCategory == '3'}">토론게시판</c:when>
							<c:when test="${selectedCategory == '4'}">문의게시판</c:when>
							<c:when test="${selectedCategory == '5'}">자료게시판</c:when>
							<c:when test="${selectedCategory == '6'}">요청게시판</c:when>
							<c:otherwise>게시판</c:otherwise>
						</c:choose>
						<div class="categoryList">
							<hr>
							<a href="list?pageNum=1&amount=10&category=0"
								class="${selectedCategory == '0' ? 'active' : ''}"><i
								class="bi bi-megaphone"></i> 공지</a> <a
								href="list?pageNum=1&amount=10&category=1"
								class="${selectedCategory == '1' ? 'active' : ''}"><i
								class="bi bi-chat-dots"></i> 자유게시판</a> <a
								href="list?pageNum=1&amount=10&category=2"
								class="${selectedCategory == '2' ? 'active' : ''}"><i
								class="bi bi-star"></i> 리뷰게시판</a> <a
								href="list?pageNum=1&amount=10&category=3"
								class="${selectedCategory == '3' ? 'active' : ''}"><i
								class="bi bi-columns-gap"></i> 토론게시판</a> <a
								href="list?pageNum=1&amount=10&category=4"
								class="${selectedCategory == '4' ? 'active' : ''}"><i
								class="bi bi-question-circle"></i> 문의게시판</a> <a
								href="list?pageNum=1&amount=10&category=5"
								class="${selectedCategory == '5' ? 'active' : ''}"><i
								class="bi bi-folder"></i> 자료게시판</a> <a
								href="list?pageNum=1&amount=10&category=6"
								class="${selectedCategory == '6' ? 'active' : ''}"><i
								class="bi bi-box-arrow-down"></i> 요청게시판</a> <a
								href="bestList?pageNum=1&amount=20"
								class="${isBestList ? 'active' : ''}"><i
								class="bi bi-trophy"></i> 인기게시판</a>
							<hr>
						</div>


						<tr>
							<td><input type="hidden" name="mno" value="${bvo.mno}">
								<input type="hidden" name="boardno" value="${bvo.boardno}"
								readonly>
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
									<div class="title">${bvo.title}</div>
									
									<div class="writer">작성자: ${bvo.writer}</div>
									<div class="readCount">
										<i class="bi bi-eye"></i>${bvo.readCount}
									</div>
									<div class="regDate">
										<i class="bi bi-clock"></i> ${bvo.regDate}
									</div>
								</div></td>
						</tr>
						<tr>
							<td><br>
							<div class="content-display">${bvo.content}</div></td>
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
			<sec:authorize access="isAuthenticated()">
				<button id="like-btn" data-boardno="${bvo.boardno}"
					data-mno="${bvo.mno}"><i class="bi bi-chat-left-heart"></i></button>
			</sec:authorize>
		</div>
		<div class="panel-body-btns">
			<sec:authorize access="isAuthenticated()">
				<!-- 로그인된 사용자만 볼 수 있는 내용 -->
				<button type="button" class="btn btn-sec" id="modifyBtn"
					data-boardmno="${bvo.mno}">수정</button>
			</sec:authorize>
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
							<sec:authorize access="isAuthenticated()">
								<!-- 로그인된 사용자만 볼 수 있는 내용 -->
								<input class="BoardGet" type="hidden" name="replyer"
									value="<sec:authentication property="principal.user.nickName"/>"
									readonly>
							</sec:authorize>

							<sec:authorize access="isAnonymous()">
								<!-- 로그인되지 않은 사용자에게만 보이는 내용 -->
								<input class="BoardGet" type="hidden" name="replyer"
									placeholder="로그인이 필요한 기능입니다." readonly>
							</sec:authorize>
						</p>
					</div>
					<div>
						<p>
							<sec:authorize access="isAuthenticated()">
								<input class="replyCss" type="text" name="reply">
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<!-- 로그인되지 않은 사용자에게만 보이는 내용 -->
								<input class="BoardGet" type="text" name="reply" placeholder="로그인이 필요한 기능입니다."
									readonly>
							</sec:authorize>
						</p>
					</div>
				</div>
				<div class="reply-footer">
					<sec:authorize access="isAuthenticated()">
						<button class="BoardGet" type="button" class="btn btn-sec" id="addReplyBtn">등록</button>
					</sec:authorize>
				</div>
			</div>
		</div>
		<br>
		<div class="panel-footer">
			<div class="panel-footer-body">
				<ul class="chat">
					<!-- <li data-replyno="10">
						<div>
							<div class="chat-header">
								<strong class="primary-font">작성자</strong> <small
									class="pull-right">0000-00-00</small>
							</div>

							<p>내용</p>

						</div>
					</li>
					 댓글 좋아요 버튼 및 개수 
				 	<div class="reply-like-section">
						<input type="hidden" name="mno" value="${bvo.mno}" readonly>
						<div class="reply-like-count" id="reply-like-count-10">0</div>
						 <button type="button" class="reply-like-btn" id="replyLikeBtn" data-boardno="${bvo.boardno}">👍</button>	
						<button type="button" id="openModalBtn">수정</button>
						기본 값 0
					</div>
					 -->
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
						<input type="hidden" name="data_replyno">
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-thi" id="modifyReplyBtn"
						data-replymno="${bvo.mno}">수정</button>
					<button type="button" class="btn btn-fou" id="removeReplyBtn"
						data-delreplymno="${bvo.mno}">삭제</button>
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