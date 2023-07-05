<%--
  Created by IntelliJ IDEA.
  User: WL
  Date: 2023-06-15
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${readercard.name}的主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-color: rgb(240,242,245);
        }
        .mg-15{
            margin: 15px 0;
        }
        #ensure{
            position: relative;
            left: 45%;
        }
    </style>
</head>
<body background="img/pic6.jpg" >
<nav class="navbar navbar-default" role="navigation" style="background-color:#fff">
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
                <li >
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

<div class="col-xs-5 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #ffff00">
            <h3 class="panel-title">
                信息修改
            </h3>
        </div>
        <div class="panel-body">
            <form action="reader_edit_do_r.html" method="post" id="edit" >

                <div class="input-group mg-15" >
                    <span  class="input-group-addon">读者证号</span>
                    <input type="text" readonly="readonly" class="form-control" name="readerId" id="readerId" value="${readerinfo.readerId}">
                </div>
                <div class="input-group mg-15">
                    <span class="input-group-addon">姓名</span>
                    <input type="text" class="form-control" name="name" id="name" value="${readerinfo.name}" >
                </div>
                <div class="input-group mg-15">
                    <span  class="input-group-addon">性别</span>
                    <input type="text" class="form-control" name="sex" id="sex"  value="${readerinfo.sex}" >
                </div>
                <div class="input-group mg-15">
                    <span class="input-group-addon">生日</span>
                    <input type="text" class="form-control" name="birth" id="birth"  value="${readerinfo.birth}" >
                </div>
                <div class="input-group mg-15">
                    <span  class="input-group-addon">地址</span>
                    <input type="text" class="form-control" name="address" id="address"  value="${readerinfo.address}" >
                </div>
                <div class="input-group mg-15">
                    <span  class="input-group-addon">电话</span>
                    <input type="text" class="form-control" name="telcode" id="telcode"  value="${readerinfo.telcode}" >
                </div>
                <br/>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left" id="ensure" style="left: 50%">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#edit").submit(function () {
                        if($("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#telcode").val()==''){
                            alert("请填入完整读者信息！");
                            return mySubmit(false);
                        }
                    })
                </script>
            </form>
        </div>
    </div>
</div>


</body>
</html>
