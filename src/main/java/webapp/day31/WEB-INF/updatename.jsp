<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이름 변경</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .update-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .page-title {
            color: #2c3e50;
            margin-bottom: 30px;
            text-align: center;
        }
        .current-name {
            background-color: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="bg-light">
<div class="container">
    <div class="update-form bg-white">
        <h2 class="page-title">이름 변경</h2>

        <div class="current-name">
            <p class="mb-1">현재 이름</p>
            <strong><%=session.getAttribute("userName")%></strong>
        </div>

        <form action="controller.jsp" method="POST" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="UPDATENAME">
            <input type="hidden" name="mid" value="<%=session.getAttribute("mid")%>">

            <div class="mb-3">
                <label for="newName" class="form-label">새로운 이름</label>
                <input type="text" class="form-control" id="newName" name="name"
                       placeholder="새로운 이름을 입력하세요" required>
                <div class="form-text">2자 이상 10자 이하로 입력해주세요.</div>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">이름 변경하기</button>
                <a href="controller.jsp?action=MYPAGE" class="btn btn-secondary">취소</a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function validateForm() {
        var newName = document.getElementById('newName').value;
        if(newName.length < 2 || newName.length > 10) {
            alert('이름은 2자 이상 10자 이하로 입력해주세요.');
            return false;
        }

        if(newName === '<%=session.getAttribute("userName")%>') {
            alert('현재 이름과 동일합니다. 다른 이름을 입력해주세요.');
            return false;
        }

        return confirm('이름을 변경하시겠습니까?');
    }
</script>
</body>
</html>