<%@ page import="webapp.day31.model.dto.MemberDTO" %>
<%@ page import="webapp.day31.model.dao.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- jsp:useBean은 new를 대신해준다. -->
<jsp:useBean id="memberDTO" class="webapp.day31.model.dto.MemberDTO" />
<jsp:useBean id="memberDAO" class="webapp.day31.model.dao.MemberDAO" />
<%
    // 컨트롤러 페이지
    // view에서 넘어온 값이 파라미터로 전달
    String action = request.getParameter("action");
    // 콘솔은 1,2,3,4 elseif 이렇게 쓰는데 웹이기에 파라미터값으로 전함
    if(action.equals("LOGIN")){
        String mid = request.getParameter("mid");
        String password = request.getParameter("password");
        // new는 적을수록 좋음, 메모리 연산이 적어지니까.
        //MemberDTO dto = new MemberDTO();
        memberDTO.setMid(mid);
        memberDTO.setPassword(password);

        memberDTO = memberDAO.selectOne(memberDTO);
        if(memberDTO != null){
            // 로그인 성공
        }
        else {
            // 로긍인 실패
        }
    // V에게서 파라미터로 mid, password

    // MemberDTO dto = new MemberDTO();
    // dto.setMid();
    // dto.setPassword();

    // M한테 보낼예정
    // DTO = memberDAO.selectOne(DTO)
    // if 값반환이 잘되었으면, 로그인 성공
    // else 로그인 실패
    }
%>