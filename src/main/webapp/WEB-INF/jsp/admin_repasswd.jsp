<%--
  Created by IntelliJ IDEA.
  User: WL
  Date: 2023-06-15
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更改密码</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-size: cover;
            background-position: center;
        }
        .mg-20{
            margin: 15px !important;
        }
    </style>

</head>
<body background="img/pic5.jpg" >
<nav  style="position:fixed;z-index: 999;width: 100%;background-color: #fff" class="navbar navbar-default" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand" href="admin_main.html">图书管理系统</a>
        </div>
        <div class="collapse navbar-collapse" >
            <ul class="nav navbar-nav navbar-left"  style="margin-left:300px">

                <li>
                    <a href="allbooks.html">
                        所有图书
                    </a>
                </li>


                <li>
                    <a href="allreaders.html">
                        所有读者
                    </a>
                </li>
                <li>
                    <a href="book_add.html">
                        新增图书
                    </a>
                </li>
                <li>
                    <a href="reader_add.html">
                        新增读者
                    </a>
                </li>

                <li >
                    <a href="lendlist.html">
                        借还日志
                    </a>
                </li>
                <li >
                    <a href="admin_repasswd.html" >
                        修改密码
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href=""><i class="bi bi-person-circle"></i>&nbsp;${admin.adminId}，已登录</a></li>
                <li><a href="login.html"><i class="bi bi-box-arrow-right"></i>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div style="position: relative;top: 15%">
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
</div>

<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 15%">
    <div class="panel panel-primary " >
        <div class="panel-heading">
            <h3 class="panel-title">密码修改</h3>
        </div>
        <div class="panel-body">
            <form    action="admin_repasswd_do" class="form-inline"  id="repasswd" >
                <div class="input-group" style="box-sizing: border-box">
                    <input type="password" style="width: 650px" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control mg-20"  class="form-control">
                    <input type="password" style="width: 650px" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control mg-20"  class="form-control">
                    <input type="password" style="width: 650px;" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码" class="form-control mg-20"  class="form-control">
                    <em id="tishi" style="color: red"></em>
                    <br/>
                    <div style="text-align: center;margin-top: 30px">
                        <span>
                            <input style="background: #4cae4c;color: white;width: 100px;height: 40px" type="submit" value="提交" class="btn btn-default">
                        </span>
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
                $("#tishi").text("两次输入的新密码不同，请检查");
            }
            else {
                $("#tishi").text("");
            }
        })

        $("#repasswd").submit(function () {
            if($("#oldPasswd").val()==''||$("#newPasswd").val()==''||$("#reNewPasswd").val()==''){
                $("#tishi").text("请填写完毕后提交");
                return mySubmit(false);
            }
            else if($("#newPasswd").val()!=$("#reNewPasswd").val()){
                $("#tishi").text("两次输入的新密码不同，请检查");
                return mySubmit(false);
            }
        })


    </script>

</body>
</html>
