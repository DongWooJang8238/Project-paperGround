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
				<div class="literature-gnb">
					<div class="logo">
						<img src="/assets/img/toplogo_blue.png" alt=""> 작품관리 <img
							class="beta-ic" src="/assets/ic/beta_icon.png" alt="">
					</div>
					<div class="link">
						<a href="/bridge/request/novel">조아라 웹소설 바로가기<img
							src="/assets/ic/list-item/subnav-list-ic.png" alt=""></a>
					</div>
				</div>
				<div class="profile-content custom">
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
						data-testid="joa-Mainpage-onClickNewBook">
						<div class="moduled-bookWrite-left">
							<p data-testid="joa-Mainpage-onClickNewBook">다음 에피소드</p>
						</div>
						<div class="link" data-wno="${wvo.wno}" data-testid="joa-Mainpage-onClickNewBook">
							연재하기<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
						</div>
					</div>
					<div class="banner-secondary moduled-bookWrite"
						data-testid="joa-Mainpage-onClickNewBook" style="background-color: silver;">
						<div class="moduled-bookWrite-left">
							<p data-testid="joa-Mainpage-onClickNewBook">작품 목록</p>
						</div>
						<div id="thanck" class="link" data-testid="joa-Mainpage-onClickNewBook">
							연재 감사드립니다.<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
						</div>
					</div>
						<c:forEach var="write" items="${list}">
							<div class="banner-secondary moduled-bookWrite"
								data-testid="joa-Mainpage-onClickNewBook">
									<div class="moduled-bookWrite-left">
										<h2 data-testid="joa-Mainpage-onClickNewBook">${write.episodeCount}. ${write.episodeTitle}</h2>
									</div>
									<div class="link" data-epno="${write.episodeno}" data-testid="joa-Mainpage-onClickNewBook">
										<p data-epno="${write.episodeno}">마지막 수정일 : ${write.epdate}</p>
										&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;
										수정하기<img src="/assets/ic/list-item/subnav-list-ic.png" alt="">
									</div>
							</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/write/writeMyEpList.js"></script>
</html>