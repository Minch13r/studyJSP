<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니 과제</title>
</head>
<body>

<!-- 결제화면 -->
<h1> 결제 화면 </h1>
<!-- 그동안 담아두었던 장바구니 속 상품들이 모두 출력됨 -->
<%
    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        out.println("결제할 상품이 없습니다! <br>");
    } else {
        for (String product : cart) {
            out.println(product + " <br>");
        }
    }
%>

</body>
</html>