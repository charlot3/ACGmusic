<%--
  Created by IntelliJ IDEA.
  User: charl
  Date: 2016/12/26
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String uid = request.getParameter("uid");
    String sid = request.getParameter("sid");
    String type = request.getParameter("type");
    out.print(uid + "&nbsp;" + sid + "&nbsp;" + type);


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
    if (type.equals("1")) {
        Statement statement = connection.createStatement();

        String sql1 = "SELECT * FROM love_song WHERE user_id = \"" + uid + "\" AND song_id=\"" + sid + "\"";
        ResultSet rs = statement.executeQuery(sql1);
        if (rs.next()) {
            String sql12 = "DELETE FROM love_song WHERE user_id=" + uid + " AND song_id= " + sid;
            statement.executeUpdate(sql12);
        } else {
            String sql11 = "INSERT INTO love_song(user_id, song_id) values('" + uid + "','" + sid + "')";
            statement.executeUpdate(sql11);
        }
        statement.close();
    }
    if (type.equals("2")) {
        Statement statement = connection.createStatement();

        String sql1 = "SELECT * FROM love_playlist WHERE user_id = \"" + uid + "\" AND playlist_id=\"" + sid + "\"";
        ResultSet rs = statement.executeQuery(sql1);
        if (rs.next()) {
            String sql12 = "DELETE FROM love_playlist WHERE user_id=" + uid + " AND playlist_id= " + sid;
            statement.executeUpdate(sql12);
        } else {
            String sql11 = "INSERT INTO love_playlist(user_id, playlist_id) values('" + uid + "','" + sid + "')";
            statement.executeUpdate(sql11);
        }
        statement.close();
    }
    if (type.equals("3")) {
        Statement statement = connection.createStatement();

        String sql1 = "SELECT * FROM love_author WHERE user_id = \"" + uid + "\" AND author_name=\"" + sid + "\"";
        ResultSet rs = statement.executeQuery(sql1);
        if (rs.next()) {
            String sql12 = "DELETE FROM love_author WHERE user_id=" + uid + " AND author_name= \"" + sid + "\"";
            statement.executeUpdate(sql12);
        } else {
            String sql11 = "INSERT INTO love_author(user_id, author_name) values('" + uid + "','" + sid + "')";
            statement.executeUpdate(sql11);
        }
        statement.close();
    }
    if (type.equals("4")) {
        Statement statement = connection.createStatement();

        String sql1 = "SELECT * FROM personal_song WHERE pid = \"" + uid + "\" AND music_id=\"" + sid + "\"";
        ResultSet rs = statement.executeQuery(sql1);
        if (rs.next()) {

        } else {
            String sql11 = "INSERT INTO personal_song(pid, music_id) values('" + uid + "','" + sid + "')";
            statement.executeUpdate(sql11);
        }
        statement.close();
    }
    String url2 = request.getHeader("Referer");
    response.setHeader("Refresh", "0;" + url2);
    connection.close();
/**/
%>
</body>
</html>
