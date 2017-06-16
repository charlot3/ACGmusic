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
    try {
        String name1 = request.getParameter("username");
        String pass = request.getParameter("password");

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
        String sql = "SELECT * FROM " + tableName + " where username='" + name1 + "'";
        ResultSet rs = statement.executeQuery(sql);
        String url2 = request.getHeader("Referer");
        int checkright = 1;
        while (rs.next()) {
            String roottype = rs.getString(4);
            String user_id = rs.getString(1);
            String passWD = rs.getString(3);
            if (passWD.equals(pass)) {
                out.print("用户登录成功");
                checkright = 0;
                session.setAttribute("loginuser", name1);
                session.setAttribute("roottype", roottype);
                session.setAttribute("user_id", user_id);
                response.sendRedirect(url2);
            }
            rs.next();
        }

        if (checkright == 1) {
            session.removeAttribute("loginuser");
            session.removeAttribute("roottype");
            session.removeAttribute("user_id");
            session.invalidate();
            out.print("你可能输入错了密码或者用户名，再试试看吧。\n");
            response.setHeader("Refresh", "3;" + url2);
        }
        rs.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        //    out.println(e.getMessage());
        session.removeAttribute("loginuser");
        session.removeAttribute("roottype");
        session.removeAttribute("user_id");
        session.invalidate();
        out.print("你可能输入错了密码或者用户名，再试试看吧。\n");
        String url1 = request.getHeader("Referer");
        response.setHeader("Refresh", "3;" + url1);
    }
%>
</body>
</html>
