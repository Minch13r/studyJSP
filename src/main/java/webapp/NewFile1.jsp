<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%--<!-- CalcBean02 cb = new CalcBean02()와 동일 -->--%>
<jsp:useBean class="calc.CalcBean2" id="cb"/>
<!-- cb.setXxx()와 동일-->
<jsp:setProperty property="*" name="cb"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<%
    int res=0;
    int num1 = Integer.parseInt(request.getParameter("num1"));
    int num2 = Integer.parseInt(request.getParameter("num2"));
    String op = request.getParameter("op");
    if(op.equals("+")){
        res = num1 + num2;
    }
    else if(op.equals("-")){
        res = num1 - num2;
    }
%>
<form action="" method="post">
    <input type="text" name="num1"><select name="op"><option>+</option><option>-</option><option>*</option><option>/</option></select>
    <input type="submit" value="계산">
</form>

<hr>

계산결과 : <jsp:getProperty name="res" property="cb"/>

</body>
</html>