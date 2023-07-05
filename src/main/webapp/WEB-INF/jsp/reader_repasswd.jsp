<%--
  Created by IntelliJ IDEA.
  User: WL
  Date: 2023-06-15
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${readercard.name}的主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-color: rgb(240,242,245);
        }
    </style>
</head>
<body background="img/pic6.jpg" >
<nav class="navbar navbar-default " role="navigation" style="background-color:#fff">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand " href="reader_main.html"><p class="text-primary">我的图书馆</p></a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left" style="margin-left:250px">
                <li >
                    <a href="reader_querybook.html" >
                        图书查询
                    </a>
                </li>
                <li >
                    <a href="reader_allbook.html" >
                        所有图书
                    </a>
                </li>

                <li>
                    <a href="reader_info.html" >
                        个人信息
                    </a>
                </li>
                <li >
                    <a href="mylend.html" >
                        我的借还
                    </a>
                </li>
                <li class="active">
                    <a href="reader_repasswd.html" >
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="reader_info.html"><i class="bi bi-person-circle"></i>&nbsp;${readercard.name}，已登录</a></li>
                <li><a href="login.html"><i class="bi bi-box-arrow-right"></i>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${error}
    </div>
</c:if>

<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 15%">
    <div class="panel panel-primary " >
        <div class="panel-heading">
            <h3 class="panel-title">密码修改</h3>
        </div>
        <div class="panel-body">
    <form class="form-horizontal" method="post" action="reader_repasswd_do.html"  id="repasswd" >
    <div class="form-group">
        <label for="oldPasswd" class="col-sm-2 control-label">旧密码</label>
        <div class="col-sm-10">
            <input  class="form-control" type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码">
        </div>
    </div>
    <div class="form-group">
        <label for="newPasswd" class="col-sm-2 control-label">新密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control"  id="newPasswd" name="newPasswd" placeholder="输入新密码" placeholder="Password">
        </div>
    </div>
    <div class="form-group">
        <label for="reNewPasswd" class="col-sm-2 control-label">确认新密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码">
        </div>
    </div>
        <p id="tishi" style="margin-left: 10%;position: absolute"></p><br/>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" value="提交" class="btn btn-default">
        </div>
    </div>
</form>

        </div>
    </div>
</div>
<script>
    function mySubmit(flag){
        return flag;
    }

    $(document).keyup(function () {
        if($("#newPasswd").val()!=$("#reNewPasswd").val()&&$("#newPasswd").val()!=""&&$("#reNewPasswd").val()!=""&&$("#newPasswd").val().length==$("#reNewPasswd").val().length){
            $("#tishi").text("提示:两次输入的新密码不同，请检查!");
        }
        else {
            $("#tishi").text("");
        }
    })

    $("#repasswd").submit(function () {
        if($("#oldPasswd").val()==''||$("#newPasswd").val()==''||$("#reNewPasswd").val()==''){
            $("#tishi").text("提示:请填写完整!");
            return mySubmit(false);
        }
        else if($("#newPasswd").val()!=$("#reNewPasswd").val()){
            $("#tishi").text("提示:两次输入的新密码不同，请检查!");
            return mySubmit(false);
        }
    })
</script>


</body>
</html>
