<%--
  Created by IntelliJ IDEA.
  User: charl
  Date: 2017/6/5
  Time: 17:25
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

    String name1 = request.getParameter("id");

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

    if (geta == null || get_roottype.equals("0")) {
        out.print("<button class = \"primary btn btn-lg\">你没有登录或者无权新建歌单。请登陆后再尝试</button>");
    } else {
%>


<%
    }

    if (geta == null || get_roottype.equals("0")) {
        //out.print("<button class = \"primary btn btn-lg\">你没有登录或者无权新建歌单。请登陆后再尝试</button>");
    } else {
        Statement stmt = conn.createStatement();

        String sql = "SELECT id,title FROM " + "personal_song_list" + " WHERE user_id = \"" + get_id + "\"";
        out.print("<h1>我的歌单</h1>");
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            // output playlist
            out.print("<table class=\"table table-striped table-bordered table-hover\"><thead><tr><th width = \"600\">" + rs.getString(2) + "</th><th>" + "<a href =\"Delete.jsp?id=" + rs.getString(1) + "&pid=" + rs.getString(1) + "&type=2\"><button class=\"btn btn-danger btn-md\">Delete</button></a>" + "</th></tr></thead><tbody>");


            //output playlist include
            Statement stmt1 = conn.createStatement();
            String sql1 = "SELECT music_id FROM " + "personal_song" + " WHERE pid = \"" + rs.getString(1) + "\"";
            ResultSet rs1 = stmt1.executeQuery(sql1);
            while (rs1.next()) {

                Statement stmt2 = conn.createStatement();
                String sql2 = "SELECT song_name FROM " + "music" + " WHERE song_id = \"" + rs1.getString(1) + "\"";
                ResultSet rs2 = stmt2.executeQuery(sql2);
                while (rs2.next()) {
                    out.print("<tr><td>" + rs2.getString(1) + "</td>");
                    out.print("<td><a href =\"Delete.jsp?id=" + rs1.getString(1) + "&pid=" + rs.getString(1) + "&type=1\"><button class=\"btn btn-danger btn-md\">Delete</button></a></td></tr>");

                }
                rs2.close();
                stmt2.close();
            }
            rs1.close();
            stmt1.close();
            out.print("</tbody></table>");

        }
        rs.close();
        stmt.close();

    }%>
<button class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal">新建歌单</button>
<form method="post" action="SongList.jsp">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">创建新歌单</h4>
                </div>
                <div class="modal-body"
                     style="width:50%;margin:0 auto;font-family: 'Microsoft YaHei', Tahoma, Helvetica, Arial, sans-serif;font-size:12px;">
                    <div class="input-group">
                        <span class="input-group-addon">歌单名</span>
                        <input type="text" class="form-control input-group-lg" name="username" id="username">
                    </div>
                    <br/>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-lg
                    btn-default" data-dismiss="modal">取消
                    </button>
                    <button type="submit" class="btn btn-lg btn-primary">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<%

    /*


        Statement stmt = conn.createStatement();


        String sql = "SELECT song_name,author,tag FROM " + "music" + " WHERE song_id = \"" + name1 + "\"";
        out.print(sql);
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {


            out.print("<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=100 height=100 src=\"//music.163.com/outchain/player?type=2&id=" + name1 + "&auto=0&height=100\"></iframe>\n" + "<br>");
            out.print("<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=1000 height=100 src=\"//music.163.com/outchain/player?type=2&id=" + name1 + "&auto=0&height=100\"></iframe>\n" + "<br>");

            out.print("|");
            out.print(rs.getString(1) + " ");
            out.print("|");
            out.print(rs.getString(2) + "<br>");

            out.print("评论"+"<br>");
            Statement stmt1 = conn.createStatement();
            String sql1 = "SELECT author,txt,liked FROM " + "comment" + " WHERE song_id = \"" + name1 + "\" ORDER BY -liked";
            ResultSet rs1 = stmt1.executeQuery(sql1);
            while(rs1.next()) {
                out.print(rs1.getString(1)+"&nbsp;"+rs1.getString(3)+"&nbsp;"+rs1.getString(2)+"<br>");
            }
            //     out.print("<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=100 height=100 src=\"//music.163.com/outchain/player?type=2&id=" +"441552"+"&auto=0&height=100\"></iframe>\n"+"<br>");
            rs1.close();
            stmt1.close();
            out.print("<br>");
        }


        out.print("<br>");
        out.print("ok， Database Query Successd！");
        rs.close();
        stmt.close();

        */
    conn.close();


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


