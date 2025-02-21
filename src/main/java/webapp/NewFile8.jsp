<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>session JSP 내장객체 실습 02</title>
</head>
<body>

<%
    String mid=request.getParameter("mid");
    if(mid != null){
        session.setAttribute("userName", mid);
    }
    String userName=(String)session.getAttribute("userName");
%>

<h1>메인&nbsp;페이지</h1>
<form action="NewFile9.jsp" method="POST">
    <%=userName%>님 &gt;&gt; <input type="text" name="msg" placeholder="글을 작성해주세요." required> <input type="submit" value="글 작성"><br>
</form>

<hr>

<%
    ArrayList<String> msgs = (ArrayList<String>)session.getAttribute("msgs");
    if(msgs == null){
        out.println("출력할 댓글이 없습니다! <br>");
    }
    else{
        for(String msg : msgs){
            out.println(msg+" <br>");
        }
    }
%>

</body>
</html>