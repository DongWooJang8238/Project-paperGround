<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
/* 기본 스타일 */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
    color: #333;
}

/* 제목 스타일 */
h2 {
    text-align: center;
    margin-top: 30px;
    font-size: 24px;
    font-weight: bold;
    color: #444;
}

/* 컨테이너 */
.panel-body {
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

th {
    font-weight: bold;
    color: #555;
    background-color: #f1f1f1;
}

/* 입력 필드와 텍스트에어리어 */
input[type="text"], textarea {
    width: calc(100% - 20px);
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f9f9f9;
    color: #333;
}

textarea {
    resize: none;
}

/* 버튼 스타일 */
.panel-body-btns {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button.btn-sec {
    background-color: #007bff;
    color: #fff;
}

button.btn-sec:hover {
    background-color: #0056b3;
}

button.btn-fir {
    background-color: #6c757d;
    color: #fff;
}

button.btn-fir:hover {
    background-color: #5a6268;
}

/* 처리 완료 버튼 스타일 */
.completed {
    font-weight: bold;
    color: red;
    text-decoration: underline;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .panel-body {
        padding: 15px;
    }
    
    th, td {
        font-size: 14px;
    }
    
    button {
        font-size: 14px;
        padding: 8px 16px;
    }
}
</style>
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    
    <div class="panel-body">
        <h2>문의 상세</h2>
        <form method="POST">
            <table>
                <tbody>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" id="title" name="title" value="${drvo.DRtitle}" readonly></td>
                    </tr>
                    <tr>
                        <th>문의 카테고리</th>
                        <td><input type="text" name="title" value="${drvo.DRcategory}" readonly></td>
                    </tr>
                    <tr>
                        <th>작성자 회원 번호</th>
                        <td><input type="text" name="writer" value="${drvo.mno}" readonly></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea rows="10" cols="76" name="content" readonly>${drvo.DRcontent}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="drno" value="${drvo.drno}" readonly></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <div class="panel-body-btns">
            <sec:authorize access="principal.user.mno == 1">
                <button type="button" class="btn btn-sec" id="markAsCompleted" onclick="markAsCompleted()">처리 완료</button>
            </sec:authorize>
            <button type="button" class="btn btn-fir" id="indexBtn">목록으로 이동</button>
        </div>
    </div>
    
    <jsp:include page="../layout/footer.jsp" />
    <script type="text/javascript" src="/resources/js/report/getDR.js"></script>
</body>
</html>
