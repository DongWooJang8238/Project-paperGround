<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/totalSelect.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<div id="q-app">
	<section data-v-92e0019a="" class="contentArea">
	<div data-v-35734774="" data-v-f154c9a4="" data-v-92e0019a="" class="search_all">
	<section data-v-35734774="" class="padding_top">
	<div data-v-3bec083e="" data-v-f154c9a4="" class="inner" data-v-35734774="">
	<article data-v-3bec083e="" class="con_area">
		<h3 data-v-f154c9a4="" data-v-3bec083e="" class="hide">통합검색목록</h3>
		<div data-v-f154c9a4="" data-v-3bec083e="" class="tag_count">
			<p data-v-f154c9a4="" data-v-3bec083e="" class="card_name" data-selectop="${select.selectOption}" data-selectva="${select.selectValue}">
				'${select.selectValue}' <i data-v-f154c9a4="" data-v-3bec083e="">에 대해</i><span
					data-v-f154c9a4="" data-v-3bec083e=""> 총 ${listSize}<i
					data-v-f154c9a4="" data-v-3bec083e="">개의 콘텐츠를 찾았습니다.</i></span>
			</p>
		</div>
		<div data-v-f154c9a4="" data-v-3bec083e="" class="card_lst_area">
			<p data-v-f154c9a4="" data-v-3bec083e="" class="count">
				<i data-v-f154c9a4="" data-v-3bec083e="">게시글</i><b data-v-f154c9a4=""
					data-v-3bec083e="">${boardList.size()}</b>
			</p>
			<ul data-v-f154c9a4="" data-v-3bec083e="" class="lst">
				<c:choose>
					<c:when test="${boardList.size() > 0}">
						<c:forEach var="boardList" items="${boardList}" end="9">
							<li data-v-f154c9a4="" data-v-3bec083e=""><div
									data-v-f154c9a4="" data-v-3bec083e="" class="card_img">
									<a data-v-f154c9a4="" href="board" data-no="${boardList.boardno}" class=""
										data-v-3bec083e=""><p data-v-f154c9a4="" class="img">
											<img data-v-f154c9a4=""
												src="//img.lovepik.com/png/20231109/open-book-knowledge-learning-start-season-illustration-fashion-accessory-go_539920_wh860.png">
										</p></a>
								</div>
								<div data-v-f154c9a4="" data-v-3bec083e="" class="data">
									<a data-v-f154c9a4="" href="board" data-no="${boardList.boardno}" class=""
										data-v-3bec083e=""><p data-v-f154c9a4="" class="name">${boardList.title}</p>
										<p data-v-f154c9a4="" class="brand">
											댓글 <i data-v-f154c9a4="" class="type">${boardList.replyCount}</i>
										</p></a>
								</div>
								</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
			<c:choose>
				<c:when test="${boardList.size() > 10}">
					<a data-v-f154c9a4="" data-v-3bec083e="" data-type="board" class="lst_more">게시글 더보기</a>
				</c:when>
			</c:choose>
		</div>
		<div data-v-f154c9a4="" data-v-3bec083e="" class="con_lst_area">
			<p data-v-f154c9a4="" data-v-3bec083e="" class="count">
				<i data-v-f154c9a4="" data-v-3bec083e="">도서</i><b
					data-v-f154c9a4="" data-v-3bec083e="">${bookList.size()}</b>
			</p>
			<ul data-v-f154c9a4="" data-v-3bec083e="" class="lst">
				<c:choose>
					<c:when test="${bookList.size() > 0}">
						<c:forEach var="bookList" items="${bookList}" end="9">
							<li data-v-f154c9a4="" data-v-3bec083e=""><a data-v-f154c9a4=""
								href="book" data-no="${bookList.bno}" class="" data-v-3bec083e=""><p
										data-v-f154c9a4="" class="img">
										<img data-v-f154c9a4=""
											src="${bookList.bookcover}"
											width="100" height="100" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
									</p>
									<p data-v-f154c9a4="" class="category">평점 : ${bookList.avgRating}</p>
									<p data-v-f154c9a4="" class="subj">${bookList.title}</p>
									<p data-v-f154c9a4="" class="brand"><fmt:formatNumber value="${bookList.bookPrice}" type="number" pattern="#,###" />원</p>
									<div data-v-f154c9a4="" class="data">
										<p data-v-f154c9a4="" class="date">${bookList.shortText}</p>
										<p data-v-f154c9a4="" class="writer">${bookList.writer}</p>
								</div></a>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
			<c:choose>
				<c:when test="${bookList.size() > 10}">
					<a data-v-f154c9a4="" data-v-3bec083e="" data-type="book" class="lst_more">상품 더보기</a>
				</c:when>
			</c:choose>
		</div>
		<div data-v-f154c9a4="" data-v-3bec083e="" class="card_lst_area">
			<p data-v-f154c9a4="" data-v-3bec083e="" class="count">
				<i data-v-f154c9a4="" data-v-3bec083e="">중고</i><b data-v-f154c9a4=""
					data-v-3bec083e="">${ubookList.size()}</b>
			</p>
			<ul data-v-f154c9a4="" data-v-3bec083e="" class="lst">
				<c:choose>
					<c:when test="${ubookList.size() > 0}">
						<c:forEach var="ubookList" items="${ubookList}" end="9">
							<li data-v-f154c9a4="" data-v-3bec083e=""><div
									data-v-f154c9a4="" data-v-3bec083e="" class="card_img">
									<a data-v-f154c9a4="" href="ubook" data-no="${ubookList.ubno}" class=""
										data-v-3bec083e=""><p data-v-f154c9a4="" class="img">
											<img data-v-f154c9a4=""
												src="${ubookList.ubookImage}">
										</p></a>
								</div>
								<div data-v-f154c9a4="" data-v-3bec083e="" class="data">
									<a data-v-f154c9a4="" href="ubook" data-no="${ubookList.ubno}" class=""
										data-v-3bec083e=""><p data-v-f154c9a4="" class="name">${ubookList.title}</p>
										<p data-v-f154c9a4="" class="brand">
											가격 <i data-v-f154c9a4="" class="type"><fmt:formatNumber value="${ubookList.ubookPrice}" type="number" pattern="#,###" />원</i>
										</p></a>
								</div>
								</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
			<c:choose>
				<c:when test="${ubookList.size() > 10}">
					<a data-v-f154c9a4="" data-v-3bec083e="" data-type="ubook" class="lst_more">중고 상품 더보기</a>
				</c:when>
			</c:choose>
		</div>
		<div data-v-f154c9a4="" data-v-3bec083e="" class="con_lst_area">
			<p data-v-f154c9a4="" data-v-3bec083e="" class="count">
				<i data-v-f154c9a4="" data-v-3bec083e="">집필</i><b
					data-v-f154c9a4="" data-v-3bec083e="">${writeList.size()}</b>
			</p>
			<ul data-v-f154c9a4="" data-v-3bec083e="" class="lst">
				<c:choose>
					<c:when test="${writeList.size() > 0}">
						<c:forEach var="writeList" items="${writeList}" end="9">
							<li data-v-f154c9a4="" data-v-3bec083e=""><a data-v-f154c9a4=""
								href="write" data-no="${writeList.wno}" class="" data-v-3bec083e=""><p
										data-v-f154c9a4="" class="img">
										<img data-v-f154c9a4=""
											src="${writeList.coverImage}"
											width="100" height="100" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
									</p>
									<p data-v-f154c9a4="" class="category">장르 : ${writeList.genre}</p>
									<p data-v-f154c9a4="" class="subj">${writeList.title}</p>
									<p data-v-f154c9a4="" class="brand">${writeList.writeType}</p>
									<div data-v-f154c9a4="" class="data">
										<p data-v-f154c9a4="" class="date">${writeList.description}</p>
										<p data-v-f154c9a4="" class="writer">${writeList.writer}</p>
								</div></a>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
			<c:choose>
				<c:when test="${writeList.size() > 10}">
					<a data-v-f154c9a4="" data-v-3bec083e="" data-type="write" class="lst_more">작품 더보기</a>
				</c:when>
			</c:choose>
		</div>
	</article>
	</div>
	</section>
	</div>
	</section>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/totalSelect.js"></script>
</html>