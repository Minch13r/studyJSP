<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sesison JSP 내장객체 실습 01</title>
</head>
<body>

<%
    if(session.isNew()){
        session.setAttribute("userName", "작은 티모");
        out.println("<script>alert('로그인성공')</script>");
    }
    //세션이라는 거대한 dto에 userName이라는 properties가 있는 상황
    String userName = (String)session.getAttribute("userName");
%>

</body>
</html>