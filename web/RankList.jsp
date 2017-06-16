<%--
  Created by IntelliJ IDEA.
  User: Jenni
  Date: 2017/6/5
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>RankList</title>
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
        height: 25%;
    }

    td {
        vertical-align: middle;
    }
</style>

<body>
<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="navbar-header"><a href="#" class="navbar-brand">我爱罗的凝视</a></div>
    <form action="#" class="navbar-form border-radius" role="search">
        <input type="text" class="form-control" placeholder="搜索歌曲、歌手、歌单……">
        <a href="#" class="pull-right"><img src="src/image/settings.png" class="nav-icon"></a>
        <a href="#" class="pull-right"><img src="src/image/message.png" class="nav-icon"></a>
        <div class="dropdown pull-right">
            <a href="#" class="dropdown-toggle" id="dropdownMenuMyAccount" data-toggle="dropdown">
                用户名<span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenuMyAccount">
                <li><a href="#" role="menuitem" tabindex="-1">私信消息</a></li>
                <li><a href="#" role="menuitem" tabindex="-1">我的关注</a></li>
                <li class="divider"></li>
                <li><a href="#" role="menuitem" tabindex="-1">会员中心</a></li>
                <li><a href="#" role="menuitem" tabindex="-1">我的等级</a></li>
                <li class="divider"></li>
                <li><a href="#" role="menuitem" tabindex="-1">编辑个人信息</a></li>
                <li><a href="#" role="menuitem" tabindex="-1">绑定社交账号</a></li>
                <li class="divider"></li>
                <li><a href="#" role="menuitem" tabindex="-1">退出登录</a></li>
            </ul>
        </div>
    </form>
</div>
<!--以上为导航条-->

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar sidebar-default" style="padding-bottom: 3%">
            <ul class="nav nav-sidebar" style="padding-left: 20px">推荐
                <li><a href="index.jsp">发现音乐<span class="sr-only">(current)</span></a></li>
                <li><a href="SongList.jsp">推荐歌单</a></li>
            </ul>
            <ul class="nav nav-sidebar" style="padding-left: 20px">我的音乐
                <li><a href="">本地音乐</a></li>
                <li><a href="">我喜欢的歌手</a></li>
                <li><a href="">下载管理</a></li>
            </ul>
            <ul class="nav nav-sidebar" style="padding-left: 20px">我创建的歌单
                <li><a href="SongListDetail.jsp">歌单1</a></li>
                <li><a href="SongListDetail.jsp">歌单2</a></li>
                <li><a href="SongListDetail.jsp">歌单3</a></li>
                <li><a href="SongListDetail.jsp">歌单1</a></li>
                <li><a href="SongListDetail.jsp">歌单2</a></li>
                <li><a href="SongListDetail.jsp">歌单3</a></li>
            </ul>
            <ul class="nav nav-sidebar" style="padding-left: 20px">我收藏的歌单
                <li><a href="SongListDetail.jsp">歌单1</a></li>
                <li><a href="SongListDetail.jsp">歌单2</a></li>
                <li><a href="SongListDetail.jsp">歌单3</a></li>
                <li><a href="SongListDetail.jsp">歌单1</a></li>
                <li><a href="SongListDetail.jsp">歌单2</a></li>
                <li><a href="SongListDetail.jsp">歌单3</a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="row">
                <ul class="nav nav-tabs">
                    <li><a href="index.jsp">个性推荐</a></li>
                    <li><a href="SongList.jsp">歌单</a></li>
                    <li class="active"><a href="RankList.jsp">排行榜</a></li>
                    <li><a href="LatestMusic.jsp">最新音乐</a></li>
                    <li><a href="Singer.jsp">歌手</a></li>
                </ul>
            </div>

            <a href="#" class="pull-right" style="padding-top: 55px">更多&raquo;</a>
            <h3 style="padding-top: 20px;flood-color: #666666">ACG总榜</h3>
            <hr>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>

            <a href="#" class="pull-right" style="padding-top: 20px">更多&raquo;</a>
            <h3 style="padding-top: 50px;flood-color: #666666">动漫榜</h3>
            <hr>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>

            <a href="#" class="pull-right" style="padding-top: 20px">更多&raquo;</a>
            <h3 style="padding-top: 50px;flood-color: #666666">游戏榜</h3>
            <hr>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>
            <div class="col-md-3">
                <a href="#"><img src="src/image/gaara.jpg" class="songlistImage"></a>
                <h4>Name</h4>
                <p>Intro</p>
            </div>

        </div>
    </div>
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


