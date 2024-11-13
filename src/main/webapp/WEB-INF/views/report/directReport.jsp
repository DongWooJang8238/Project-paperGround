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

<h2>신고하기</h2>

<form method="post">
    <table>
        <tr>
            <td><label for="title">제목:</label></td>
            <td><input type="text" id="title" name="DRtitle" required /></td>
            <td><input type="hidden" id="mno" name="mno" value="${sessionScope.vo.mno }" /></td>
        </tr>
        <tr>
            <td><label for="category">카테고리:</label></td>
            <td>
                <select id="category" name="DRcategory">
                    <option value="reportUser">회원 신고</option>
                    <option value="reportWriter">작가 신고</option>
                    <option value="reportSystem">시스템 신고</option>
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
            <td colspan="3">
               <button type="button" class="btn btn-fir" id="registerBtn">1대 1 문의 등록하기</button>
               <button type="button" class="btn btn-fir" id="resetBtn">초기화</button>
            </td>
        </tr>
    </table>
</form>

<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/report/directReport.js"></script>
</body>
</html>
