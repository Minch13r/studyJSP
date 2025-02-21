<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="webapp.signinup.MemberDTO"%>
<%@ page import="java.util.*"%>

<!-- signupProcess.jsp -->
<%
    request.setCharacterEncoding("UTF-8");

    // 회원 정보 전체를 저장하는 리스트
    ArrayList<MemberDTO> datas = (ArrayList<MemberDTO>)application.getAttribute("datas");

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
                id.trim().isEmpty() || password.trim().isEmpty() ||
                email.trim().isEmpty() || phoneNumber.trim().isEmpty()) {
            out.println("<script>");
            out.println("alert('모든 필드를 입력해주세요.');");
            out.println("history.back();");
            out.println("</script>");
            return;
        }

        // 아이디 중복 체크
        boolean flag = false;
        for(MemberDTO m : datas) {
            if(m.getId().equals(id)) {
                flag = true;
                break;
            }
        }

        if(flag) {
            out.println("<script>");
            out.println("alert('이미 사용중인 아이디입니다.');");
            out.println("history.back();");
            out.println("</script>");
            return;
        }

        // 새로운 회원 정보 추가
        MemberDTO member = new MemberDTO();
        member.setId(id);
        member.setPassword(password);
        member.setEmail(email);
        member.setPhoneNumber(phoneNumber);
        datas.add(member);

        // 로그
        System.out.println("[로그]새로운 회원 등록 완료");
        System.out.println("[로그]ID: " + id);
        System.out.println("[로그]회원수:" + datas.size());

        // client용 로그
        out.println("<script>");
        out.println("alert('회원가입이 성공적으로 완료되었습니다.');");
        out.println("window.location.href='index.jsp';");
        out.println("</script>");
    }
    catch(Exception e) {
        System.out.println("회원가입 처리 중 오류 발생: " + e.getMessage());
        request.setAttribute("errorMsg", e.getMessage());
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }
%>
