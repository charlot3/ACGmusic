<%--
  Created by IntelliJ IDEA.
  User: Hanayo
  Date: 2017/6/15
  Time: 下午7:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SongList</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
</head>

<style>
    body {
        padding-top: 3%;
        padding-bottom: 3%;
    }

    .nav-icon {
        padding-left: 10px;
        padding-right: 10px;
        width: 50px;
    }

    .dropdownmenu-icon {
        padding-left: 10px;
        padding-right: 5px;
        width: 30px;
    }

    /* Hide for mobile, show later */
    .sidebar {
        display: none;
    }

    @media (min-width: 768px) {
        .sidebar {
            position: fixed;
            top: 51px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            background-color: #f5f5f5;
            border-right: 1px solid #eee;
        }
    }

    /* Sidebar navigation */
    .nav-sidebar {
        margin-right: -21px; /* 20px padding + 1px border */
        margin-bottom: 20px;
        margin-left: -20px;
    }

    .nav-sidebar > li > a {
        padding-right: 20px;
        padding-left: 20px;
    }

    .nav-sidebar > .active > a,
    .nav-sidebar > .active > a:hover,
    .nav-sidebar > .active > a:focus {
        color: #fff;
        background-color: #428bca;
    }

    /*
 * Main content
 */

    .main {
        padding: 20px;
    }

    @media (min-width: 768px) {
        .main {
            padding-right: 40px;
            padding-left: 40px;
        }
    }

    .main .page-header {
        margin-top: 0;
    }

    /*
     * Placeholder dashboard ideas
     */

    .placeholders {
        margin-bottom: 30px;
        text-align: center;
    }

    .placeholders h4 {
        margin-bottom: 0;
    }

    .placeholder {
        margin-bottom: 20px;
    }

    .placeholder img {
        display: inline-block;
        border-radius: 50%;
    }

    .imageflow {
        height: 50%;
        background-color: cadetblue;
    }

    .songlistImage {
        height: 100%;
    }

    td {
        text-align: left;
        vertical-align: middle;
    !important;
    }

    .songlistTable {
        border: 1px solid #666666;
    }

    .mediaHeight {
        height: 40%;
    }

    .songlistIcon {
        height: 10%;
        padding-right: 15px;
    }

</style>

<body>


<%
    String geta = (String) session.getAttribute("loginuser");
    String get_id = (String) session.getAttribute("user_id");
    String get_roottype = (String) session.getAttribute("roottype");
    request.setCharacterEncoding("UTF-8");
    String name1 = request.getParameter("what");

    //   out.print(name1);
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
    //out.print(name1); String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection(url);

    if (geta == null) {
        out.print("你没有权限获取这样的信息");
    } else {
        Statement stmt = conn.createStatement();
        String sql = "SELECT song_id FROM " + "love_song" + " WHERE user_id = \"" + get_id + "\"";
        out.print("<table class=\"table table-striped table-bordered table-hover\"><thead><tr><th>向你推荐以下歌曲（可能重复）</th></tr></thead><tbody>");

        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {


            Statement stmt1 = conn.createStatement();
            String sql1 = "SELECT * FROM " + "music" + " WHERE song_id = \"" + rs.getString(1) + "\"";
            ResultSet rs1 = stmt1.executeQuery(sql1);
            String[] getid;
            while (rs1.next()) {
                //   String[] getid = rs1.getString(8).split("=");
                getid = rs1.getString(8).split("=");
                // out.print(rs1.getString(8)+"<br>");
                // out.print((String)getid[0]);

                int i = 0;
                int count = 0;
                while ((i < getid.length)) {
                    count = 0;
                    if (getid[i].length() > 0) {
                        // out.print(getid[i]);
                        Statement stmt2 = conn.createStatement();
                        String sql2 = "SELECT * FROM " + "music" + " WHERE tag like \"%" + getid[i] + "%\" ORDER BY id";
                        // out.print(sql2);
                        ResultSet rs2 = stmt2.executeQuery(sql2);
                        while ((count <= 5) && rs2.next()) {
                            out.print("<tr><td><a href=\"SongDetail.jsp?id=" + rs2.getString(2) + "\">" + rs2.getString(3) + "</a>" + "</td></tr>");
                            count++;
                        }
                        rs2.close();

                        stmt2.close();
                        i++;

                    }
                }

            }

            rs1.close();
            stmt1.close();
        }
        rs.close();
        stmt.close();
    }
    conn.close();
    out.print("</tbody></table>");


%>
</div>
<!-- Bootstrap core JavaScript================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../../assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

