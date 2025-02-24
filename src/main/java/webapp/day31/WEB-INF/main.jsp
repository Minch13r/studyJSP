<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
</head>
<body>

<div id="login">
    <!-- URL에 나오면 안돼서 Read여도 POST -->
    <form actiion="controller.jsp" method="post">
        <!-- 사용자가 볼 수 없게 hidden 처리 -->
        <input type="hidden" name="action" value="LOGIN">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input type="password" name="password" required></td>
            </tr>

            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" required></td>
            </tr>

            <tr>
                <td colspan="2" align="right"><input type="submit" value="로그인">&nbsp;<a href="controller.jsp">회원가입</a></td>
            </tr>
        </table>
    </form>
</div>

<br><hr><br>

<div id="search">
    <!-- Read이기에 GET, URL에 나와도 됨 -->
    <form action="controller.jsp" method="GET">
        <select>
            <option>제목</option>
            <option>작성자</option>
        </select>
        <input type="text" name="searchKeyword" required>
        <input type="submit" value="검색">
    </form>
</div>

<br><hr><br>

<div id="board">
    <h3>글 목록</h3>
</div>

<br><hr><br>

<div id="newMember">
    <h3>신규 회원 목록</h3>
</div>
</body>
</html>