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

    }
    else if(action.equals("UPDATENAME")){
        // 현재 로그인된 사용자의 ID를 세션에서 가져옴
        String sessionMid = (String)session.getAttribute("mid");
        memberDTO.setMid(sessionMid);
        memberDTO.setCondition("UPDATE");

        // 이름 업데이트 시도
        boolean result = memberDAO.update(memberDTO);

        if(result){
            // 업데이트 성공 시 세션의 사용자 이름도 업데이트
            session.setAttribute("userName", memberDTO.getName());
            out.println("<script>alert('이름이 성공적으로 변경되었습니다.');location.href='controller.jsp?action=MYPAGE';</script>");
        }
        else{
            // 업데이트 실패 시
            out.println("<script>alert('이름 변경에 실패했습니다.');history.go(-1);</script>");
        }
    }

    else if(action.equals("DELETEID")){
        String sessionMid = (String)session.getAttribute("mid");
        memberDTO.setMid(sessionMid);

        boolean result = memberDAO.delete(memberDTO);

        if(result){
            // 세션 정리
            session.invalidate();  // 모든 세션 데이터 삭제
            out.println("<script>alert('회원탈퇴가 완료되었습니다.');location.href='main.jsp';</script>");
        }
        else {
            out.println("<script>alert('회원탈퇴에 실패했습니다.');history.go(-1);</script>");
        }
    }


    else if(action.equals("JOINPAGE")){
        response.sendRedirect("join.jsp");
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