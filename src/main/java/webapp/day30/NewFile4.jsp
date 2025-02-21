<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>application</title>
</head>
<body>

<%
    int cnt = (int)application.getAttribute("cnt");
    cnt++;
    application.setAttribute("cnt", cnt);
%>

<h1>티모님의 미니홈피</h1>

투데이 방문자수 : <%=cnt%>명
</body>
</html>