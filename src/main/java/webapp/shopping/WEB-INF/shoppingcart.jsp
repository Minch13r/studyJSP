
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="webapp.shopping.model.dto.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <title>장바구니</title>
</head>
<body>
<h1>장바구니</h1>

<table border="1">
    <tr>
        <th>상품</th>
        <th>가격</th>

    </tr>

    <%
        // 세션에서 장바구니 가져오기
        ArrayList<ProductDTO> cart = (ArrayList<ProductDTO>) session.getAttribute("cart");
        //int totalPrice = 0;

        if (cart != null && !cart.isEmpty()) {
            for (ProductDTO product : cart) {

    %>
    <tr>
        <td><%= product.getP_name() %></td>
        <td><%= product.getP_price() %> 원</td>


    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="4">장바구니가 비어 있습니다.</td>
    </tr>
    <%
        }
    %>
</table>
<!-- 가격 출력 -->
<% //int totalPrice=(int)request.getAttribute("totalPrice");
    if(request.getAttribute("totalPrice")==null){ %>
<%System.out.println("장바구니페이지 로그 - totalPrice = ["+request.getAttribute("totalPrice")+"]"); %>
<h3>총 가격: 0원</h3>
<%} else{%>
<h3>총 가격: <%= request.getAttribute("totalPrice") %> 원</h3>
<%} %>

<br>
<a href="controller.jsp?action=MAINPAGE">쇼핑 계속하기</a>
</body>
</html>