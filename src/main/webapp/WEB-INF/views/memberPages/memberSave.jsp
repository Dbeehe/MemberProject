<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<div class="section">
    <form action="/member/save" method="post" enctype="multipart/form-data">
        <input type="text" name="memberEmail" placeholder="이메일 입력"><br>
        <input type="text" name="memberPassword" placeholder="비밀번호 입력"><br>
        <input type="text" name="memberName" placeholder="이름 입력"><br>
        <input type="text" name="memberMobile" placeholder="전화번호 입력"><br>
        <input type="file" name="memberProfile"><br>
        <input type="submit" value="회원가입">
    </form>
</div>
<%@include file="component/footer.jsp" %>

</body>
</html>
