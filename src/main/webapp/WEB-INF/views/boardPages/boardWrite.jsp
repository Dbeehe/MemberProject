<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <form action="/board/write" method="post" enctype="multipart/form-data">
    <input type="text" name="boardWriter" value="${sessionScope.loginEmail}"><br>
    <input type="text" name="boardTitle" placeholder="제목"><br>
    <input type="text" name="memberPassword" placeholder="비밀번호 입력"><br>
    <textarea name="boardContents" cols="30" rows="10"></textarea> <br>
    <input type="file" name="boardFile" multiple><br>
    <input type="submit" value="글쓰기"><br>
  </form>
</div>
<%@include file="component/footer.jsp" %>
</body>
</html>
