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


    Statement stmt = conn.createStatement();


    String sql = "SELECT song_name,author,tag,song_id FROM " + "music" + " WHERE song_id = \"" + name1 + "\"";
    // out.print(sql);
    ResultSet rs = stmt.executeQuery(sql);

    while (rs.next()) {
        out.print("<table class=\"table table-striped table-bordered table-hover\"><thead><tr><th>专辑图</th><th>歌曲名称</th><th>是否喜欢</th></tr></thead><tbody>");

        out.print("<tr><td width = \"120\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=100 height=100 src=\"//music.163.com/outchain/player?type=2&id=" + name1 + "&auto=0&height=100\"></iframe></td>");

        out.print("<td>" + rs.getString(1) + "-" + rs.getString(2) + "</td>");
        out.print("<td>");
        Statement stmt1 = conn.createStatement();
        String sql11 = "SELECT * FROM love_song WHERE user_id = \"" + get_id + "\" AND song_id=\"" + rs.getString(4) + "\"";
        ResultSet rs1 = stmt1.executeQuery(sql11);
        if (rs1.next()) {
            out.print("<a href = \"LoveMySong.jsp?uid=" + get_id + "&sid=" + rs.getString(4) + "+&type=1\"><button class = \"btn btn-danger btn-lg\">Dislike!</button></a>");
        } else {

            out.print("<a href = \"LoveMySong.jsp?uid=" + get_id + "&sid=" + rs.getString(4) + "+&type=1\"><button class = \"btn btn-primary btn-lg\">Like!</button></a>");

        }
        rs1.close();
        stmt1.close();

        out.print("</td></tr></tbody></table>");

        out.print("<table class=\"table table-striped table-bordered table-hover\"><caption style=\"font-size:20px\">收录到我的歌单</caption><tbody><tr><td>");
        if (geta != null) {

            Statement stmt111 = conn.createStatement();
            String sql111 = "SELECT * FROM personal_song_list WHERE user_id = \"" + get_id + "\"";
            ResultSet rs11 = stmt111.executeQuery(sql111);
            while (rs11.next()) {

                out.print("<a href = \"LoveMySong.jsp?uid=" + rs11.getString(1) + "&sid=" + rs.getString(4) + "+&type=4\"><button class = \"btn btn-primary btn-md\">" + rs11.getString(2) + "</button></a>" + "&nbsp;&nbsp;");

            }

            rs11.close();
            stmt111.close();


        }
        out.print("</td></tr></tbody></table>");

        out.print("<table class=\"table table-striped table-bordered table-hover\"><thead><tr><th>试听</th></tr></thead><tbody><tr><td>");

        out.print("<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=1100 height=100 src=\"//music.163.com/outchain/player?type=2&id=" + name1 + "&auto=0&height=100\"></iframe></td></tr></tbody></table>");


        out.print("<table class=\"table table-striped table-bordered table-hover\"><thead><tr><th>评论</th>");


%>
<th>Liked</th>
<th>
    <div style="float:right">
        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">写评论</button>
    </div>
</th>
</tr></thead>

<form method="post" action="AddComment.jsp">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body"
                     style="width:100%;margin:0 auto;font-family: 'Microsoft YaHei', Tahoma, Helvetica, Arial, sans-serif;font-size:12px;">
                    <div class="input-group">
                        <input type="text" name="songid" id="songid" class="btn btn-default hidden"
                               value=<%out.print("\""+name1+"\"");%>>
                        <h4 class="modal-title" id="myModalLabel">我的评论</h4>

                        <textarea style="font-size:20px" name="username" id="username" cols="52" rows="10"></textarea>


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

<tbody>
    <%   Statement stmt1111 = conn.createStatement();
        String sql1 = "SELECT author,txt,liked FROM " + "comment" + " WHERE song_id = \"" + name1 + "\" ORDER BY -liked";
        ResultSet rs111 = stmt1111.executeQuery(sql1);
        while (rs111.next()) {
            out.print("<tr><td>"+rs111.getString(1) + "</td><td>" + rs111.getString(3) + "</td><td>" + rs111.getString(2) + "</td></tr>");
        }
        //     out.print("<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=100 height=100 src=\"//music.163.com/outchain/player?type=2&id=" +"441552"+"&auto=0&height=100\"></iframe>\n"+"<br>");
        rs1.close();
        stmt1111.close();
        out.print("</tbody>");
    }


    //out.print("<br>");
    // out.print("ok， Database Query Successd！");
    rs.close();
    stmt.close();
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

