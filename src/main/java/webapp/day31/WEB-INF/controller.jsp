<%@ page import="webapp.day31.model.dto.MemberDTO" %>
<%@ page import="webapp.day31.model.dao.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- jsp:useBean은 new를 대신해준다. -->
<jsp:useBean id="memberDTO" class="webapp.day31.model.dto.MemberDTO" />
<jsp:useBean id="memberDAO" class="webapp.day31.model.dao.MemberDAO" />
<!-- 세팅을 대신해주는 property -->
<jsp:setProperty name="memberDTO" property="*"/>
<%
    // 컨트롤러 페이지

    String action = request.getParameter("action");
    if(action.equals("LOGIN")){
        memberDTO = memberDAO.selectOne(memberDTO);
        if(memberDTO != null){
            // user와 memberdto만 넣으면 pw도 같이 들어가서 보안상 좋지 않음.
            session.setAttribute("userName", memberDTO.getName());
            response.sendRedirect("main.jsp");
        }
        else{
            out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
        }
    }
    else if(action.equals("LOGOUT")){
        // session.setAttribute("userName", null);
        session.removeAttribute("userName");
        // session.invalidate();
        out.println("<script>alert('로그아웃 성공!');location.href='main.jsp';</script>");
    }
    else if(action.equals("CHANGENAME")){

    }
    else if(action.equals("DELETEMEMBER")){

    }
%>