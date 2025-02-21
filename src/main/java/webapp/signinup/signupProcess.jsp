<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="webapp.signinup.MemberDTO"%>
<%@ page import="java.util.*"%>

<!-- signupProcess.jsp -->
<%
    request.setCharacterEncoding("UTF-8");

    // 세션에 등록된 회원 목록을 가져옴 (없으면 새로 생성)
    List<String> datas = (List<String>)application.getAttribute("datas");
    if(datas == null) {
        datas = new ArrayList<>();
        application.setAttribute("datas", datas);
    }

    try {
        String id = request.getParameter("mid");
        String password = request.getParameter("mpw");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        // 필수 입력값 체크
        if(id == null || password == null || email == null || phoneNumber == null ||
                id.isEmpty() || password.isEmpty() ||
                email.isEmpty() || phoneNumber.isEmpty()) {
            out.println("<script>");
            out.println("alert('모든 필드를 입력해주세요.');");
            out.println("history.back();");
            out.println("</script>");
            return;
        }

        // 아이디 중복 체크
        if(datas.contains(id)) {
            out.println("<script>");
            out.println("alert('이미 사용중인 아이디입니다.');");
            out.println("history.back();");
            out.println("</script>");
            return;
        }

        // 새로운 회원 정보 생성
        MemberDTO member = new MemberDTO();
        member.setId(id);
        member.setPassword(password);
        member.setEmail(email);
        member.setPhoneNumber(phoneNumber);

        // 아이디 목록에 추가
        datas.add(id);

        out.println("<script>");
        out.println("alert('회원가입성공');");
        out.println("window.location.href='index.jsp';");
        out.println("</script>");
    } catch(Exception e) {
        request.setAttribute("errorMsg", e.getMessage());
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }
%>
