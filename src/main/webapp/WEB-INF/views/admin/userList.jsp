<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style>
   
</style>
    <!-- Bootstrap이나 모달을 위한 CSS/JS 파일 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
     <div class="container">
        <h2>User List</h2>

        <!-- 유저 테이블 -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>회원  ID</th>
                    <th>회원 이름</th>
                    <th>회원 이메일</th>
                    <th>회원 등급</th>
                    <th>회원 관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${list}">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.userEmail}</td>
                        <td>${user.userRole}</td>
                        
                        <td>
                            <!-- 권한 변경 모달을 여는 버튼 -->
                            <button class="btn btn-primary" data-toggle="modal" data-target="#roleModal" data-id="${user.userId}" data-username="${user.userName}" data-role="${user.userRole}"> 권한 변경</button>
                            
                            <!-- 유저 삭제 버튼 -->
                            <form action="/admin/deleteUser" method="post" style="display:inline;">
                                <input type="hidden" name="userId" value="${user.userId}">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('정말로 이 회원을 삭제하시겠습니까?')">회원 삭제 </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이지네이션 (PageDTO 사용) -->
        <div class="pagination">
            <c:if test="${pageMaker != null}">
                <c:forEach var="i" begin="1" end="${pageMaker.endPage}">
                    <a href="?pageNum=${i}&amount=${cri.amount}" class="btn btn-light">${i}</a>
                </c:forEach>
            </c:if>
        </div>

        <!-- 권한 변경 모달 -->
        <div class="modal fade" id="roleModal" tabindex="-1" role="dialog" aria-labelledby="roleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="roleModalLabel">유저 권한 변경</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/admin/changeRole" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="userId" id="userId">
                            <div class="form-group">
                                <label for="username">회원 이름</label>
                                <input type="text" class="form-control" id="username" name="username" readonly>
                            </div>
                            <div class="form-group">
                                <label for="role">권한</label>
                                <select class="form-control" name="userRole" id="userRole">
                                    <option value="USER_ROLE">일반 회원</option>
                                    <option value="WRITER_ROLE">작가 회원</option>
                                    <option value="ADMIN_ROLE">관리자</option>
                                    <option value="Manager_ROLE">운영자</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                            <button type="submit" class="btn btn-primary">권한 변경</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>	

   

    <jsp:include page="../layout/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/admin/userList.js"></script>
    
</body>
</html>
