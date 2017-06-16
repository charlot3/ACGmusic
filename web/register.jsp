<!doctype html>
<%@ page contentType="text/html;charset=gb2312" language="java" %>

<html>
<style>
    li {
        font-family: "Microsoft YaHei";
        font-size: 18px;
        color: white;
    }

    li:hover {
    }

    td {
        width: 33%;
    }
</style>
<head>
    <meta charset="gb2312">
    <title>ACGע��</title>
    <link rel="stylesheet" href="src/css/bootstrap.min.css">
    <link rel="stylesheet" href="src/css/animate.min.css">
    <script src="src/js/jquery.min.js"></script>
    <script src="src/js/bootstrap.min.js"></script>
    <script src="src/js/register.js"></script>
</head>
<!--return validate()��validate()�����Ƿ���ձ�-->
<body>

<form id="test" align="left" onSubmit="return validate()" action="toDB.jsp" role="form">
    <table class="table table-hover">
        <caption><h1>Comiket ��Աע��</h1></caption>
        <tr>
            <td>Username*:</td>
            <td><input class="form-control" type="text" name="Name" id="name" size="20" onChange='check("name")'></td>
            <td id="nameCheck" class="check" hidden="true">*��������Ϊ��</td>
            <td id="namenCheck" class="check"></td>

        </tr>
        <tr>
            <td>Password*:</td>
            <td><input class="form-control" type="password" name="Password" id="password" size="20"
                       onChange='check("password")'></td>
            <td id="passwordCheck" class="check" hidden="true">*���볤�ȱ������8��</td>
            <td id="passwordnCheck" class="check"></td>
        </tr>
        <tr id="cfpass" class="">
            <td>Confirm Password*:</td>
            <td><input class="form-control" type="password" name="cpassword" id="cpassword" size="20"
                       onChange='check("cpassword")'></td>
            <td id="cpasswordCheck" class="check" hidden="true">*�����������벻��ͬ��</td>
            <td id="cpasswordnCheck" class="check"></td>
        </tr>
        <tr>
            <td>Personal Information:</td>
            <td rows="3">
                <textarea class="form-control" name="Info" rows="3"></textarea>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="submit" name="submit" class="btn btn-lg btn-success">&nbsp;&nbsp;&nbsp;&nbsp;�ύ&nbsp;&nbsp;&nbsp;&nbsp;</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="reset" name="reset" class="btn btn-lg btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>


</form>
</body>
</html>