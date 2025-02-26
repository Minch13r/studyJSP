<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>알림창</title>
</head>
<body>

<script type="text/javascript">
    <!-- 로그 -->
    console.log("로그 [${url}]");
    console.log("로그 [${flag}]");
    <!-- 메세지 alert -->
    alert('${msg}');
    <!-- true일 때 -->
    if(${flag}){
        var url = "${url}";
        location.href = url;
    }
    <!-- false일 때 -->
    else{
        history.go(-1);
    }

</script>

</body>
</html>