<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/signupstyle.css" rel="stylesheet">
</head>
<body>
<div id="box" class="container mt-5">
    <h1 class="text-center mb-4">회원가입</h1>
    <form id="signupform" action="controller.jsp" method="POST">
        <table class="table table-bordered">
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" name="m_id" class="form-control" required
                           placeholder="아이디를 입력하세요">
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" name="m_pw" class="form-control" required
                           placeholder="비밀번호를 입력하세요">
                </td>
            </tr>
            <tr>
                <td>이름</td>
                <td>
                    <input type="text" name="m_name" class="form-control" required
                           placeholder="이름을 입력하세요">
                </td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <div class="d-flex align-items-center">
                        <input type="text" name="m_mail" class="form-control me-2" required
                               placeholder="이메일을 입력하세요" style="width: 60%;" pattern="[a-zA-Z0-9._-]+">
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
                    <input type="tel" name="m_phone" class="form-control" required
                           placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
                    <div class="invalid-feedback" id="phoneError"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-end">
                    <button type="button" class="btn btn-secondary" onclick="location.href='controller.jsp?action=MAINPAGE'">
                        취소
                    </button>
                    <input type="hidden" name="action" value="JOIN">
                    <!-- <button type="button" class="btn btn-primary" onclick="SignUp('signup')"> -->
                    <input type="submit" class="btn btn-primary" onclick="SignUp('signup')" value="회원가입">
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="js/signup.js"></script>
</body>
</html>
