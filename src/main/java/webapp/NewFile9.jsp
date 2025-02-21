<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%
    String msg = request.getParameter("msg");

    ArrayList<String> msgs = (ArrayList<String>)session.getAttribute("msgs");
    if(msgs == null){
        msgs = new ArrayList<String>();
        session.setAttribute("msgs", msgs);
    }
    msgs.add(session.getAttribute("userName")+"님 : "+msg);

    response.sendRedirect("NewFile8.jsp");
%>