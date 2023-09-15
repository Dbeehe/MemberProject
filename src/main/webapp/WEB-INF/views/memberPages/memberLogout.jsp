<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<form action="/member/logout" method="post">
  <input type="text" name="memberPassword" placeholder="비밀번호입력">
  <input type="submit" value="로그아웃">
</form>
<%@include file="component/footer.jsp" %>
</body>
</html>
