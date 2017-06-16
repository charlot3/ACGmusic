<%--
  Created by IntelliJ IDEA.
  User: Hanayo
  Date: 2017/6/13
  Time: 下午3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%
    //加载驱动程序
    String driverName = "com.mysql.jdbc.Driver";
//数据库信息
    String userName = "root";
//密码
    String userPasswd = "jlc4ever";
//数据库名
    String dbName = "ACG";
//表名
    String tableName = "music";
//将数据库信息字符串连接成为一个完整的url（也可以直接写成url，分开写是明了可维护性强）

    String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection(url);
    Statement stmt = conn.createStatement();
    Statement stmt1 = conn.createStatement();
    String sql = "SELECT song_id,song_name,author FROM " + tableName + " WHERE author LIKE \"%水瀬いのり%\"";

    ResultSet rs = stmt.executeQuery(sql);

    while (rs.next()) {
        out.print("<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=100 height=100 src=\"//music.163.com/outchain/player?type=2&id=" + rs.getString(1) + "&auto=0&height=100\"></iframe>\n" + "<br>");
        out.print("<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=1000 height=100 src=\"//music.163.com/outchain/player?type=2&id=" + rs.getString(1) + "&auto=0&height=100\"></iframe>\n" + "<br>");

        out.print("|");
        out.print(rs.getString(2) + " ");
        out.print("|");
        out.print(rs.getString(3) + "<br>");
        int i = 0;
        String sql1 = "SELECT * FROM comment WHERE song_id = \"" + rs.getString(1) + "\"";
        ResultSet rs1 = stmt1.executeQuery(sql1);
        while (rs1.next()) {
            i++;
            out.print(i);
            out.print(rs1.getString(3) + "<br>");
        }
        rs1.close();

        out.print("<br>");
    }
    out.print("<br>");
    out.print("ok， Database Query Successd！");
    rs.close();


    stmt.close();
    conn.close();
%>
