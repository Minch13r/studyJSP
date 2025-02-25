<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시글 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">게시글 작성</h3>
                </div>
                <div class="card-body">
                    <form action="controller.jsp" method="post">
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="title" name="title" required placeholder="제목을 입력해주세요">
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea class="form-control" id="content" name="content" rows="10" required placeholder="내용을 입력해주세요"></textarea>
                        </div>
                        <div class="d-grid gap-2">
                            <input type="hidden" name="action" value="INSERTBOARD">
                            <button type="submit" class="btn btn-primary">글 작성하기</button>
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