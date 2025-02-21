<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니(세션) 과제</title>
</head>
<body>
<!-- 장바구니에 상품을 추가 -->
<!-- 세션에 저장된 장바구니 배열에 사용자가 요청정보로 보낸 String 추가 -->
<%
    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<String>();
        session.setAttribute("cart", cart);
    }
    String product = request.getParameter("product");
    cart.add(product);
%>

<!-- NewFile.jsp로 다시 돌아가게 해줄예정 -->
<script type="text/javascript">
    alert('<%=product%>가 장바구니에 추가되었습니다!')
    // 이전페이지로 이동 다른 방법
    // 새로운 요청
    location.href = "NewFile.jsp";
    // 방문했던 기록 중에 뒤로가달라는 내용이므로 기존화면으로 돌아가기
    // history.go(-1);
</script>
</body>
</html>