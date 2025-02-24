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
    <% if(session.getAttribute("userName") != null) { %>
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
        <form action="controller.jsp" method="GET" class="search-form">
            <select name="searchCondition" class="form-select">
                <option>제목</option>
                <option>작성자</option>
            </select>
            <input type="text" name="searchKeyword" class="form-control"
                   placeholder="검색어를 입력하세요" required>
            <button type="submit">검색</button>
        </form>
    </div>

    <div class="content-box">
        <h3>글 목록</h3>
        <!-- 글 목록 내용 -->
    </div>

    <div class="content-box">
        <h3>신규 회원 목록</h3>
        <!-- 신규 회원 목록 내용 -->
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
