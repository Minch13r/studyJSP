<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="webapp.signinup.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보 사이트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Style.css" rel="stylesheet">
</head>
<body>
<div id="box">
    <h1>Site</h1>
    <%
        // 로그인 검증
        String loginUser = (String)session.getAttribute("mid");
        if(loginUser != null) {
    %>
    <div class="alert alert-success">
        <%= loginUser %>님 환영합니다.
    </div>
    <%
        }
        // 에러
        String errorMsg = (String)request.getAttribute("errorMsg");
        if(errorMsg != null) {
    %>
    <div class="alert alert-danger">
        <%= errorMsg %>
    </div>
    <%
        }
    %>
    <form id="loginForm" action="loginprocess.jsp" method="post">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="mid" required></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="mpw" required></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <button type="button" class="btn btn-primary btn-custom" onclick="submitsign('login')">로그인</button>
                    <button type="button" class="btn btn-secondary btn-custom" onclick="submitsign('signup')">회원가입</button>
                </td>
            </tr>
        </table>
    </form>

</div>
<script src="js/LogIn.js"></script>
</body>
</html>
