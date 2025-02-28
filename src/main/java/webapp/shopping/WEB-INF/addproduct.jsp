<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>상품 등록</title>
</head>
<body>
<h1>상품 등록 폼</h1>
<form action="controller.jsp" method="POST">
    <input type="hidden" name="action" value="ADDPRODUCT">
    <table border="1">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="p_name" required></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><input type="text" name="p_description" required></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="number" name="p_price" required></td>
        </tr>
        <tr>
            <td>수량</td>
            <td><input type="number" name="p_stock" required></td>
        </tr>
    </table>
    <br>
    <button type="submit">상품 등록</button>
    <button type="button" onclick="location.href='controller.jsp?action=MAINPAGE'">취소</button>
</form>
</body>
</html>
