<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminEntrance</title>
<style>
    .button-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }
    .admin-button {
        width: 25%; /* 화면의 1/4 정도의 너비로 설정 */
        height: 6.25vh; /* 화면의 1/16 정도의 높이로 설정 */
        margin: 10px 0;
        font-size: 1.2em;
        color: white;
        border: none;
        cursor: pointer;
    }
    .admin-button.user-management {
        background-color: red;
    }
    .admin-button.post-management {
        background-color: yellow;
        color: black;
    }
    .admin-button.data-management {
        background-color: green;
    }
</style>
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="button-container">
        <button class="admin-button user-management" onclick="location.href='/admin/userList'">사용자 관리</button>
        <button class="admin-button post-management" onclick="location.href='/admin/scriptList'">게시물 관리</button>
        <button class="admin-button data-management" onclick="location.href='/admin/dataList'">데이터 관리</button>
    </div>

    <jsp:include page="../layout/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/report/adminEntrance.js"></script>
</body>
</html>
