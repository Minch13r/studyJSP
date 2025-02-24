<%@ page import="webapp.day31.model.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .table-custom {
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .btn-custom {
            margin: 5px;
        }
        .info-header {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        .button-group {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-custom">
        <table class="table table-bordered table-hover mb-0">
            <tr class="info-header">
                <td class="text-center">
                    <h4 class="mb-0"><%=session.getAttribute("userName")%>님의 정보</h4>
                </td>
            </tr>
            <tr>
                <td class="p-3">
                    <strong>이름:</strong> <%=session.getAttribute("userName")%>
                </td>
            </tr>
            <tr>
                <td class="text-center p-3">
                    <button type="button" class="btn btn-primary btn-custom" onclick="submitsign('changeName')">
                        <i class="bi bi-pencil"></i><a href="controller.jsp?action=CHANGENAME">이름변경</a>
                    </button>
                    <button type="button" class="btn btn-danger btn-custom" onclick="submitsign('deleteMember')">
                        <i class="bi bi-trash"></i><a href="controller.jsp?action=DELETEMEMBER">회원탈퇴</a>
                    </button>
                </td>
            </tr>
        </table>
    </div>

    <div class="button-group">
        <button type="button" class="btn btn-success btn-custom" onclick="location.href='main.jsp'">
            <i class="bi bi-house-door"></i> 메인화면으로 돌아가기
        </button>
    </div>
</div>

<!-- Bootstrap JS 및 Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
