<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/writeSidebar.css">
<link rel="stylesheet" href="/resources/css/writeInsert.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div id="root">
		<div class="wrap">
			<div class="subpage-container bg-w">
				<div class="part-sub-wrap">
						<div class="part-sub-row">
							<textarea rows="2" class="part-title-auto"
								placeholder="소제목을 입력하세요." name="episodeTitle" required=""
								style="height: 55px;"></textarea>
							<div class="part-text-component">
								<textarea rows="1" class="p-text-auto"
									placeholder="작품 내용을 입력하세요." name="content"
									style="height: 240px; overflow: hidden;"></textarea>
							</div>
						</div>
						<div class="part-sub-row">
							<div class="part-review-component">
								<p class="part-label">작품후기</p>
								<textarea rows="1" class="p-review-auto"
									placeholder="작품 후기를 입력하세요." name="episodecomment"
									style="height: 120px; overflow: hidden;"></textarea>
							</div>
						</div>
						<input type="hidden" name="wno" value="${wno}">
					<div class="pc-page-link">
						<a data-testid="joa-BookWriteBottomLink-next"
							href="/book/series/new#step2"><button class="next "
								data-testid="joa-BookWriteBottomLink-next"
								style="cursor: pointer;">완료</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/write/writeInsertEpisode.js"></script>
<script type="text/javascript" src="/resources/js/write/writeSidebar.js"></script>
</html>