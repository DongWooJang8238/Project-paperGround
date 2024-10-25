<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1대1 문의하기</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<h2>1대1 문의</h2>

<form method="post">
    <table>
        <tr>
            <td><label for="title">제목:</label></td>
            <td><input type="text" id="title" name="DRtitle" required /></td>
        </tr>
        <tr>
            <td><label for="category">카테고리:</label></td>
            <td>
                <select id="category" name="DRcategory">
                    <option value="reportUser">회원 문의</option>
                    <option value="reportWriter">작가 문의</option>
                    <option value="reportSystem">시스템 문의</option>
                    <option value="reportShop">구매 문의</option>
                    <option value="reportRefund">환불 문의</option>
                    <option value="reportProfile">프로필 문의</option>
                    <option value="reportFesta">대회 문의</option>
                    <option value="reportHeadhunter">캐스팅 문의</option>
                    <option value="reportall">기타 문의</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><label for="content">문의 내용:</label></td>
            <td><textarea id="content" name="DRcontent" rows="5" cols="50" required></textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit" onclick="kakk()">확인</button>
                <button type="reset">초기화</button>
            </td>
        </tr>
    </table>
</form>

<c:if test="${not empty successMessage}">
    <p style="color: green;">${successMessage}</p>
</c:if>

<c:if test="${not empty errorMessage}">
    <p style="color: red;">${errorMessage}</p>
</c:if>
 <jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/report/directReport.js"></script>
</body>
</html>
