<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/myPage.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
<title>마이페이지</title>
<style type="text/css">


/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
    z-index: 1000;
}

.modal-content {
    background-color: white;
    padding: 20px;
    width: 300px;
    border-radius: 10px;
    text-align: center;
    margin: 20px;
}

.modal-content h2 {
    font-size: 18px;
    margin-bottom: 10px;
}

.modal-content p {
    font-size: 12px;
    color: gray;
    margin-bottom: 20px;
}

.modal-content button {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    margin-bottom: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    background-color: #f2f2f2;
}

.modal-content button:last-child {
    background-color: #ddd;
    color: black;
    }
/* 메인 콘텐츠 */
.main-content {
   width: 100%;
   max-width: 1200px;
   margin: 30px auto;
   background-color: #ffffff;
   padding: 0px 0 0;
   border-radius: 10px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 제목 스타일 */
.content-header {
   width: 100%;
   height: 200px;
}
.content-header h1 {
   text-align: center;
   font-size: 24px;
   color: #333;
   margin-bottom: 20px;
}

/* 입력 그룹 */
.input-group, .email-group {
   margin-bottom: 20px;
}

.input-group label, .email-group label {
   font-size: 14px;
   color: #555;
   margin-bottom: 5px;
   display: block;
}

/* 인풋 필드 스타일 */
.input-group input, .email-group input {
   width: 100%;
   padding: 10px;
   font-size: 16px;
   border: 1px solid #ddd;
   border-radius: 5px;
   outline: none;
   transition: border-color 0.3s;
}

.input-group input:focus, .email-group input:focus {
   border-color: #38b2ac;
}

/* 이메일 입력 스타일 */
.email-group {
   display: flex;
   flex-direction: column;
}

.email-group div {
   display: flex;
   align-items: center;
}

.email-input {
   flex: 1;
   margin-right: 5px;
}

#emailDomain {
   flex: 1;
   padding: 10px;
   font-size: 16px;
   border: 1px solid #ddd;
   border-radius: 5px;
   outline: none;
   transition: border-color 0.3s;
}

#emailDomain:focus {
   border-color: #38b2ac;
}

/* 버튼 스타일 */
.btn {
   background-color: #38b2ac;
   color: #fff;
   padding: 8px 12px;
   font-size: 14px;
   border: none;
   border-radius: 5px;
   cursor: pointer;
   transition: background-color 0.3s;
}

.btn:hover {
   background-color: #319795;
}

.btn-outline-secondary {
   background-color: #fff;
   color: #555;
   border: 1px solid #ddd;
}

.btn-outline-secondary:hover {
   background-color: #f0f0f0;
}

/* 중복 확인 버튼 스타일 */
#duplicateCkBtn {
   margin-left: 10px;
   padding: 10px 15px;
   font-size: 14px;
   border: 1px solid #ddd;
   border-radius: 5px;
   cursor: pointer;
   transition: background-color 0.3s, color 0.3s;
}

#duplicateCkBtn:hover {
   background-color: #f8f8f8;
   color: #333;
}

/* 에러 메시지 스타일 */
.invalid-feedback {
   color: #ff5a5a;
   font-size: 12px;
   margin-top: 5px;
}

/* 기타 필드 스타일 */
#birthdate {
   padding: 10px;
   font-size: 16px;
   border: 1px solid #ddd;
   border-radius: 5px;
   width: 100%;
}

#birthdate:focus {
   border-color: #38b2ac;
}

.changePwBtn{
	border: 1px solid #ddd;
	padding: 8px;
}

.userPw:hover {
	cursor: pointer;
}
</style>
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>
   <!-- Main content -->
      <form method="post">
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
		<div class="main-content" style="padding: 0px 0 0; box-shadow: none;">
		<div class="main-area">
         <div class="content-header" style="border-bottom: 1px solid #777;">
            <h1>
               ${vo.userId }님은 <b>기본 등급</b>입니다.</h1>


            <c:if test="${empty vo.userIcon}">
                <img src="../resources/images/usericon.jpg" id="userIcon" alt="userIcon" width="100" height="100" onclick="openModal()">
            </c:if>

            <c:if test="${not empty vo.userIcon}">
            <img src="${vo.userIcon}" id="userIcon" alt="userIcon"
					width="100" height="100" onerror="this.onerror=null; this.src='../resources/images/usericon.jpg';" onclick="openModal()">
            </c:if>
         </div>

            <!-- 모달 -->
            <div class="modal" id="profileModal">
               <div class="modal-content">
                  <h2>프로필 사진 설정</h2>
                  <p>카카오계정에 등록한 프로필은 카카오 서비스에서 활용됩니다.</p>
                  <input type="file" id="openFile" value="" name="userIcon" style="display: none">
                  <button type="button"  onclick="selectPhoto(form)">사진 선택</button>
                  <button type="button"  onclick="setDefaultPhoto(this.form)">기본 이미지로 설정</button>
                  <button type="button"  onclick="closeModal()">취소</button>
               </div>
            </div>
            
         <div class="input-group" style="margin-top: 15px;">
            <label for="username">아이디</label> 
            <input style="border: none;" type="text" id="userId" name="userId" value="${vo.userId}" readonly disabled="disabled">
         </div>
         
         <div class="input-group">
            <label class="userPw" for="userPw">비밀번호 변경(클릭)</label>
            <input style="border: none;" type="password" id="userPw" name="userPw" value="123456789123456789" readonly="readonly" disabled="disabled">
         </div>
         
         <div class="input-group">
            <label for="userName">이름</label> <input style="border: none;" type="text" id="userName" name="userName" value="${vo.userName }" readonly disabled="disabled">
         </div>
		

         <div class="email-group">
            <label for="userEmail">메일</label>
            <div style="display: flex; align-items: center;">
               <input type="text" id="userEmail" name="userEmail"
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
               name="address" value="${vo.address }"
               placeholder="우편번호"> <input type="button"
               onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="streetAddress" name="streetAddress"
               value="${vo.streetAddress }" placeholder="주소"><br>
            <input type="text" id="detailAddress" name="detailAddress"
               value="${vo.detailAddress }" placeholder="상세주소">
            <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
         </div>


         <div class="input-group">
            <label for="userPhonenumber">전화번호</label> <input type="tel"
               id="userPhonenumber" name="userPhonenumber"
               oninput="autoHyphen(this)" placeholder="전화번호 ( ' - ' 제외 )[선택]"
               maxlength="13" value="${vo.userPhonenumber}" required>

         </div>


         <div class="input-group">
            <label for="userDate">생년월일:</label>
            <c:choose>
               <c:when test="${not empty vo.userDate }">
                  <input type="date" id="userDate" name="userDate"
                     value="${vo.userDate }" min="0000-01-01" max="2024-12-31" required>
               </c:when>
               <c:otherwise>
                  <input type="date" id="userDate" name="userDate" value="00-01-01" min="0000-01-01" max="2024-12-31" required>
               </c:otherwise>

            </c:choose>
         </div>

         <button type="button"  type="button" class="signup-btn"
            onclick="updateUserInfo(this.form)">수정하기</button>
		</div>
		</div>	
		</div>
	</form>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="/resources/js/myPage/myPageUpdate.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
