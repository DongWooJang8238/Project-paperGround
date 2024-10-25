<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/usedShopInsert.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../layout/header.jsp" />

	<div class="header">
		<h1>상품 등록 페이지</h1>
	</div>
	<div class="body">
		<form action="#" method="post">
			<table>
            <tbody>
               <tr>
                  <th>제목</th>
                  <td><input type="text" name="title" placeholder="제목을 입력 해 주세요" required="required"></td>
               </tr>
               <tr>
                  <th>가격</th>
                  <td><input type="text" name="ubookPrice" placeholder="가격 입력"></td>
               </tr>
               <tr>
                  <th>장르</th>
                  <td>
                  	<select name="gno">
                  		<option value="1">소설</option>
                  		<option value="2">역사</option>
                  		<option value="3">과학</option>
                  		<option value="4">예술</option>
                  		<option value="5">철학</option>
                  		<option value="6">자기계발</option>
                  		<option value="7">기술/공학</option>
                  		<option value="8">경제/경영</option>
                  		<option value="9">사회과학</option>
                  		<option value="10">종교</option>
                  	</select> 
                  </td>
               </tr>
               <tr>
                  <th>제품상태</th>
                  <td>
                  	<select name="status">
                  		<option value="new">미개봉 새상품</option>
                  		<option value="excellent">새 상품에 가까움</option>
                  		<option value="good">사용감 적음, 컨디션 양호</option>
                  		<option value="fair">사용감 있음, 컨디션 양호</option>
                  		<option value="worn">사용감 많음, 스크레치 등 존재</option>
                  	</select> 
                  </td>
               </tr>
               <tr>
                  <th>내용</th>
                  <td>
                     <textarea rows="10" cols="76" name="content" placeholder="내용 입력"></textarea>
                  </td>
               </tr>
            </tbody>
         </table>
         <input type="hidden" name="ubookImage">
         <input type="hidden" name="mno" value="1">
		</form>
	</div>
	<div class="footer">
		<div class="fileUpload">
			이미지 등록 : <input type="file" multiple="multiple">
		</div>
		<div class="fileResult">
			이미지 미리보기 영역
			<ul></ul>
		</div>
	</div>
	
	<button>등록</button>
	<button>취소</button>

	<jsp:include page="../layout/footer.jsp" />

</body>
<script type="text/javascript" src="/resources/js/usedShop/usedShopInsert.js"></script>
</html>