<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>signup.jsp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/SignUpStyle.css" rel="stylesheet">
</head>
<body>
<div id="box" class="container mt-5">
    <h1 class="text-center mb-4">회원가입</h1>
    <form id="SignUpForm" action="signupProcess.jsp" method="post">
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
                    <input type="password" name="mpw" class="form-control" required
                           placeholder="비밀번호를 입력하세요">
                </td>
            </tr>
            <!-- HTML 수정 부분 -->
            <tr>
                <td>이메일</td>
                <td>
                    <div class="d-flex align-items-center">
                        <input type="text" name="emailId" class="form-control me-2" required
                               placeholder="이메일을 입력하세요" style="width: 60%;" pattern="[a-zA-Z0-9_-]+">
                        <span class="mx-2">@</span>
                        <select name="emailDomain" class="form-control" style="width: 35%;">
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                    </div>
                    <div class="invalid-feedback" id="emailError"></div>
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>
                    <input type="tel" name="phoneNumber" class="form-control" required
                           placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
                    <div class="invalid-feedback" id="phoneError"></div>
                </td>
            </tr>

            <td colspan="2" class="text-end">
                    <button type="button" class="btn btn-secondary" onclick="location.href='index.jsp'">
                        취소
                    </button>
                    <button type="button" class="btn btn-primary" onclick="SignUp('signup')">
                        회원가입
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="js/SignUp.js"></script>
</body>
</html>
