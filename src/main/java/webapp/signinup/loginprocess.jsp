<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="webapp.signinup.MemberDTO"%>
<%@ page import="java.util.*"%>
<!-- loginprocess.jsp -->
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("mid");
    String password = request.getParameter("mpw");

    // 입력값 검증
    if(id == null || id.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
        request.setAttribute("errorMsg", "아이디와 비밀번호를 모두 입력해주세요.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }

    // application 스코프에서 등록된 아이디 목록 가져오기
    List<String> datas = (List<String>)application.getAttribute("datas");
    boolean flag = false;

    // 등록된 아이디 목록이 존재하고, 해당 아이디가 목록에 있는 경우
    if(datas != null && datas.contains(id)) {
        flag = true;
    }

    // 로그인 처리
    if(flag) {
        // 로그인 성공
        session.setAttribute("mid", id);
        out.println("<script>");
        out.println("alert('로그인성공');");
        out.println("window.location.href='information.jsp';");
        out.println("</script>");
    } else {
        // 로그인 실패
        request.setAttribute("errorMsg", "등록되지 않은 아이디이거나 비밀번호가 일치하지 않습니다.");
        out.println("<script>");
        out.println("alert('로그인실패: 등록되지 않은 아이디입니다.');");
        out.println("window.location.href='index.jsp';");
        out.println("</script>");
    }
%>
