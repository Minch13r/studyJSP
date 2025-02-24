<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>세션 정보 확인</title>
</head>
<body>
<div>
    <h3>현재 세션에 저장된 모든 속성 확인하기</h3>
    <%
        // 세션의 모든 속성 이름을 가져옵니다
        java.util.Enumeration<String> attributeNames = session.getAttributeNames();

        // 속성들을 하나씩 확인합니다
        while(attributeNames.hasMoreElements()) {
            String attributeName = attributeNames.nextElement();
            Object attributeValue = session.getAttribute(attributeName);
    %>
    <p>속성 이름: <%=attributeName%>, 값: <%=attributeValue%></p>
    <%
        }
    %>

    <h3>세션 기본 정보</h3>
    <p>세션 ID: <%=session.getId()%></p>
    <p>세션 생성 시간: <%=new java.util.Date(session.getCreationTime())%></p>
    <p>최근 접근 시간: <%=new java.util.Date(session.getLastAccessedTime())%></p>
    <p>세션 유효 시간: <%=session.getMaxInactiveInterval()%>초</p>
</div>
</body>
</html>
