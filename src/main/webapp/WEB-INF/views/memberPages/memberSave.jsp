<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
</body>
</html>
