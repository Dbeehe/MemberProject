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
    <form action="/board/update" method="post">
        <input type="text" name="id" value="${board.id}" readonly> <br>
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly><br>
        <input type="text" name="boardTitle" placeholder="제목"><br>
        <textarea name="boardContents" cols="30" rows="10"></textarea> <br>
        <input type="submit" value="수정"><br>
    </form>
</div>

<%@include file="../component/footer.jsp" %>
</body>

</html>