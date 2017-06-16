<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<style>
    li {
        font-family: "Microsoft YaHei";
        font-size: 18px;
        color: white;
    }

    li:hover {
    }
</style>
<head>
    <meta charset="gb2312">
    <title>Comic Market Site!</title>
    <link rel="stylesheet" href="src/css/bootstrap.min.css">
    <link rel="stylesheet" href="src/css/animate.min.css">
    <script src="src/js/jquery.min.js"></script>
    <script src="src/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        /* ����¼����ڳ�������תǰ���� */
        $("#refresh a").click(function () {
            var link = $(this).attr('href');
            $('#div_view').attr('src', link);
            var href = window.location.href;
            window.location.href = href.substr(0, href.indexOf('#')) + '#' + link;
            return false;
        });
    });
</script>
<body>
<!-- navbar -->
<ul class="nav nav-pills navbar-fixed-top navbar-inverse navbar-fluid">
    <div style="height:3px"></div>
    <li class="text-center" style="width : 15%;"><a href="index.jsp">��ҳ</a></li>
    <li class="text-center" style="width : 15%;"><a href="personal.jsp">�����鱨</a></li>
    <li class="text-center active" style="width : 15%;"><a href="circus.jsp">�����鱨</a></li>
    <li class="text-center" style="width : 15%;"><a href="jyoho.jsp">�������鱨</a></li>
    <li class="text-center" style="width : 15%;"><a href="shyuhen.jsp">�ܱ߻</a></li>
    <li class="text-center" style="width : 24%; float:right;">

        <% String geta = (String) session.getAttribute("loginuser");
            if (geta != null) {%>
        ���ע��
        <button id="advancebutton" class="btn btn-primary btn-lg danger" onclick="location='logout.jsp'"><%
            out.print("Welcome " + geta);%></button>
        <%} %>
        <%
            if (geta == null) {
        %>
        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">��½</button>
        <%} %>

    </li>
    <div style="height:50px"></div>
</ul>
<div style="height:50px"></div>

<!-- ģ̬�� -->
<form method="post" action="login.jsp">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">�û���¼</h4>
                </div>
                <div class="modal-body"
                     style="width:50%;margin:0 auto;font-family: 'Microsoft YaHei', '����' , Tahoma, Helvetica, Arial, sans-serif;font-size:12px;">
                    <div class="input-group">
                        <span class="input-group-addon">�û���</span>
                        <input type="text" class="form-control input-group-lg" name="username" id="username">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">���� &nbsp;&nbsp;</span>
                        <input type="password" class="form-control input-group-lg" name="password" id="password">
                    </div>
                    <br/>
                    <div style="font-size:15px;"><a href="register.jsp">ע�����û�</a></div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-lg
                    btn-default" data-dismiss="modal">�ر�
                    </button>
                    <button type="submit" class="btn btn-lg btn-primary">�ύ</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<!-- ���δ��½��ʾ��½ ����ҳ�� �����鿴 1.�ղص���Ϣ 2.ϲ������Ϣ 3.������Ϣ -->

<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-sm-4 col-md-4 col-lg-4">
            <div id="refresh" class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="active">
                        <a href="index.jsp">��������</a></li>
                    <li>
                        <a href="circus2.jsp">��˾����</a></li>
                    <li>
                        <a href="circus3.jsp">һ������</a></li>
                    <li>
                        <a href="circus4.jsp">��������</a></li>
                    <li>
                        <a href="#">&nbsp;</a></li>
                </ul>
                <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
            </div>
        </div>

        <div id="newPage" class="col-sm-8 col-md-8 col-lg-8">
            <div style="height:5px"></div>
            <iframe frameborder="0" id="div_view" width="100%" height="80%"></iframe>
        </div>

    </div>

</div><!--/.fluid-container-->


<hr>
<footer>
    <p>&copy;Ayase Tech. 2016</p>
</footer>
</body>

</html>