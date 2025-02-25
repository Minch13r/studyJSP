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
    System.out.println(" CTRL 로그 : action ["+action+"]");

    // action이 null일 경우 기본 페이지로 이동
    if(action == null) {
        response.sendRedirect("main.jsp");
        return;
    }

    if(action.equals("LOGIN")){
        memberDTO.setCondition("LOGIN");
        memberDTO = memberDAO.selectOne(memberDTO);
        if(memberDTO != null){
            session.setAttribute("mid", memberDTO.getMid());
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

    else if(action.equals("JOIN")){
        memberDTO.setCondition("INSERT");
        boolean result = memberDAO.insert(memberDTO);

        if(result){
            out.println("<script>alert('회원가입이 완료되었습니다.');location.href='main.jsp';</script>");
        }
        else {
            out.println("<script>alert('회원가입에 실패했습니다.');history.go(-1);</script>");
        }
    }

    else if(action.equals("UPDATENAME")){
        String sessionMid = (String)session.getAttribute("mid");
        memberDTO.setMid(sessionMid);
        memberDTO.setCondition("UPDATE");

        boolean result = memberDAO.update(memberDTO);

        if(result){
            // 성공시
            session.setAttribute("userName", memberDTO.getName());
            out.println("<script>alert('이름이 성공적으로 변경되었습니다.');location.href='controller.jsp?action=MYPAGE';</script>");
        }
        else{
            // 실패 시
            out.println("<script>alert('이름 변경에 실패했습니다.');history.go(-1);</script>");
        }
    }

    else if(action.equals("DELETEID")){
        String sessionMid = (String)session.getAttribute("mid");
        memberDTO.setMid(sessionMid);

        boolean result = memberDAO.delete(memberDTO);

        if(result){
            session.invalidate();  // 모든 세션 초기화
            out.println("<script>alert('회원탈퇴가 완료되었습니다.');location.href='main.jsp';</script>");
        }
        else {
            out.println("<script>alert('회원탈퇴에 실패했습니다.');history.go(-1);</script>");
        }
    }

    else if(action.equals("MYPAGE")){
        memberDTO.setMid((String)session.getAttribute("mid"));
        memberDTO.setCondition("MYPAGE");
        memberDTO = memberDAO.selectOne(memberDTO);
        request.setAttribute("mid", memberDTO.getMid());
        request.setAttribute("name", memberDTO.getName());
        request.setAttribute("regdate", memberDTO.getRegdate());
        pageContext.forward("mypage.jsp"); // 응답 : 리다이렉트 vs 포워드
    }
%>