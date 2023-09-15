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
<div class="section">
    <form action="/member/login" method="post">
        <input type="text" name="memberEmail" placeholder="이메일 입력">
        <input type="text" name="memberPassword" placeholder="비밀번호 입력">
        <input type="submit" value="로그인">
    </form>
</div>
<%@include file="component/footer.jsp" %>
</body>
</html>
