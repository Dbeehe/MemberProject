<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>

<div class="section">
    <form action="/member/update" method="post">
        <input type="text" name="memberEmail" value="${sessionScope.loginEmail}" readonly><br><br>
        <input type="text" name="memberName" placeholder="이름 입력"><br>
        <input type="text" name="memberMobile" placeholder="전화번호 입력"><br>
        <input type="submit" value="정보수정">
    </form>
</div>

<%@include file="../component/footer.jsp" %>
</body>

</html>