<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sesison JSP 내장객체 실습 02</title>
</head>
<body>

<h1>로그인 페이지</h1>
<form action="NewFile8.jsp" method="post">
    <table border="1">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="mid"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="mpw"></td>
        </tr>
        <tr>
            <td colspan="2" align="right"><input type="submit" value="로그인"></td>
        </tr>
    </table>
</form>

</body>
</html>