<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/writeHome.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
/* 기본 스타일 */
body {
   margin: 0;
   font-family: Arial, sans-serif;
}

/* 헤더 스타일 */
.header {
   display: flex;
   justify-content: flex-start; /* 왼쪽 정렬 */
   align-items: center;
   padding: 25px 70px;
   background-color: #fff;
   border-bottom: 1px solid #ddd;
   font-weight: bold;
}

.logo {
   display: flex;
   align-items: center;
   font-size: 28px;
   margin-right: 3cm;
   padding-left: 220px;
}

/* 검색 영역 스타일 */
.search-area {
   display: flex;
   justify-content: flex-start;
   align-items: center;
   position: relative;
   left: -60px; /* 로고 우측으로 배치 */
}

.search-box {
   display: flex;
   align-items: center;
   border: 1px solid #ddd;
   border-radius: 30px;
   padding: 5px 10px;
   background-color: #fff;
   gap: 10px;
}

.category-select {
   border: none;
   background: none;
   font-size: 16px;
   cursor: pointer;
}

.search-bar {
   border: none;
   outline: none;
   width: 400px;
   font-size: 16px;
}

.search-icon {
   cursor: pointer;
   width: 20px;
   height: 20px;
}

/* 네비게이션 스타일 */
.nav-links {
   display: flex;
   gap: 30px;
   font-size: 20px;
   font-weight: bold;
   margin: 28px 0 0 3cm;
   padding-left: 200px;
   margin-bottom: 28px;
}

.dropdown {
   position: relative;
}

/* 드롭다운 메뉴 스타일 */
.dropdown-content {
   display: none;
   position: absolute;
   top: 100%;
   left: 0;
   background-color: #fff;
   box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.2);
   padding: 10px 0;
   border-radius: 10px;
   z-index: 9999;
   font-weight: normal;
   min-width: 150px;
   text-align: center;
   font-weight: bold;
}

.dropdown-content p {
   padding: 8px 0;
   font-size: 16px;
   color: #333;
}

.dropdown-content p:hover {
   background-color: #7fb5ff88;
   color: #000;
}

.dropdown:hover .dropdown-content {
   display: block;
}

.user-options {
   position: absolute; /* 부모 요소를 기준으로 위치 지정 */
   right: 300px; /* 오른쪽 여백 설정 */
   display: flex;
   gap: 18px;
   font-size: 28px;
}

.icon {
   margin-left: 10px;
   cursor: pointer;
   font-weight: bold;
}

/* 검색 영역 스타일 */
.search-bar {
   padding: 5px 10px;
   border-radius: 10px;
   width: 350px;
}

.search-icon {
   cursor: pointer;
   width: 24px;
   height: 24px;
}

.search-button {
   display: none;
}

.user-button {
   display: flex; /* 버튼 내 아이콘과 텍스트를 flex로 배치 */
   flex-direction: column; /* 아이콘 위에 텍스트가 오도록 세로로 배치 */
   align-items: center; /* 중앙 정렬 */
   justify-content: center; /* 세로 중앙 정렬 */
   text-align: center; /* 텍스트 중앙 정렬 */
   background: none; /* 배경 제거 */
   border: none; /* 기본 버튼 스타일 제거 */
}

.user-button i {
   font-size: 24px; /* 아이콘 크기 설정 */
}

.user-button .small-text {
   font-size: 12px; /* 작은 글자 크기 */
   color: gray; /* 회색 글자 색 */
   font-weight: normal; /* 기본 글씨 두께 */
}

.dropdown-content p:hover {
	cursor: pointer;
}
</style>
</head>
<body>

   <div class="header">
      <!-- 좌측 로고 -->
      <div class="logo">
         <a href="/"><img src="../resources/images/logobody.png" style="padding-top: 10px"></a>
      </div>

      <!-- 검색 및 인증 버튼 영역 -->
      <!--    <div class="search-area">
         <input type="text" class="search-bar" placeholder="검색어를 입력하세요">
         <button class="search-button" onclick="searchFunction()">검색</button> 
         <img src="https://cf.joara.com/joara30FE/assets/icon/ico_top_search.png" alt="검색" class="search-icon">
         <span class="icon">🛒</span>
      </div>
   </div>
    -->
      <div class="user-options">
         <sec:authorize access="isAuthenticated()">
            <span class="nav-links"> <!-- 로그인된 사용자만 볼 수 있는 내용 --> <!-- 로그아웃 -->
               <button type="button" id="logout" class="user-button">
                  <i class="bi bi-box-arrow-right"></i><span class="small-text">로그아웃</span>
               </button> <!-- 마이페이지 -->
               <button type="button" id="myPage" class="user-button">
                  <i class="bi bi-person-lines-fill"></i> <span class="small-text">마이페이지</span>
               </button> <!-- 장바구니 -->
               <button type="button" id="cart" class="user-button">
                  <i class="bi bi-cart"></i><span class="small-text">장바구니</span>
               </button> <!-- 고객센터 --> <span class="dropdown">
                  <button class="user-button">
                     <i class="bi bi-question-circle"></i><span class="small-text">고객센터</span>
                  </button> <span class="dropdown-content"> <sec:authorize
                        access="principal.user.userRole == 'ADMIN_ROLE'">
                        <p onclick="adminPage()">관리자 페이지</p>
                        <!-- 추후 어드민만 보이게 설정? -->
                     </sec:authorize>
                     <sec:authorize
                        access="principal.user.userRole != 'ADMIN_ROLE'">
                     <p onclick="godirectReport()">1:1 문의</p>
                        </sec:authorize>
                     <p onclick="godirectReportCheck()">1:1 문의 확인</p>
                     <p onclick="qna()">Q&A</p>
               </span>
            </span>
            </span>
            <!-- 로그인 상태에서만 사용하는 input -->
            <input type="hidden" id="mno" name="mno"
               value="<sec:authentication property='principal.user.mno'/>">
         </sec:authorize>

         <!-- 로그인되지 않은 사용자만 볼 수 있는 내용 -->
         <sec:authorize access="isAnonymous()">
            <input type="hidden" id="mno" name="mno">
            <span class="nav-links">
               <button type="button" id="login" class="user-button">
                  <i class="bi bi-person"></i><span class="small-text">로그인 </span>
               </button> <span class="dropdown">
                  <button id="seviceCenter" class="user-button">
                     <i class="bi bi-question-circle"></i><span class="small-text">고객센터</span>
                  </button> <span class="dropdown-content">
                     <p onclick="qna()">Q&A</p>
               </span>
            </span>
            </span>
         </sec:authorize>
      </div>

      <%--       <sec:authorize access="isAnonymous()">
                   <!-- 로그인되지 않은 사용자에게만 보이는 내용 -->
                        <button type="button" id="login">로그인</button>
                        <button type="button" id="signup">회원가입</button>
               </sec:authorize>
                        <button type="button" id="gogack">고객센터</button>
               
   <sec:authorize access="isAuthenticated()"> --%>

      <div class="search-area">
         <div class="search-box">
            <!-- 카테고리 선택 -->
            <select class="category-select">
               <option value="all">전체</option>
               <option value="title">카테고리1</option>
               <option value="content">카테고리2</option>
            </select>
            <!-- 검색 입력 -->
            <input type="text" class="search-bar" placeholder="검색어를 입력하세요">
            <!-- 돋보기 이미지 -->
            <img
               src="https://cf.joara.com/joara30FE/assets/icon/ico_top_search.png"
               alt="검색" class="search-icon">
         </div>
      </div>
   </div>



   <!-- 네비게이션 링크 -->
   <div class="nav-links">
      <div class="dropdown">
         <span>일반도서</span>
         <div class="dropdown-content">
            <p onclick="shopListGo('all')">전체</p>
            <p onclick="shopListGo(1)">소설</p>
            <p onclick="shopListGo(2)">역사</p>
            <p onclick="shopListGo(3)">과학</p>
            <p onclick="shopListGo(4)">예술</p>
            <p onclick="shopListGo(5)">철학</p>
            <p onclick="shopListGo(6)">자기계발</p>
            <p onclick="shopListGo(7)">기술/공학</p>
            <p onclick="shopListGo(8)">경제/경영</p>
            <p onclick="shopListGo(9)">사회과학</p>
            <p onclick="shopListGo(10)">종교</p>
         </div>
      </div>
          <div class="dropdown">
         <span>중고도서</span>
         <div class="dropdown-content">
            <p onclick="shopUsedList('all')">전체</p>
            <p onclick="shopUsedList(1)">소설</p>
            <p onclick="shopUsedList(2)">역사</p>
            <p onclick="shopUsedList(3)">과학</p>
            <p onclick="shopUsedList(4)">예술</p>
            <p onclick="shopUsedList(5)">철학</p>
            <p onclick="shopUsedList(6)">자기계발</p>
            <p onclick="shopUsedList(7)">기술/공학</p>
            <p onclick="shopUsedList(8)">경제/경영</p>
            <p onclick="shopUsedList(9)">사회과학</p>
            <p onclick="shopUsedList(10)">종교</p>
         </div>
      </div> 
      <div class="dropdown">
         <span>도서창작</span>
         <div class="dropdown-content">
            <p onclick="writeHomeGo('home')">창작 홈</p>
            <p onclick="writeHomeGo('all')">전체작품</p>
            <p onclick="writeHomeGo('goMyEp')">작품등록</p>
         </div>
      </div>
      <div class="dropdown">
         <span>도서게시판</span>
         <div class="dropdown-content">
            <p onclick="goBoard(1)">자유게시판</p>
            <p onclick="goBoard(2)">리뷰게시판</p>
            <p onclick="goBoard(3)">토론게시판</p>
            <p onclick="goBoard(4)">문의게시판</p>
            <p onclick="goBoard(5)">자료게시판</p>
            <p onclick="goBoard(6)">요청게시판</p>
            <p onclick="goBoard(10)">인기게시판</p>
            <p onclick="goBoard(0)">공지</p>
         </div>
      </div>
      <div class="dropdown">
         <span onclick="goGame()">도서게임</span>
      </div>
   </div>

</body>
</html>
