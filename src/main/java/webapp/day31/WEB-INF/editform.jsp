<%@ page import="webapp.day31.model.dto.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시물 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">게시글 수정</h3>
                </div>
                <div class="card-body">
                    <%
                        BoardDTO board = (BoardDTO)request.getAttribute("board");
                        if(board == null) {
                            response.sendRedirect("main.jsp");
                            return;
                        }
                    %>
                    <form action="controller.jsp" method="post">
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="title" name="title" value="<%= board.getTitle() %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea class="form-control" id="content" name="content" rows="10" required><%= board.getContent() %></textarea>
                        </div>
                        <div class="d-grid gap-2">
                            <input type="hidden" name="action" value="UPDATE">
                            <input type="hidden" name="bnum" value="<%= board.getBnum() %>">
                            <button type="submit" class="btn btn-primary">글 수정하기</button>
                            <button type="button" class="btn btn-secondary" onclick="location.href='main.jsp'">목록으로</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>