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
    console.log("로그 [${url}]");
    console.log("로그 [${flag}]");

    alert('${msg}');
    if(${flag}){
        var url = "${url}";
        location.href = url;
    }
    else{
        history.go(-1);
    }

</script>

</body>
</html>