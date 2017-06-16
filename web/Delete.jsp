<%--
  Created by IntelliJ IDEA.
  User: charl
  Date: 2016/12/26
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.Statement" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String id = request.getParameter("id");
    String pid = request.getParameter("pid");
    String type = request.getParameter("type");
//    out.print(pid+"&nbsp;"+type);


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

    if (type.equals("1")) {
        String sql1 = "DELETE FROM personal_song WHERE music_id = \"" + id + "\"AND pid = \"" + pid + "\"";
        statement.executeUpdate(sql1);
    } else {
        String sql1 = "DELETE FROM personal_song WHERE pid = \"" + pid + "\"";
        statement.executeUpdate(sql1);
        String sql2 = "DELETE FROM personal_song_list WHERE id = \"" + id + "\"";
        statement.executeUpdate(sql2);
    }
    String url2 = request.getHeader("Referer");
    //  int checkright = 1;


    response.setHeader("Refresh", "0;" + url2);
    statement.close();
    connection.close();

%>
</body>
</html>
