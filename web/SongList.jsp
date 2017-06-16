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
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String name1 = request.getParameter("username");
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

    String sql1 = "select max(id) from personal_song_list";
    ResultSet rs = statement.executeQuery(sql1);

    while (rs.next()) {
        String a = rs.getString(1);
        int b = Integer.valueOf(a).intValue() + 1;
        Statement statement1 = connection.createStatement();
        String sql = "insert into personal_song_list(id,title,user_id) values('" + b + "','" + name1 + "','" + get_id + "')";
        statement1.executeUpdate(sql);
        statement1.close();
    }


    String url2 = request.getHeader("Referer");
    //  int checkright = 1;


    response.setHeader("Refresh", "0;" + url2);
    rs.close();
    statement.close();
    connection.close();

%>
</body>
</html>
