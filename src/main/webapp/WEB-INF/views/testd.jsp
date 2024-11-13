<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/myPage.css">
<title>마이페이지</title>
<style type="text/css">


/* 전체 페이지 기본 스타일 */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 20px;
}

/* 전체 컨테이너 스타일 */
.container {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-bottom: 20px;
}

/* 섹션 제목 스타일 */
.section-title {
    font-size: 16px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

/* 정보 행 스타일 */
.info-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    border-bottom: 1px solid #eee;
}

.info-row:last-child {
    border-bottom: none;
}

.label {
    font-size: 14px;
    color: #666;
}

.value {
    font-size: 14px;
    color: #333;
    font-weight: 500;
    text-align: right;
}

/* 프로필 정보 스타일 */
.profile-section {
    padding: 10px 0;
    border-bottom: 1px solid #eee;
}

.profile-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.profile-picture {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    overflow: hidden;
    margin-right: 10px;
}

.profile-info {
    flex-grow: 1;
    font-size: 14px;
    color: #666;
}

.profile-description {
    font-size: 12px;
    color: #aaa;
    margin-top: 5px;
}

/* 수정 아이콘 스타일 */
.edit-icon {
    width: 20px;
    height: 20px;
    cursor: pointer;
}

/* 등록하기 버튼 스타일 */
.register-button {
    font-size: 12px;
    color: #00aaff;
    cursor: pointer;
    text-decoration: underline;
}

/* 사용 중 스타일 */
.status-active {
    font-size: 12px;
    color: #00aaff;
}

}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Main content -->
		<form method="post">
		
		<div class="main-content">
			<div class="header">
				<h1
					style="color: #ffffff; text-align: center; font-size: 24px; margin-bottom: 20px;">
					${sessionScope.vo.userId }님은 기본 등급입니다.</h1>


				<c:if test="${empty sessionScope.vo.userIcon}">
					 <img src="../resources/images/usericon.jpg" id="userIcon" alt="userIcon" width="100" height="100" onclick="openModal()">
				</c:if>

				<c:if test="${not empty sessionScope.vo.userIcon}">
				 <img src="${sessionScope.vo.userIcon}" id="userIcon" alt="userIcon" width="100"
						height="100" onclick="openModal()">
				</c:if>
			</div>

				<!-- 모달 -->
				<div class="modal" id="profileModal">
					<div class="modal-content">
						<h2>프로필 사진 설정</h2>
						<p>카카오계정에 등록한 프로필은 카카오 서비스에서 활용됩니다.</p>
						<input type="file" id="openFile" value="" name="userIcon" style="display: none">
						<button onclick="selectPhoto(form)">사진 선택</button>
						<button onclick="setDefaultPhoto(this.form)">기본 이미지로 설정</button>
						<button onclick="setKakaoProfile()">카카오톡 프로필로 설정</button>
						<button onclick="closeModal()">취소</button>
					</div>
				</div>
				
			<div class="input-group">
				<label for="username">아이디</label> 
				<input type="text" id="userId" name="userId" value="${sessionScope.vo.userId}" readonly>
			</div>

			<div class="input-group">
				<label for="userName">이름</label> <input type="text" id="userName" name="userName" value="${sessionScope.vo.userName }" readonly>
			</div>


			<div class="email-group">
				<label for="userEmail">메일</label>
				<div style="display: flex; align-items: center;">
					<input type="email" id="userEmail" name="userEmail"
						value="${saveEmail }" class="email-input" required>@ <input
						list="emailOptions" id="emailDomain"
						placeholder="이메일을 선택하거나 입력하세요" value="${saveDomain }">
					<datalist id="emailOptions">
						<option value="naver.com" disabled="disabled" >
						<option value="gmail.com">
						<option value="daum.net">
						<option value="nate.com">
					</datalist>
				</div>
			</div>

			<div class="input-group">
				<label for="userAddress">주소</label> <input type="text" id="address"
					name="address" value="${sessionScope.vo.address }"
					placeholder="우편번호"> <input type="button"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="streetAddress" name="streetAddress"
					value="${sessionScope.vo.streetAddress }" placeholder="주소"><br>
				<input type="text" id="detailAddress" name="detailAddress"
					value="${sessionScope.vo.detailAddress }" placeholder="상세주소">
				<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			</div>


			<div class="input-group">
				<label for="userPhonenumber">전화번호</label> <input type="tel"
					id="userPhonenumber" name="userPhonenumber"
					oninput="autoHyphen(this)" placeholder="전화번호 ( ' - ' 제외 )[선택]"
					maxlength="13" value="${sessionScope.vo.userPhonenumber}" required>

			</div>


			<div class="input-group">
				<label for="userDate">생년월일:</label>
				<c:choose>
					<c:when test="${not empty sessionScope.vo.userDate }">
						<input type="date" id="userDate" name="userDate"
							value="${sessionScope.vo.userDate }" required>
					</c:when>
					<c:otherwise>
						<input type="date" id="userDate" name="userDate" value="00-01-01"
							required>
					</c:otherwise>

				</c:choose>
			</div>

			<button type="button" class="signup-btn"
				onclick="updateUserInfo(this.form)">수정하기</button>
			<div class="sidebar">
				<h3>마이페이지</h3>
				<ul>
					<li><a href="userShoping"
						onclick="toggleSubMenu('shopping-info')">쇼핑정보</a>
						<ul id="shopping-info" class="sub-menu">
							<li><a id="myOrder"
								href="/User/OrderSelect?mno=${sessionScope.vo.mno }">주문목록/배송조회</a></li>
							<li><a href="#">취소/반품/교환 내역</a></li>
						</ul></li>
					<li><a href="#" onclick="toggleSubMenu('benefit-management')">혜택관리</a>
						<ul id="benefit-management" class="sub-menu">
							<li><a href="#">쿠폰</a></li>
							<li><a href="#">적립금</a></li>
						</ul></li>
					<li><a href="userInfo" onclick="toggleSubMenu('member-info')">회원정보</a>
						<ul id="member-info" class="sub-menu">
							<li><a id="checkPage"
								href="/User/checkPassword?userId=${sessionScope.vo.userId }">회원정보
									수정</a></li>
							<li><a href="#">배송지 관리</a></li>
						</ul></li>
					<li><a href="/report/selectReport"
						onclick="toggleSubMenu('serviceCenter-info')">고객센터</a>
						<ul id="serviceCenter-info" class="sub-menu">
							<li><a id="reportCategory" href="/report/reportCategory">Q&A</a></li>
							<li><a id="reportBoard" href="/report/reportBoard?mno="1>문의센터</a></li>
							<li><a id="directReport" href="/report/directReport?mno="1>1:1문의</a></li>
						</ul></li>
					<li><a href="#">나의 게시글</a></li>
				</ul>
			</div>
	</form>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="/resources/js/myPage/myPageUpdate.js"></script>
<script type="text/javascript" src="/resources/js/myPage/sidebar.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
 --%>