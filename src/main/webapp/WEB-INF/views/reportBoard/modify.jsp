<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>
   <div class="page-header">
      <h1>게시글 수정 화면</h1>
   </div>
   <div class="panel-body">
      <form method="POST">
         <table>
            <tbody>
               <tr>
                  <td><input type="hidden" name="reportBoardno" value="${rbvo.reportBoardno}" ></td>
               </tr>
               <tr>
                  <th>제목</th>
                  <td><input type="text" name="title" value="${rbvo.title }"></td>
               </tr>
               <tr>
                  <th>작성자</th>
                  <td><input type="text" name="writer" value="${rbvo.writer }" readonly></td>
               </tr>
               <tr>
                  <th>내용</th>
                  <td>
                     <textarea rows="10" cols="76" name="content" >${rbvo.content }</textarea>
                  </td>
               </tr>
            </tbody>
         </table>
      </form>
      <div class="panel-body-btns">
         <button type="button" class="btn btn-sec" id="modifyBtn">수정</button>
         <button type="button" class="btn btn-sec" id="removeBtn">삭제</button>
         <button type="button" class="btn btn-fir" id="indexBtn">목록으로 이동</button>
      </div>
   </div>
<jsp:include page="../layout/footer.jsp" />
   <script type="text/javascript" src="/resources/js/reportBoard/modify.js"></script>   
</body>
</html>