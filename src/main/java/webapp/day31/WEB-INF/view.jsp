<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="webapp.day31.model.dao.BoardDAO" %>
<%@ page import="webapp.day31.model.dto.BoardDTO" %>
<!-- 게시판 DTO 클래스 import -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시글 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">게시글 상세보기</h3>
                </div>
                <div class="card-body">
                    <%
                        BoardDTO board = (BoardDTO)request.getAttribute("board");
                        if(board != null) {
                    %>
                    <div class="mb-3">
                        <label class="form-label fw-bold">제목</label>
                        <div class="p-2 bg-white border rounded">
                            <%= board.getTitle() %>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">작성자</label>
                        <div class="p-2 bg-white border rounded">
                            <%= board.getWriter() %>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">작성일</label>
                        <div class="p-2 bg-white border rounded">
                            <%= board.getRegdate() %>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">내용</label>
                        <div class="p-3 bg-white border rounded" style="min-height: 200px; white-space: pre-wrap;">
                            <%= board.getContent() %>
                        </div>
                    </div>
                    <% } else { %>
                    <div class="alert alert-danger">
                        게시글을 찾을 수 없습니다.
                    </div>
                    <% } %>

                    <%
                        // 현재 로그인한 사용자 정보 가져오기
                        String currentUser = (String)session.getAttribute("mid");
                    %>
                    <div class="d-grid gap-2">
                        <%
                            if(board != null && currentUser != null &&
                                    currentUser.equals(board.getWriter())) {
                        %>
                        <div class="d-flex gap-2">
                            <button type="button" class="btn btn-warning flex-grow-1"
                                    onclick="location.href='controller.jsp?action=EDITFORM&bnum=<%= board.getBnum() %>'">
                                수정하기
                            </button>
                            <button type="button" class="btn btn-danger flex-grow-1"
                                    onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='controller.jsp?action=DELETE&bnum=<%= board.getBnum() %>'">
                                삭제하기
                            </button>
                        </div>

                        <% } %>
                        <button type="button" class="btn btn-secondary" onclick="location.href='main.jsp'">
                            목록으로
                        </button>
                    </div>


                    <div class="mt-5">
                        <h4>댓글</h4>
                        <form action="controller.jsp" method="post" class="mb-4">
                            <input type="hidden" name="action" value="ADDCOMMENT">
                            <input type="hidden" name="boardId" value="<%= board != null ? board.getBnum() : "" %>">
                            <div class="mb-3">
                                <textarea class="form-control" name="comment" rows="3" placeholder="댓글을 입력해주세요"></textarea>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-primary">댓글 작성</button>
                            </div>
                        </form>

                        <div class="comment-list">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
