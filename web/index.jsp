<%--
  Created by IntelliJ IDEA.
  User: Jenni
  Date: 2017/5/21
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <title>HomePage</title>
    <link rel="stylesheet" href="src/css/bootstrap.min.css">
    <link rel="stylesheet" href="src/css/animate.min.css">
    <script src="src/js/jquery.min.js"></script>
    <script src="src/js/bootstrap.min.js"></script>

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
        height: 20%;
    }

    td {
        vertical-align: middle;
    }
</style>

<script type="text/javascript" charset="UTF-8">
    $(function () {
        $("#refresh a").click(function () {

            var link = $(this).attr('href');
            $('#div_view').attr('src', link);
            var href = window.location.href;
            window.location.href = href.substr(0, href.indexOf('#')) + '#' + link;
            return false;
        });
        $("#refresh li").click(function () {
            $("#refresh li").eq($(this).index()).addClass("active").siblings().removeClass("active");
        });
        $("#searchbox button").click(function () {
            var link = "searchanswer.jsp?what=" + document.getElementById("what").value;
            $('#div_view').attr('src', link);
            var href = window.location.href;
            window.location.href = href.substr(0, href.indexOf('#')) + '#' + link;

            return false;
        });
    });


</script>

<body>
<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="navbar-header"><a href="#" class="navbar-brand">ACG小站</a></div>
    <div style="width:30%;float:left">


        <form id="searchbox" class="navbar-form border-radius" role="search">
            <input id="what" name="what" type="text" class="form-control" placeholder="搜索歌曲、歌手、歌单……">
            <button type="submit" class="btn btn-md btn-primary">搜索</button>
        </form>
    </div>
    <div style="width:50%;float:right">
        <div style="height:8px;width:100%"></div>
        <a href="#" class="pull-right"><img src="src/image/settings.png" class="nav-icon"></a>
        <a href="#" class="pull-right"><img src="src/image/message.png" class="nav-icon"></a>
        <div class="pull-right">
            <li class="text-center" style="">

                <% String geta = (String) session.getAttribute("loginuser");
                    String get_id = (String) session.getAttribute("user_id");
                    String get_roottype = (String) session.getAttribute("roottype");
                    if (geta != null) {%>

                <button id="advancebutton" class="btn btn-primary btn-md danger" onclick="location='logout.jsp'"><a
                        href="logout.jsp" style="color:white"><%
                    out.print("Welcome " + geta + get_roottype + get_id);%></a></button>
                <%} %>
                <%
                    if (geta == null) {
                %>
                <button class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal">登录</button>
                <%} %>

            </li>
        </div>
    </div>

</div>


<form method="post" action="login.jsp">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">登录</h4>
                </div>
                <div class="modal-body"
                     style="width:50%;margin:0 auto;font-family: 'Microsoft YaHei', Tahoma, Helvetica, Arial, sans-serif;font-size:12px;">
                    <div class="input-group">
                        <span class="input-group-addon">用户名</span>
                        <input type="text" class="form-control input-group-lg" name="username" id="username">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">密码 &nbsp;&nbsp;</span>
                        <input type="password" class="form-control input-group-lg" name="password" id="password">
                    </div>
                    <br/>
                    <div style="font-size:15px;"><a href="register.jsp">注册</a></div>

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


<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-sm-3 col-md-2 col-lg-2">
            <div id="refresh" class="well sidebar-nav">
                <ul class="nav nav-sidebar" style="padding-left: 20px">推荐
                    <li><a href="Recommand.jsp">推荐歌曲</a></li>
                </ul>
                <ul class="nav nav-sidebar" style="padding-left: 20px">我的音乐
                    <li><a href="loveSinger.jsp">我喜欢的歌手</a></li>
                    <li><a href="lovesong.jsp">我喜欢的歌曲</a></li>
                    <li><a href="loveplaylist.jsp">我喜欢的歌单</a></li>
                </ul>
                <ul class="nav nav-sidebar" style="padding-left: 20px">我的歌单
                    <li><a href="ManageDetail.jsp">管理我的歌单</a></li>

                </ul>
                <ul class="nav nav-sidebar" style="padding-left: 20px">

                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                </ul>
            </div>
        </div>

        <div id="newPage" class="col-sm-9 col-md-10 col-lg-10">
            <div style="height:5px"></div>
            <iframe frameborder="0" id="div_view" width="100%" height="100%"></iframe>
        </div>

    </div>
</div>

<!-- Bootstrap core JavaScript================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>
