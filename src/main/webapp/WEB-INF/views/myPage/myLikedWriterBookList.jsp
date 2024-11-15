<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Joara Webtoon</title>
<link rel="stylesheet" href="/resources/css/myLikedBook.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

		<div id="search-container">
			<input type="text" id="search-input"  >
			<button type="button" id="search-button" onclick="test()">검색</button>
		</div>

		
				<div>
					<div>
						<table class="table">
							<thead>
								<tr>
									<th>책커버</th>
									<th>제목</th>
									<th>좋아요수</th>
									<th>장르</th>
								</tr>
							</thead>
							<tbody id="posts-list">
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach var="list" items="${list }">
											<tr>
												<td><img src="${list.coverImage }" alt="sibal" width="100" height="100"></td>
												<td>${list.title }</td>
												<td>${list.likeCount }</td>
												<td>${list.genre }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="3" class="no-data">작성하신 글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>



	<script type="text/javascript" src="/resources/js/myPage/myLikedWriterList.js"></script>
</body>

</html>
