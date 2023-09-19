<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id="section">
  <table>
    <tr>
      <th>id</th>
      <td>${board.id}</td>
    <tr>
      <th>writer</th>
      <td>${board.boardWriter}</td>
    </tr>
    <tr>
      <th>date</th>
      <td>${board.createdAt}</td>
    </tr>
    <tr>
      <th>hits</th>
      <td>${board.boardHits}</td>
    </tr>
    <tr>
      <th>title</th>
      <td>${board.boardTitle}</td>
    </tr>
    <tr>
      <th>contents</th>
      <td>${board.boardContents}</td>
    </tr>
      <c:if test="${board.boardFileAttached == 1}">
       <tr>
        <th>image</th>
          <td>
           <c:forEach items="${boardFileList}" var="boardFile">
            <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName1}"
               alt="" width="100" height="100">
            </c:forEach>
          </td>
       </tr>
    </c:if>
  </table>
    <c:if test="${board.boardWriter == sessionScope.loginEmail}">
      <button class="btn btn-primary" onclick="board_update()">수정</button>
      <button class="btn btn-danger" onclick="board_delete()">삭제</button>
    </c:if>

  <a href="/board/list">목록으로 돌아가기</a>
</div>
<%@include file="../component/footer.jsp" %>
</body>
<script>
  const board_update = () => {
    const id = '${board.id}';
    location.href = "/board/update?id=" + id;
  }
  const board_delete = () => {
    const id = '${board.id}';
    location.href = "/board/delete?id=" + id;
  }
</script>
</html>