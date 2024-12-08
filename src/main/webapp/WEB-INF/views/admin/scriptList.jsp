<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 관리</title>
<style>		
   
</style>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</head>


<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <div class="container">
       <h2>게시글 목록</h2>
       
        <!-- 게시판 버튼 부분 -->
        <table class="table table-bordered">
        <thead>
     	   <tr>
     	 	  <div class="categorys">
				<button class="category" value ="0">공지사항</button>
				<button class="category" value="1">자유게시판</button>
				<button class="category" value="2">리뷰게시판</button>
				<button class="category" value="3">토론게시판</button>
				<button class="category" value="4">문의게시판</button>
				<button class="category" value="5">자료게시판</button>
				<button class="category" value="6">요청게시판</button>
      		  </div>
	      	 </tr>
	      	 <tr>
		      	 <th>게시글  번호</th>
		      	 <th>게시글  제목</th>
		      	 <th>게시글 작성자</th>
		      	 <th>게시글 작성일</th>
		      	 <th>게시글 관리</th>	      	 
	      	 </tr>
	     </thead>
	     <tbody>
           <c:forEach var="rptlrmf" items="${list}">
                    <tr>
                        
                        <td>${rptlrmf.boardno}</td>
                        <td>${rptlrmf.title}</td>
                        <td>${rptlrmf.writer}</td>
                        <td>${rptlrmf.regDate}</td>
                        <td>
                            <!--  삭제 버튼 -->
                            <form action="/admin/scriptCut" method="post" style="display:inline;">
                                <input type="hidden" name="boardno" value="${rptlrmf.boardno}">
                                <button type="submit" class="btn btn-danger">게시글 숨기기 </button>
                            </form>
                        </td>
                     </tr>
            </c:forEach>
	     </tbody> 
	     </table>	  
        
        <!-- 페이징 부분 -->
         <div class="pagination">
    <c:if test="${pageMaker != null}">
        <c:forEach var="i" begin="1" end="${pageMaker.endPage}">
            <a href="/admin/scriptList?pageNum=${i}&amount=${pageMaker.cri.amount}" class="btn btn-light">${i}</a>
        </c:forEach>
    </c:if>
</div>
   

    <jsp:include page="../layout/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/admin/ScriptList.js"></script>
</body>
</html>
