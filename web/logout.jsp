<%--
  Created by IntelliJ IDEA.
  User: charl
  Date: 2016/12/27
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    session.removeAttribute("loginuser");
    session.removeAttribute("roottype");
    session.removeAttribute("user_id");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

</body>
</html>
