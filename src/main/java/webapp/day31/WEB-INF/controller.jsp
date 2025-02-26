<%@ page import="webapp.day31.model.dto.MemberDTO" %>
<%@ page import="webapp.day31.model.dao.MemberDAO" %>
<%@ page import="webapp.day31.model.dto.BoardDTO" %>
<%@ page import="webapp.day31.model.dao.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="webapp.day31.model.dto.ReplyDTO" %>
<%@ page import="webapp.day31.model.dao.ReplyDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- jsp:useBean은 new를 대신해준다. -->
<jsp:useBean id="memberDTO" class="webapp.day31.model.dto.MemberDTO" />
<jsp:useBean id="memberDAO" class="webapp.day31.model.dao.MemberDAO" />
<jsp:useBean id="replyDAO" class="webapp.day31.model.dao.ReplyDAO" />
<jsp:useBean id="replyDTO" class="webapp.day31.model.dto.ReplyDTO" />
<jsp:useBean id="boardDTO" class="webapp.day31.model.dto.BoardDTO" />
<jsp:useBean id="boardDAO" class="webapp.day31.model.dao.BoardDAO" />
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

    // 로그인
    if(action.equals("LOGIN")){
        memberDTO.setCondition("LOGIN");
        memberDTO = memberDAO.selectOne(memberDTO);
        // memberDTO에 값이 있을 때
        if(memberDTO != null){
            session.setAttribute("mid", memberDTO.getMid());
            session.setAttribute("userName", memberDTO.getName());
            // main.jsp로 이동
            response.sendRedirect("main.jsp");
        }
        else{
            //out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
            request.setAttribute("msg", "로그인 실패!");
            request.setAttribute("flag", false);
            pageContext.forward("alert.jsp");
        }
    }

    // 로그아웃
    else if(action.equals("LOGOUT")){
        // session.setAttribute("userName", null);
        // 세션에서 userName 지우기
        session.removeAttribute("userName");
        // session.invalidate();
        //out.println("<script>alert('로그아웃 성공!');location.href='main.jsp';</script>");
        request.setAttribute("msg", "로그아웃 성공!");
        request.setAttribute("flag", true);
        request.setAttribute("url", "main.jsp");
        pageContext.forward("alert.jsp");
    }

    // 회원가입
    else if(action.equals("JOIN")){
        memberDTO.setCondition("INSERT");
        boolean result = memberDAO.insert(memberDTO);

        if(result){
            //out.println("<script>alert('회원가입이 완료되었습니다.');location.href='main.jsp';</script>");
            request.setAttribute("msg", "회원가입이 완료되었습니다.");
            request.setAttribute("flag", true);
            request.setAttribute("url", "main.jsp");
            pageContext.forward("alert.jsp");
        }
        else {
            //out.println("<script>alert('회원가입에 실패했습니다.');history.go(-1);</script>");
            request.setAttribute("msg", "회원가입에 실패했습니다.!");
            request.setAttribute("flag", false);
            pageContext.forward("alert.jsp");
        }
    }

    // 이름 변경
    else if(action.equals("UPDATENAME")){
        String sessionMid = (String)session.getAttribute("mid");
        memberDTO.setMid(sessionMid);
        memberDTO.setCondition("UPDATE");

        boolean result = memberDAO.update(memberDTO);

        if(result){
            // 성공시
            session.setAttribute("userName", memberDTO.getName());
            //out.println("<script>alert('이름이 성공적으로 변경되었습니다.');location.href='controller.jsp?action=MYPAGE';</script>");
            request.setAttribute("msg", "이름이 성공적으로 변경되었습니다.");
            request.setAttribute("flag", true);
            request.setAttribute("url", "controller.jsp?action=MYPAGE");
            pageContext.forward("alert.jsp");
        }
        else{
            // 실패 시
            //out.println("<script>alert('이름 변경에 실패했습니다.');history.go(-1);</script>");
            request.setAttribute("msg", "이름 변경에 실패했습니다.");
            request.setAttribute("flag", false);
            pageContext.forward("alert.jsp");
        }
    }

    else if(action.equals("DELETEID")){
        String sessionMid = (String)session.getAttribute("mid");
        memberDTO.setMid(sessionMid);

        boolean result = memberDAO.delete(memberDTO);

        if(result){
            session.invalidate();  // 모든 세션 초기화
            //out.println("<script>alert('회원탈퇴가 완료되었습니다.');location.href='main.jsp';</script>");
            request.setAttribute("msg", "회원탈퇴가 완료되었습니다.");
            request.setAttribute("flag", true);
            request.setAttribute("url", "main.jsp");
            pageContext.forward("alert.jsp");
        }
        else {
            //out.println("<script>alert('회원탈퇴에 실패했습니다.');history.go(-1);</script>");
            request.setAttribute("msg", "회원탈퇴에 실패했습니다.'");
            request.setAttribute("flag", false);
            pageContext.forward("alert.jsp");
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

    else if(action.equals("UPDATECNT")){
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        boardDTO.setBnum(bnum);
        boardDTO.setCondition("UPDATE_CNT");
        boardDAO.update(boardDTO);
        boardDTO.setCondition("SELECTONE");
        BoardDTO result = boardDAO.selectOne(boardDTO);

        request.setAttribute("board", result);

        replyDTO.setBnum(bnum);
        ArrayList<ReplyDTO> replyList = replyDAO.selectAll(replyDTO);
        request.setAttribute("replyList", replyList);

        pageContext.forward("view.jsp");
    }


    else if(action.equals("DELETE")){
        // 게시글 번호 받아오기
        int bnum = Integer.parseInt(request.getParameter("bnum"));

        // 현재 로그인한 사용자 확인
        String currentUser = (String)session.getAttribute("mid");

        // 게시글 정보 조회
        boardDTO.setBnum(bnum);
        boardDTO.setCondition("SELECTONE");
        BoardDTO board = boardDAO.selectOne(boardDTO);

        // 작성자와 현재 사용자가 같은지 확인
        if(board != null && board.getWriter().equals(currentUser)) {
            // 삭제 실행
            boolean result = boardDAO.delete(boardDTO);

            if(result) {
                //out.println("<script>alert('게시글이 성공적으로 삭제되었습니다.');location.href='main.jsp';</script>");
                request.setAttribute("msg", "게시글이 성공적으로 삭제되었습니다.");
                request.setAttribute("flag", true);
                request.setAttribute("url", "main.jsp");
                pageContext.forward("alert.jsp");
            } else {
                //out.println("<script>alert('게시글 삭제에 실패했습니다.');history.go(-1);</script>");
                request.setAttribute("msg", "게시글 삭제에 실패했습니다.");
                request.setAttribute("flag", false);
                pageContext.forward("alert.jsp");
            }
        } else {
            out.println("<script>alert('삭제 권한이 없습니다.');history.go(-1);</script>");
            request.setAttribute("msg", "삭제 권한이 없습니다.");
            request.setAttribute("flag", false);
            pageContext.forward("alert.jsp");
        }
    }

    else if(action.equals("INSERTBOARD")){
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String writer = (String)session.getAttribute("mid");
        boardDTO.setTitle(title);
        boardDTO.setWriter(writer);
        boardDTO.setContent(content);
        boardDTO.setCondition("INSERT");
        boolean result = boardDAO.insert(boardDTO);

        if(result){
            //out.println("<script>alert('게시글이 성공적으로 등록되었습니다.');location.href='main.jsp';</script>");
            request.setAttribute("msg", "게시글이 성공적으로 등록되었습니다.");
            request.setAttribute("flag", true);
            request.setAttribute("url", "main.jsp");
            pageContext.forward("alert.jsp");
        }
        else{
            //out.println("<script>alert('게시글 등록에 실패했습니다.');history.go(-1);</script>");
            request.setAttribute("msg", "게시글 등록에 실패했습니다.");
            request.setAttribute("flag", false);
            pageContext.forward("alert.jsp");
        }
    }

    else if(action.equals("EDITFORM")){
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        boardDTO.setBnum(bnum);
        boardDTO.setCondition("SELECTONE");
        BoardDTO board = boardDAO.selectOne(boardDTO);

        // 작성자 확인
        String currentUser = (String)session.getAttribute("mid");
        if(board != null && board.getWriter().equals(currentUser)) {
            request.setAttribute("board", board);
            pageContext.forward("editform.jsp");
        } else {
            out.println("<script>alert('수정 권한이 없습니다.');history.go(-1);</script>");
            request.setAttribute("msg", "수정 권한이 없습니다.");
            request.setAttribute("flag", false);
            pageContext.forward("alert.jsp");
        }
    }

    else if(action.equals("MAINPAGE")){
        pageContext.forward("main.jsp");
    }

    else if(action.equals("UPDATE")){
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String currentUser = (String)session.getAttribute("mid");

        // 기존 게시글 정보 확인
        boardDTO.setBnum(bnum);
        boardDTO.setCondition("SELECTONE");
        BoardDTO existingBoard = boardDAO.selectOne(boardDTO);

        if(existingBoard != null && existingBoard.getWriter().equals(currentUser)) {
            // 수정 권한이 있는 경우
            boardDTO.setTitle(title);
            boardDTO.setContent(content);
            boardDTO.setCondition("UPDATE_CONTENT");

            boolean result = boardDAO.update(boardDTO);

            if(result) {
                //out.println("<script>alert('게시글이 성공적으로 수정되었습니다.');location.href='controller.jsp?action=UPDATECNT&bnum=" + bnum + "';</script>");
                request.setAttribute("msg", "게시글이 성공적으로 수정되었습니다.");
                request.setAttribute("flag", true);
                request.setAttribute("url", "controller.jsp?action=UPDATECNT&bnum=" + bnum);
                pageContext.forward("alert.jsp");
            } else {
                //out.println("<script>alert('게시글 수정에 실패했습니다.');history.go(-1);</script>");
                request.setAttribute("msg", "게시글 수정에 실패했습니다.");
                request.setAttribute("flag", false);
                pageContext.forward("alert.jsp");
            }
        } else {
            out.println("<script>alert('수정 권한이 없습니다.');history.go(-1);</script>");
        }
    }

    else if(action.equals("ADDCOMMENT")){
        String content = request.getParameter("content");
        String writer = (String)session.getAttribute("mid");
        int bnum = Integer.parseInt(request.getParameter("bnum"));

        // 디버깅 로그
        System.out.println("댓글 등록 시도 - 내용: " + content + ", 작성자: " + writer + ", 게시글번호: " + bnum);

        replyDTO.setContent(content);
        replyDTO.setWriter(writer);
        replyDTO.setBnum(bnum);

        boolean result = replyDAO.insert(replyDTO);
        System.out.println("댓글 등록 결과: " + result);

        if(result){
            response.sendRedirect("controller.jsp?action=SELECTONE&bnum=" + bnum);
        }
        else{
            //out.println("<script>alert('댓글 등록에 실패했습니다.');history.go(-1);</script>");
            request.setAttribute("msg", "댓글 등록에 실패했습니다.");
            request.setAttribute("flag", false);
            pageContext.forward("alert.jsp");
        }
    }



    else if(action.equals("SEARCH")){
        String searchCondition = request.getParameter("searchCondition");
        String searchKeyword = request.getParameter("searchKeyword");

        boardDTO.setCondition(searchCondition);

        if(searchCondition.equals("SELECTALL_SEARCH_TITLE")){
            boardDTO.setTitle(searchKeyword);
        }
        else if(searchCondition.equals("SELECTALL_SEARCH_WRITER")){
            boardDTO.setWriter(searchKeyword);
        }

        ArrayList<BoardDTO> boardList = boardDAO.selectAll(boardDTO);
        request.setAttribute("boardList", boardList);
        pageContext.forward("main.jsp");
    }

    else if(action.equals("SELECTONE")){
        int bnum = Integer.parseInt(request.getParameter("bnum"));

        boardDTO.setBnum(bnum);

        boardDTO.setCondition("SELECTONE");
        BoardDTO board = boardDAO.selectOne(boardDTO);
        request.setAttribute("board", board);
        replyDTO.setBnum(bnum);

        ArrayList<ReplyDTO> replyList = replyDAO.selectAll(replyDTO);
        request.setAttribute("replyList", replyList);

        pageContext.forward("view.jsp");
    }

    else if(action.equals("DELETEREPLY")){
        // 번호 파라미터로 받아오기
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        int rnum = Integer.parseInt(request.getParameter("rnum"));

        // 게시글 정보 설정
        boardDTO.setBnum(bnum);
        boardDTO.setCondition("SELECTONE");
        BoardDTO board = boardDAO.selectOne(boardDTO);
        request.setAttribute("board", board);

        // 삭제할 댓글 정보 설정
        replyDTO.setBnum(bnum);
        replyDTO.setRnum(rnum);

        // 댓글 삭제 실행
        boolean flag = replyDAO.delete(replyDTO);

        // 삭제 후 해당 게시글의 댓글 목록을 다시 가져옴
        ArrayList<ReplyDTO> replyList = replyDAO.selectAll(replyDTO);
        request.setAttribute("replyList", replyList);

        pageContext.forward("view.jsp");
    }

    else if (action.equals("EDITREPLY")) {
        String content = request.getParameter("content");
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        int rnum = Integer.parseInt(request.getParameter("rnum"));

        // 수정할 댓글 정보 설정
        replyDTO.setBnum(bnum);
        replyDTO.setRnum(rnum);
        replyDTO.setContent(content);

        boolean flag = replyDAO.update(replyDTO);

        // 게시글 상세 페이지 이동
        response.sendRedirect("controller.jsp?action=SELECTONE&bnum=" + bnum);
    }

    else if (action.equals("EDITREPLYFORM")) {
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        int rnum = Integer.parseInt(request.getParameter("rnum"));

        // 게시글 정보 설정
        boardDTO.setBnum(bnum);
        boardDTO.setCondition("SELECTONE");
        BoardDTO board = boardDAO.selectOne(boardDTO);
        request.setAttribute("board", board);

        // 수정할 댓글 정보 가져오기
        replyDTO.setBnum(bnum);
        replyDTO.setRnum(rnum);

        // 댓글 목록 가져오기
        ArrayList<ReplyDTO> replyList = replyDAO.selectAll(replyDTO);
        request.setAttribute("replyList", replyList);

        // 수정할 댓글 번호 설정
        request.setAttribute("editRnum", rnum);

        pageContext.forward("view.jsp");
    }

%>