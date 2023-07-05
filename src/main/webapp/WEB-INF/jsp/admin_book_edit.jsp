<%--
  Created by IntelliJ IDEA.
  User: WL
  Date: 2023-06-15
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑《 ${detail.name}》</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-size: cover;
            background-position: center;
        }
        .mg-15{
            margin: 15px 0;
        }
        .input-group-item{
            width: 48%;
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
<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 10%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">编辑《 ${detail.name}》</h3>
        </div>
        <div class="panel-body">
            <form action="book_edit_do.html?id=${detail.bookId}" style="display: flex;flex-wrap: wrap;justify-content: space-between" method="post" id="addbook" >

                <div class="input-group mg-15 input-group-item">
                    <span  class="input-group-addon ">书名</span>
                    <input type="text" class="form-control" name="name" id="name" value="${detail.name}">
                </div>
                <div class="input-group mg-15 input-group-item">
                    <span class="input-group-addon">作者</span>
                    <input type="text" class="form-control" name="author" id="author" value="${detail.author}" >
                </div>
                <div class="input-group mg-15 input-group-item">
                    <span  class="input-group-addon">出版社</span>
                    <input type="text" class="form-control" name="publish" id="publish"  value="${detail.publish}" >
                </div>
                <div class="input-group mg-15 input-group-item">
                    <span class="input-group-addon">ISBN</span>
                    <input type="text" class="form-control" name="isbn" id="isbn"  value="${detail.isbn}" >
                </div>

                <div class="input-group mg-15 input-group-item">
                    <span class="input-group-addon">语言</span>
                    <input type="text" class="form-control" name="language" id="language" value="${detail.language}" >
                </div>
                <div class="input-group mg-15 input-group-item">
                    <span  class="input-group-addon">价格</span>
                    <input type="text" class="form-control" name="price"  id="price" value="${detail.price}">
                </div>
                <div class="input-group mg-15 input-group-item">
                    <span class="input-group-addon">出版日期</span>
                    <input type="text" class="form-control" name="pubdate" id="pubdate" value="${detail.pubdate}">
                </div>
                <div class="input-group mg-15 input-group-item">
                    <span  class="input-group-addon">分类号</span>
                    <input type="text" class="form-control" name="classId" id="classId" value="${detail.classId}">
                </div>
                <div class="input-group mg-15 input-group-item">
                    <span class="input-group-addon">书架号</span>
                    <input type="text" class="form-control" name="pressmark" id="pressmark" value="${detail.pressmark}">
                </div>
                <div class="input-group mg-15 input-group-item">
                    <span  class="input-group-addon">状态</span>
                    <input type="text" class="form-control" name="state"  id="state" value="${detail.state}">
                </div>
                <div class="input-group mg-15 input-group-item" style="width: 100%">
                    <span  class="input-group-addon">简介</span>
                    <input type="text" class="form-control" name="introduction" id="introduction"  value="${detail.introduction}" >
                </div>
                <div style="width: 100%;text-align: center">
                    <input type="submit" style="width: 100px;height: 30px" value="确定" class="btn btn-success btn-sm" class="text-left">
                </div>
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#addbook").submit(function () {
                        if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubdate").val()==''||$("#classId").val()==''||$("#pressmark").val()==''||$("#state").val()==''){
                            alert("请填入完整图书信息！");
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
