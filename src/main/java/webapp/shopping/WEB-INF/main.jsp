<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="webapp.shopping.model.dto.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
function sort() {
    // 선택된 정렬 조건
    var condition = $('#sortList').val();
    
    // 폼 데이터 직렬화 (필요한 경우, 필요한 값만 직렬화)
    var formData = $('#sortForm').serialize();  

    // Ajax 비동기 요청
    $.ajax({
        url: 'sortListServlet',  // 서블릿 URL
        type: 'GET',
        data: formData,  // 폼 데이터 전송
        success: function(response) {
            // 상품 목록을 동적으로 갱신
            $('#productList').html(response);
        },
        error: function(xhr, status, error) {
            alert("오류 발생: " + error);
        }
    });
}
</script>
</head>
<body>

<% if(session.getAttribute("userName") == null) {%>
<%--로그아웃 상태일 떄 --%>
<div id="logout">
    <form action="controller.jsp" method="POST">
    <input type="hidden" name="action" value="LOGIN">
    <table border="1">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="m_id" required></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="m_pw" required></td>
        </tr>
        <tr>
            <td colspan="2" align="right"><input type="submit" value="로그인">&nbsp;<a href="controller.jsp?action=REGPAGE" >회원가입</a></td>
        </tr>
    </table>
    </form>
</div>

<% }else{ %>
<%--로그인 상태일 떄 --%>
<div id="login">
    <table border="1">
        <%if(session.getAttribute("role").equals("admin")) {%>
        <tr>
            <td>[${role}]</td>
        </tr>
        <%} %>
        <tr>
            <td>${userName} 님 환영합니다</td>
        </tr>
        <tr>
            <td><a href="controller.jsp?action=CARTPAGE">내 장바구니</a></td>
        </tr>
        <tr>
            <td><a href="controller.jsp?action=LIKEPAGE">좋아요 목록</a></td>
        </tr>
        <%if(session.getAttribute("role").equals("admin")) {%>
        <tr>
            <td><a href="controller.jsp?action=ADDPRODUCTPAGE">상품 추가</a></td>
        </tr>
        <%} %>
        <tr>
            <td><a href="controller.jsp?action=LOGOUT">로그아웃</a></td>
        </tr>  
    </table>
</div>
<% } %>

<br><hr><br>

<div id="productList">
    <h3>상품목록</h3>
    <table border="1">
        <tr>
            <th>상품 번호</th>
            <th>상품 명</th>
            <th>가격</th>
            <th>재고</th>
            <th>등록날짜</th>
            <th>좋아요갯수</th>
        </tr>
        <%
            if(request.getAttribute("productDatas") == null) {
        %>
            <tr>
                <td colspan="5">상품이 없습니다!</td>
            </tr>
        <%
            } else {
                for(ProductDTO data : (ArrayList<ProductDTO>)request.getAttribute("productDatas")) {
        %>
            <tr>
                <td><%=data.getP_num() %></td>
                <td><a href="controller.jsp?action=PRODUCTDETAILPAGE&p_num=<%=data.getP_num() %>"><%=data.getP_name() %></a></td>
                <td><%=data.getP_price()%></td>
                <td><%=data.getP_stock() %></td>
                <td><%=data.getP_regdate() %></td>
                <td><%=data.getLikes() %></td>
            </tr>
        <%
                }
            }
        %>
    </table>
</div>

<!-- 정렬 폼 -->
<form id="sortForm" onsubmit="sort()">
    <input type="hidden" name="action" value="MAINPAGE">
    <select id="sortList" name="condition">
        <option value="SELECTALL_HEART_LANKING">인기순</option>
        <option value="SELECTALL_SEARCH_HIGH_PRICE">가격높은순</option>
        <option value="SELECTALL_SEARCH_LOW_PRICE">가격낮은순</option>
    </select>
    <input type="submit" value="정렬">
</form>

</body>
</html>
