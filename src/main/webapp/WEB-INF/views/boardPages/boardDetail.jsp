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
  <button onclick="board_list()">목록</button>
  <button onclick="board_update()">수정</button>
  <button onclick="board_delete()">삭제</button>
</div>
<%@include file="../component/footer.jsp" %>
</body>
</html>