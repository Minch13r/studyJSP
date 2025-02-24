<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
</head>
<body>

<h1>회원가입</h1>
<div id="info">
    <form action="controller.jsp" method="POST">
        <input type="hidden" name="action" value="JOIN">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="mid" required></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="submit" value="회원가입"></td>
            </tr>
        </table>
    </form>
</div>

</body>