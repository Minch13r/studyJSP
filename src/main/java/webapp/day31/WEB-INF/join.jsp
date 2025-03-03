<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
</script>
<div id="box" class="container mt-5">
    <h1 class="text-center mb-4">회원가입</h1>
    <form action="controller.jsp" method="POST">
        <table class="table table-bordered">
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" name="mid" class="form-control" required
                           placeholder="아이디를 입력하세요">
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" name="password" class="form-control" required
                           placeholder="비밀번호를 입력하세요">
                </td>
            </tr>
            <tr>
                <td>이름</td>
                <td>
                    <input type="text" name="name" class="form-control" required placeholder="홍길동">
                    <div class="invalid-feedback" id="phoneError"></div>
                </td>
            </tr>
            <tr>
            <td colspan="2" class="text-end">
                <button type="button" class="btn btn-secondary" onclick="location.href='main.jsp'">
                    취소
                </button>
                <form action="controller.jsp" method="POST">
                    <input type="hidden" name="action" value="JOIN">
                    <button type="submit" class="btn btn-primary">회원가입</button>
                </form>

            </td>
            </tr>
        </table>
    </form>
</div>
</body>