<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
</head>
<body>

<% if(session.getAttribute("userName") == null){ %>
<div id="logout">
    <form action="controller.jsp" method="POST">
        <input type="hidden" name="action" value="LOGIN">
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
                <td colspan="2" align="right"><input type="submit" value="로그인">&nbsp;<a href="controller.jsp?action=JOINPAGE">회원가입</a></td>
            </tr>
        </table>
    </form>
</div>
<% } else { %>
<div id="login">
    <table border="1">
        <tr>
            <td><%=session.getAttribute("userName")%>님, 환영합니다! :D</td>
        </tr>
        <tr>
            <td><a href="controller.jsp?action=MYPAGE">마이페이지</a></td>
        </tr>
        <tr>
            <td><a href="controller.jsp?action=LOGOUT">로그아웃</a></td>
        </tr>
        <tr>
            <td><a href="controller.jsp">글작성버튼</a></td>
        </tr>
    </table>
</div>
<% } %>

<br><hr><br>

<div id="search">
    <form action="controller.jsp" method="GET">
        <select name="searchCondition">
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