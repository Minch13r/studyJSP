<%@ page import="webapp.signinup.MemberDTO" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .info-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .info-table {
            width: 100%;
            margin-top: 20px;
        }
        .info-table td {
            padding: 15px;
            border: 1px solid #dee2e6;
        }
        .info-label {
            background-color: #f8f9fa;
            font-weight: bold;
            width: 35%;
        }
        .welcome-message {
            color: cornflowerblue;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="info-container">
        <h2 class="text-center mb-4">회원 정보</h2>
        <%
            // 세션에서 로그인 정보 확인
            String loginUser = (String)session.getAttribute("mid");
            String email = (String)session.getAttribute("email");
            String phoneNumber =(String)session.getAttribute("phoneNumber");
            if(loginUser != null) {
        %>
        <div class="welcome-message text-center">
            <h4><%= loginUser %>님 환영합니다</h4>
        </div>

        <table class="info-table">
            <tr>
                <td class="info-label">아이디</td>
                <td><%= loginUser %></td>
            </tr>
            <tr>
                <td class="info-label">이메일</td>
                <td><%= email%></td>

            </tr>
            <tr>
                <td class="info-label">전화번호</td>
                <td>
                    <%= phoneNumber%>
                </td>
            </tr>
        </table>

        <div class="text-center mt-4">
            <button class="btn btn-primary me-2" onclick="location.href='index.jsp'">
                메인으로
            </button>
            <button class="btn btn-danger" onclick="location.href='logout.jsp'">
                로그아웃
            </button>
        </div>
        <%
        } else {
        %>
        <div class="alert alert-danger text-center">
            <p>로그인이 필요한 서비스입니다.</p>
            <a href="index.jsp" class="btn btn-primary mt-2">로그인 페이지로 이동</a>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
