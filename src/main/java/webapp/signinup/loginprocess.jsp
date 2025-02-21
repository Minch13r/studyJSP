<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="webapp.signinup.MemberDTO" %>
<%@ page import="java.util.*" %>
<!-- loginprocess.jsp -->
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("mid");
    String password = request.getParameter("mpw");

    // 입력값 검증
    if (id == null || id.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
        request.setAttribute("errorMsg", "아이디와 비밀번호를 모두 입력해주세요.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }

    // 회원 목록 가져오기
    List<MemberDTO> datas = (List<MemberDTO>) application.getAttribute("datas");
    MemberDTO loginMember = null;

    // 회원 찾기
    if (datas != null) {
        for (MemberDTO member : datas) {
            if (member.getId().equals(id) && member.getPassword().equals(password)) {
                loginMember = member;
                break;
            }
        }
    }

    // 로그인 처리
    if (loginMember != null) {
        // 로그인 성공
        session.setAttribute("mid", loginMember.getId());
        session.setAttribute("email", loginMember.getEmail());
        session.setAttribute("phoneNumber", loginMember.getPhoneNumber());

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
