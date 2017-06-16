<%--
  Created by IntelliJ IDEA.
  User: charl
  Date: 2016/12/25
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Title</title>
</head>
<body style="font-family: Microsoft YaHei; font-size: 20px;">

<%
    String name1 = request.getParameter("Name");

    String password = request.getParameter("Password");

    String Info = request.getParameter("Info");

    try {
        String driverName = "com.mysql.jdbc.Driver";
//数据库信息
        String userName = "root";
//密码
        String userPasswd = "jlc4ever";
//数据库名
        String dbName = "ACG";
//表名
        String tableName = "user";
//将数据库信息字符串连接成为一个完整的url（也可以直接写成url，分开写是明了可维护性强）

        String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url);
        //Statement stmt = conn.createStatement();
        Statement statement = conn.createStatement();
        Statement statement1 = conn.createStatement();
        String sql = "SELECT max(id)+1 FROM " + tableName;
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            String a = rs.getString(1);
            String b = "insert into user(id,username,password,roottype,description) values('" + a + "','" + name1 + "','" + password + "'," + "0" + ",'" + Info + "')";

            try {
                statement1.executeUpdate(b);
            } catch (SQLException e) {
                e.printStackTrace();
            }


        }

        // statement.executeUpdate("delete from id where username='"+name1+"'");
        //
              /*
        while(rs.next()) {
            out.print(rs.getString(1) + " ");
            //  rs.next();
            out.print(rs.getString(2) + "<br>");
        }
  */
        rs.close();
        statement.close();
        conn.close();
    } catch (Exception e) {
        out.println("用户名已经被注册，请重新注册！");
    }


%>

<input type="text"
       style="border:0px;height: 30px;width:70%;margin:0 auto;font-family: 'Microsoft YaHei'; font-size:20px"
       readonly="true" value="5秒后自动返回，如需立刻返回请点击下面链接" id="time">
<script language="javascript">
    var t = 5;
    var time = document.getElementById("time");
    function fun() {
        t--;
        time.value = t + "秒后自动返回，如需立刻返回请点击下面链接";
        if (t <= 0) {
            location.href = "index.jsp";
            clearInterval(inter);
        }
    }
    var inter = setInterval("fun()", 1000);
</script>
<p text-align="center">
    <a href="index.jsp">点击返回</a></p>

</body>
</html>
