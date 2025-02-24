    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>마이 페이지</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- 추가 스타일 -->
        <style>
            .profile-section {
                max-width: 600px;
                margin: 40px auto;
                padding: 20px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                border-radius: 10px;
            }
            .page-title {
                color: #2c3e50;
                margin-bottom: 30px;
                text-align: center;
            }
            .form-group {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body class="bg-light">
    <div class="container">
        <div class="profile-section bg-white">
            <h2 class="page-title">회원정보</h2>

            <form action="controller.jsp" method="POST">
                <input type="hidden" name="action" value="UPDATENAME">

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">아이디</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="mid"
                               value="<%=request.getAttribute("mid")%>" readonly>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">이름</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="name"
                               value="<%=request.getAttribute("name")%>" required readonly>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">가입일</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control-plaintext"
                               value="<%=request.getAttribute("regdate")%>" readonly>
                    </div>
                </div>

                <!-- mypage.jsp의 버튼 부분 수정 -->
                <div class="d-flex justify-content-end mt-4">
                    <a href="updatename.jsp" class="btn btn-primary me-2">이름변경</a>
                    <a href="controller.jsp?action=DELETEID"
                       class="btn btn-danger"
                       onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>
                </div>

            </form>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>