<%--
  Created by IntelliJ IDEA.
  User: Jenni
  Date: 2017/6/5
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    .ranklistImage {
        width: 50px;
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
            <div class="media mediaHeight">
                <img src="src/image/gaara.jpg" class="media-object songlistImage pull-left">
                <div class="media-body" style="padding-left: 20px">
                    <h3 class="media-heading">SongListName</h3>
                    <p style="color: #666666"><a href="#">某用户</a>&nbsp;&nbsp;&nbsp;&nbsp;2017/6/5创建 </p>
                    <a href="#" class="btn btn-default">播放全部</a>
                    <a href="#" class="btn btn-default">添加到歌单</a>
                    <a href="#" class="btn btn-default">分享</a>
                    <a href="#" class="btn btn-default">下载全部</a>
                    <p style="padding-top: 30px">标签：&nbsp;&nbsp;<a href="#">tag</a>&nbsp;&nbsp;/&nbsp;&nbsp;
                        <a href="#">tag</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#">tag</a>&nbsp;&nbsp;/&nbsp;&nbsp;
                        <a href="#">tag</a>&nbsp;&nbsp;
                    </p>
                    <p>简介：<span style="color: #999999">
                        Will you still love me when I'm no longer young and beautiful?
                        Will you still love me when I got nothing but my aching soul?
                        I know you will.I know you will.I know that you will.
                        Will you still love me when I'm no longer beautiful?</span>
                    </p>
                </div>
            </div>

            <ul class="nav nav-tabs" style="padding-top: 5%">
                <li><a href="SongListDetail.jsp">歌曲列表</a></li>
                <li class="active"><a href="SongRemark.jsp">评论</a></li>
                <li class="pull-right">
                    <form action="#" class="navbar-form border-radius" role="search">
                        <input type="text" class="form-control" placeholder="搜索歌单音乐……"/>
                    </form>
                </li>
            </ul>

            <form role="form" action="#" style="padding-top: 3%;padding-bottom: 3%;background-color: #eeeeee">
                <div class="form-group" style="padding-left: 1%;padding-right: 1%">
                    <textarea class="form-control" rows="3" placeholder="分享你想说的……"></textarea>
                    <br>
                    <input type="submit" class="btn btn-default pull-right" value="评论">
                </div>
            </form>

            <h4 style="padding-top: 3%">精彩评论</h4>
            <hr>
            <ul class="media-list">
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
                <li class="media">
                    <a href="#" class="pull-left"><img src="src/image/gaara.jpg" class="media-object ranklistImage"
                                                       style="border-radius: 50%"></a>
                    <div class="media-body">
                        <p class="media-heading"><a href="#">用户名</a>：看到这，让我心里默念了一遍信条：不得滥杀无辜 ，隐蔽自己，成为人群的一员 ，绝不危及兄弟同盟
                            万物皆虚，万事皆允 </p>
                        <p style="color: #666666;font-size: small">2017年6月1日&nbsp;&nbsp;00:00</p>
                    </div>
                </li>
                <hr>
            </ul>

            <div class="col-md-4 col-md-offset-4">
                <ul class="pagination pagination-sm ">
                    <li><a href="#">&laquo;第一页</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">最后一页&raquo;</a></li>
                </ul>
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
