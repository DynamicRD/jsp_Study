<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page buffer="1kb" autoFlush="true" %>
<html>
<head><title>autoFlush 속성값 false 예제</title></head>
<body>
<!-- 이부분에서 4KB이상의 데이터가 발생 -->
<% for (int i = 0 ; i < 1000 ; i++) { %>
1234
<% } %>
</body>
</html>