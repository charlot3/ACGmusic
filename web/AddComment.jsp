<%--
  Created by IntelliJ IDEA.
  User: Hanayo
  Date: 2017/6/15
  Time: 下午9:12
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
    String geta = (String) session.getAttribute("loginuser");
    String name1 = request.getParameter("username");
    String get_id = (String) session.getAttribute("user_id");
    String name2 = request.getParameter("songid");
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

    String sql1 = "select max(id) from comment";
    ResultSet rs = statement.executeQuery(sql1);

    while (rs.next()) {
        String a = rs.getString(1);
        int b = Integer.valueOf(a).intValue() + 1;
        Statement statement1 = connection.createStatement();
        String sql = "insert into comment(id,txt,author,song_id) values('" + b + "','" + name1 + "','" + geta + "','" + name2 + "')";
        //out.print(sql);
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
