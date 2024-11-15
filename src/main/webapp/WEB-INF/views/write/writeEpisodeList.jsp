<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/writeMyEp.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="root">
		<div class="wrap">
			<div class="profile-writer-wrap">
				<div class="profile-content custom">
					<div class="literature-gnb">
						<div class="logo">
							<img src="/assets/img/toplogo_blue.png" alt=""> ${wvo.writer} 님의 작품 <img
								class="beta-ic" src="/assets/ic/beta_icon.png" alt="">
						</div>
						<div class="writeHome">
							<a href="#">집필 게시판 바로가기<img src="https://writer.joara.com/assets/ic/list-item/subnav-list-ic.png" alt=""></a>
						</div>
					</div>
					<div class="profile-ic">
						<img class="img"
							src="${wvo.coverImage}" alt="" onerror="this.onerror=null; this.src='/resources/images/notImg.webp';">
						<div class="inner-border"></div>
					</div>
					<div class="profile-name">
						<div class="pen-ic"></div>
						<div class="name">${wvo.title}</div>
					</div>
					<div class="work-subnav-list">
						<a class="list-item" href="#">
							<div>
								편수<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">${wvo.epCount}</div></a>
						<a class="list-item"
							href="#"><div>
								연재시작일<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">${wvo.startDate}</div></a>
						<a class="list-item"
							href="#"><div>
								최종연재일<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
							</div>
							<div class="number">${wvo.updateDate}</div></a>
					</div>
					<div class="banner-secondary moduled-bookWrite"
						data-testid="joa-Mainpage-onClickNewBook" style="background-color: silver;">
						<div class="moduled-bookWrite-left">
							<p data-testid="joa-Mainpage-onClickNewBook">작품 목록</p>
						</div>
						<div id="thanck" class="link" data-testid="joa-Mainpage-onClickNewBook">
							${wvo.writeType}<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
						</div>
					</div>
						<c:forEach var="write" items="${list}">
							<div class="banner-secondary moduled-bookWrite"
								data-testid="joa-Mainpage-onClickNewBook" data-epno="${write.episodeno}">
									<div class="moduled-bookWrite-left">
										<h2 data-testid="joa-Mainpage-onClickNewBook">${write.episodeCount}. ${write.episodeTitle}</h2>
									</div>
									<div class="link" data-epno="${write.episodeno}" data-testid="joa-Mainpage-onClickNewBook">
										<c:choose>
											<c:when test="${write.lastDate != null}">
												<p data-epno="${write.episodeno}">언제봤을까? : ${write.lastDate}</p>
											</c:when>
											<c:otherwise>
												<p data-epno="${write.episodeno}">읽지 않음</p>
											</c:otherwise>
										</c:choose>
										<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
									</div>
							</div>
						</c:forEach>
						<div class="writeEpisodeContentModal">
						    <div class="modal-header">
						        <h1>이거슨제목</h1>
						    </div>
						    <div class="modal-body">
						        <div class="content">
						            <ol>
						                <b>1화</b>
						                <p>
						                    content content content content content content content content content content
						                </p>
						            </ol>
						        </div>
						        <div class="comment">
						            <h2>코멘트 영역</h2>
						            <b>작가의 한줄</b>
						        </div>
						        <div class="reply">
						            <h2>리뷰(댓글) 영역</h2>
						        </div>
						    </div>
						    <div class="modal-footer">
						        <button class="prev-btn">이전편</button>
						        <button class="list-btn">목록</button>
						        <button class="next-btn">다음편</button>
						    </div>
						</div>

				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/write/writeEpList.js"></script>
</html>