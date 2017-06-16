<%--
  Created by IntelliJ IDEA.
  User: charl
  Date: 2016/12/26
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");

    String get_id = (String) session.getAttribute("user_id");
    // out.print(name1+"<br>");
    // out.print(pass);
    String driverName = "com.mysql.jdbc.Driver";
    String userName = "root";
    String userPasswd = "jlc4ever";
    String dbName = "ACG";
    String tableName = "user";
    String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd;
    Class.forName(driverName).newInstance();
    Connection connection = DriverManager.getConnection(url);
    Statement statement = connection.createStatement();
    out.print("<table class=\"table table-striped table-bordered table-hover\"><thead><tr><th>我喜欢的歌手</th></tr></thead><tbody>");

    String sql1 = "select author_name from love_author where user_id=\"" + get_id + "\"";
    //out.print(sql1);
    ResultSet rs = statement.executeQuery(sql1);

    while (rs.next()) {
        out.print("<tr><td><a href=\"AuthorDetail.jsp?id=" + rs.getString(1) + "\">" + rs.getString(1) + "</a></td></tr>");

    }

    out.print("</tbody></table>");
    // String url2=request.getHeader("Referer");
    //  int checkright = 1;


    //   response.setHeader("Refresh", "0;"+url2);
    rs.close();
    statement.close();
    connection.close();

%>
</body>
</html>
