<%@ page import="calc.CartItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean class="calc.CalcBean3" id="calc" scope="session"/>
<jsp:setProperty name="calc" property="*"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니 시스템</title>
</head>
<body>
<%
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("action") != null) {
            if (request.getParameter("action").equals("addToCart")) {
                calc.addToCart();
            }
        }
    }
%>
<form action="" method="post">
    <p>1,2,3 번 중에 선택해주세요.</p>
    <select name="fruit">
        <option value="사과">1. 사과 1000원</option>
        <option value="바나나">2. 바나나 2000원</option>
        <option value="키위">3. 키위 500원</option>
    </select>

    <p>몇개 구매할건지 입력해주세요.</p>
    <input type="number" name="quantity" min="1">
    <input type="hidden" name="action" value="addToCart">
    <input type="submit" value="장바구니에 담기">
</form>

<hr>

<h2>장바구니 목록</h2>
<table border="1">
    <tr>
        <th>과일</th>
        <th>수량</th>
        <th>가격</th>
        <th>총액</th>
    </tr>
    <%
        for(CartItem item : calc.getCartItems()) {
    %>
    <tr>
        <td><%= item.getFruit() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getPrice() %>원</td>
        <td><%= item.getTotalPrice() %>원</td>
    </tr>
    <%
        }
    %>
    <tr>
        <td>총 결제금액</td>
        <td><%= calc.getCartTotal() %>원</td>
    </tr>
</table>

</body>
</html>
