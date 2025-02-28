<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.dto.ProductDTO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 목록</title>
</head>
<body>
	<a href="controller.jsp?action=MAINPAGE"><img alt="로고 이미지" src="images/logo.png"></a>
	
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>재고</th>
			<th>좋아요갯수</th>
			<th>등록날짜</th>	
		</tr>
		<% if(request.getAttribute("likeList") == null) { %>
			<tr>
				<td>좋아하는 상품이 없습니다!</td>
			</tr>
		<% } else { for(ProductDTO data:(ArrayList<ProductDTO>)request.getAttribute("likeList")){ %>
			<tr>
				<td><%=data.getP_num() %></td>
				<td><a href="controller.jsp?action=PRODUCTDETAILPAGE&p_num=<%=data.getP_num() %>"><%=data.getP_name() %></a></td>
				<td><%=data.getP_price()%></td> 
				<td><%=data.getP_description()%></td> 
				<td><%=data.getP_stock() %></td>
				<%--<td><%=data.getP_likes() %></td> --%>
				<td><%=data.getP_regdate() %></td>
			</tr>
		<% }
		}%>
	</table>
</body>
</html>

<%--
	메인으로 돌아가기 링크(controller/action=메인페이지)
	if controller 에서 받아온 목록이 null:	
		아직 좋아요를 누른적 없습니다!
	else for (목록):
		테이블
			상품번호
			상품명
			가격
			재고
			좋아요 갯수
			
		상품명 클릭가능(링크 action=상품디테일페이지 & 상품번호)
--%>