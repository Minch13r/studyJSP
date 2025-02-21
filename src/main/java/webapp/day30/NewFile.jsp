<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니 과제</title>
</head>
<body>
<!-- form의 필수속성은 action임 기억하기-->
<form action="NewFile1.jsp" method="POST">
    <!-- 사용자에게 구매가능한 상품목록을 보여줌 -->
    <select name="product">
        <option>사과</option>
        <option>바나나</option>
        <option>키위</option>
    </select>
    <!-- 사용자가 장바구니에 상품을 추가할 수 있음 -> NewFile1.jsp로 이동-->
    <input type="submit" value="장바구니에 상품추가">
</form>
<!-- 결제하기를 누르면, NewFile2.jsp로 이동 -->
<a href="NewFile2.jsp">결제하기</a>

</body>
</html>