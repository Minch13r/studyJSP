<%@ page import="webapp.signinup.MemberDTO" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>information.jsp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container1 {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .table {
            width: 100%;
            margin-top: 20px;
        }
        .table td {
            padding: 15px;
            border: 1px solid #dee2e6;
        }
        .innertable {
            background-color: #f8f9fa;
            font-weight: bold;
            width: 35%;
        }
        .msg {
            color: cornflowerblue;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="container1">
        <h2 class="text-center">회원 정보</h2>
        <%
            // 세션에서 로그인 정보 확인
            String loginUser = (String)session.getAttribute("mid");
            String email = (String)session.getAttribute("email");
            String phoneNumber =(String)session.getAttribute("phoneNumber");
            if(loginUser != null) {
        %>
        <div class="msg text-center">
            <h4><%= loginUser %>님 환영합니다</h4>
        </div>

        <table class="table">
            <tr>
                <td class="innertable">아이디</td>
                <td><%= loginUser %></td>
            </tr>
            <tr>
                <td class="innertable">이메일</td>
                <td><%= email %></td>

            </tr>
            <tr>
                <td class="innertable">전화번호</td>
                <td><%= phoneNumber %></td>
            </tr>
        </table>

        <div class="text-center mt-4">
            <button class="btn btn-danger" onclick="location.href='index.jsp'">
                로그아웃
            </button>
        </div>
        <%
        }
        %>
    </div>
</div>
</body>
</html>
