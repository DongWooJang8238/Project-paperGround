<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="/resources/css/myPage.css">
    <title>포인트 현황</title>
    <link rel="stylesheet" href="styles.css">
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
</head>
<style>
body {
    font-family: 'Apple SD Gothic Neo', sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

.point-status {
    background-color: #ffffff;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.point-box h2 {
    font-size: 18px;
    font-weight: 500;
    color: #333333;
    margin-bottom: 20px;
}

.points {
    font-size: 36px;
    font-weight: 700;
    color: #007bff;
    margin-bottom: 20px;
}

.monthly-points, .expiring-points {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
    font-size: 16px;
    color: #666666;
}

.points-value {
    font-weight: 500;
}

.tabs {
    display: flex;
    justify-content: space-between;
    margin-top: 30px;
    border-bottom: 1px solid #eaeaea;
}

.tab-button {
    flex: 1;
    padding: 15px 0;
    background: none;
    border: none;
    font-size: 16px;
    color: #333;
    text-align: center;
    cursor: pointer;
    position: relative;
}

.tab-button.active {
    font-weight: 700;
    color: #007bff;
}

.tab-button.active::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 4px;
    background-color: #007bff;
}

.tab-content {
    display: none;
    margin-top: 30px;
}

.tab-content.active {
    display: block;
}

.entry {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 0;
    border-top: 1px solid #eaeaea;
    font-size: 16px;
}

.entry:first-child {
    border-top: none;
}

.icon {
    font-size: 22px;
    margin-right: 15px;
}

.details {
    flex-grow: 1;
    color: #333333;
}

.points-earned {
    font-weight: 700;
    color: #007bff;
}

/* 포인트 안내사항 섹션 스타일 */
.point-info {
    margin-top: 20px;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.point-info h3 {
    font-size: 16px;
    color: #666;
    margin-bottom: 10px;
}

.info-box {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px 15px;
    background-color: #f8f8f8;
    border-radius: 8px;
    border: 1px solid #e0e0e0;
}

.info-icon {
    font-size: 24px;
    color: #ff4b4b;
}

.info-text {
    font-size: 16px;
    font-weight: 500;
    color: #333;
    margin-left: 10px;
    flex-grow: 1;
}

.external-link {
    font-size: 18px;
    color: #999;
    text-decoration: none;
    
    
}

</style>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
        <div class="mypage-container">
      <div class="sidebar">
			<ul>
				<li><a href="#"> <i class="bx bx-user"></i> 회원정보
				</a>
					<ul class="sub-menu">
						<li><a href="/User/myPageUpdate?userId=${vo.userId}">회원정보
								수정</a></li>
						<!-- <li><a href="#">내 찜리스트</a></li> -->
						<li><a href="/User/selectMyPoint?mno=${vo.mno}">내 포인트</a></li>
					</ul></li>
				<li><a href="#"> <i class="bx bx-cart"></i> 쇼핑정보
				</a>
					<ul class="sub-menu">
						<li><a href="/User/OrderSelect?mno=${vo.mno}">주문목록/배송조회</a></li>
						<!-- <li><a href="#">취소/반품 내역</a></li> -->
					</ul></li>
				<li><a href="#"> <i class="bx bx-bar-chart"></i> 활동정보
				</a>
					<ul class="sub-menu">
						<li><a
							href="/User/myCommenPost?userMno=${vo.mno}&filterType=posts">내
								게시글/댓글</a></li>
						<li><a href="/User/myLikedWriterBookList?userMno=${vo.mno}">집필
								북마크</a></li>
					</ul></li>
				<li><a href="/User/deleteAccount"> <i class="bx bx-log-out"></i>
						회원 탈퇴
				</a></li>
			</ul>
		</div>
        <div class="container">
        <div class="point-status" style="min-width: 800px;">
            <div class="point-box">
                <h2>${vo.userName }님의 사용 가능 포인트  </h2>
                <div class="points">${vo.userPoint }P</div>
                <div class="monthly-points">
                    <span>이번 달 적립 포인트</span>
                    <span class="points-value">+${totalPoint }P</span>
                </div>
                <div class="expiring-points">
                    <span>이번 달 사용 포인트</span>
                    <span class="points-value">- ${totalUsePoint }P</span>
                </div>
            </div>

            <div class="tabs">
                <button class="tab-button active" data-tab="all">전체</button>
                <button class="tab-button" data-tab="earn">적립</button>
                <button class="tab-button" data-tab="use">사용</button>
            </div>
			
            <div class="tab-content active" id="all">
                    <c:forEach var="p" items="${list }">
                <div class="entry">
                    <div class="icon">📝</div>
                    <div class="details">
                        <p>${p.pointArea}</p>
                        <p>${p.pointGetDate }</p>
                    </div>
                    <c:choose>
                    	<c:when test="${p.status == '적립' }">
		                    <div class="points-earned">${p.point }P ${p.status }</div>
                    	</c:when>
                    	<c:otherwise>
		                    <div class="points-earned" style="color: red;">${p.point }P ${p.status }</div>
                    	</c:otherwise>
                    </c:choose>
                </div>
                    </c:forEach>
                </div>

		<div class="tab-content" id="earn">
			<c:choose>
				<c:when test="${empty list }">
					<p>적립내역이 없습니다.</p>
				</c:when>
				<c:when test="${not empty list }">
					<c:forEach var="p" items="${list }">
						<c:choose>
							<c:when test="${p.status eq '적립' }">
								<div class="entry">
									<div class="icon">📝</div>
									<div class="details">
										<p>${p.pointArea}</p>
										<p>${p.pointGetDate }</p>
									</div>
									<div class="points-earned">${p.point }P ${p.status }</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<div class="tab-content" id="use">
                	<c:choose>
				<c:when test="${empty list }">
					<p>사용내역이 없습니다.</p>
				</c:when>
				<c:when test="${not empty list }">
					<c:forEach var="p" items="${list }">
						<c:choose>
							<c:when test="${p.status eq '사용' }">
								<div class="entry">
									<div class="icon">📝</div>
									<div class="details">
										<p>${p.pointArea}</p>
										<p>${p.pointGetDate }</p>
									</div>
									<div class="points-earned" style="color: red;">${p.point }P ${p.status }</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
            </div>
        </div>
        </div>
    </div>

        <!-- 포인트 안내사항 섹션 -->
        <div class="point-info" style="width: 70%; margin-left: 15%;">
            <h3>포인트 안내사항</h3>
            <div class="info-box">
                <div class="info-icon">📄</div>
                <a href="/report/qna" class="external-link"><span class="info-text">포인트 정책</span></a>
            </div>
        </div>

    <jsp:include page="../layout/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/myPage/myPoint.js"></script>
</body>
</html>
    