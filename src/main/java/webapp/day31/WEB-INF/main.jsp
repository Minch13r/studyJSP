<%@ page import="webapp.day31.model.dao.MemberDAO" %>
<%@ page import="webapp.day31.model.dto.MemberDTO" %>
<%@ page import="webapp.day31.model.dto.BoardDTO" %>
<%@ page import="webapp.day31.model.dao.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
</head>
<body>
<div class="main-container">
    <% if(session.getAttribute("userName") == null){ %>
    <div class="login-box">
        <h3>로그인</h3>
        <form action="controller.jsp" method="POST" class="login-form">
            <input type="hidden" name="action" value="LOGIN">
            <div class="form-group">
                <label for="mid">아이디</label>
                <input type="text" id="mid" name="mid" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="button-group">
                <button type="submit" class="btn btn-primary">로그인</button>
                <a href="join.jsp" class="btn btn-secondary">회원가입</a>
            </div>
        </form>
    </div>

    <% } else { %>

    <div class="welcome-message">
        <%=session.getAttribute("userName")%>님, 환영합니다! :D
    </div>
    <div class="nav-buttons">
        <a href="controller.jsp?action=MYPAGE" class="btn btn-primary">마이페이지</a>
        <a href="controller.jsp?action=LOGOUT" class="btn btn-danger">로그아웃</a>
        <a href="controller.jsp" class="btn btn-success">글작성</a>
    </div>
    <% } %>

    <div class="search-section">
        <form action="controller.jsp" method="GET" class="d-flex gap-3">
            <select name="searchCondition" class="form-select" style="width: 150px;">
                <option>제목</option>
                <option>작성자</option>
            </select>
            <input type="text" name="searchKeyword" class="form-control" placeholder="검색어를 입력하세요" required>
            <button type="submit" class="btn btn-primary" style="width: 100px;">검색</button>
        </form>
    </div>

    <div class="content-box">
        <h3>글 목록</h3>
        <table class="table">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <%
                BoardDAO boardDAO = new BoardDAO();
                BoardDTO searchDTO = new BoardDTO();
                searchDTO.setCondition("SELECTALL");
                ArrayList<BoardDTO> datas = boardDAO.selectAll(searchDTO);

                if(datas.isEmpty()) {
            %>
            <tr>
                <td colspan="4" class="text-center">등록된 게시글이 없습니다.</td>
            </tr>
            <%
            } else {
                for(BoardDTO board : datas) {
            %>
            <tr>
                <td><%=board.getBnum()%></td>
                <td>
                    <a href="controller.jsp?action=BOARD_DETAIL&bnum=<%=board.getBnum()%>">
                        <%=board.getTitle()%>
                    </a>
                </td>
                <td><%=board.getWriter()%></td>
                <td><%=board.getCnt()%></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="content-box">
        <h3>신규 회원 목록</h3>
        <table class="table">
            <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>가입일</th>
            </tr>
            </thead>
            <tbody>
            <%
                MemberDAO memberDAO = new MemberDAO();
                ArrayList<MemberDTO> memberList = memberDAO.selectAll(new MemberDTO());
                for(MemberDTO member : memberList) {
            %>
            <tr>
                <td><%=member.getMid()%></td>
                <td><%=member.getName()%></td>
                <td><%=member.getRegdate()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>