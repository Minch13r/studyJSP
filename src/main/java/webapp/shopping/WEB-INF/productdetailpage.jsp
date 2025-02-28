<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.dto.ProductDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
</head>
<body>
<!-- C에서 상품번호, 이름, 가격, 재고 받아옴(로그인 한 사람은 세션에) -->
<h1>상품 상세</h1>
<%ProductDTO productDTO=(ProductDTO)request.getAttribute("productDTO"); 
System.out.println("상세페이지 로그: "+productDTO);
%>
<table border="1">
      <tr>
         <td>상품번호</td>
         <td>${productDTO.p_num}</td>
      </tr>
      <tr>
         <td>상품이름</td>
         <td>${productDTO.p_name}</td>
      </tr>
      <tr>
         <td>상품가격</td>
         <td>${productDTO.p_price}</td>
      </tr>
      <tr>
         <td>상품재고</td>
         <td>${productDTO.p_stock}</td>
      </tr>
</table>
      <%if(session.getAttribute("userName")!=null){ %>
      
      <form action="controller.jsp" method="post">
      <input type="hidden" name="action" value="ADDCART">
      <input type="hidden" name="p_num" value="${productDTO.p_num}">
      <table border="1">
      <tr>
      <td><input type="submit" value="장바구니 추가"></td>
      </tr>
      </table>
      </form>
      
      <form action="controller.jsp" method="post">
      <input type="hidden" name="action" value="LIKEPRODUCT">
      <input type="hidden" name="p_num" value="${productDTO.p_num}">
      <table border="1">
      <tr>
      <td><input type="submit" value="좋아요"></td>
      </tr>
      </table>
      </form>
      <%} %>
   
<h5><a href="controller.jsp?action=MAINPAGE">메인으로</a></h5>

</body>
</html>