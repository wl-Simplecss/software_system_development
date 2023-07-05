
<%--
  Created by IntelliJ IDEA.
  User: WL
  Date: 2023-06-15
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书信息添加</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-size: cover;
            background-position: center;
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

<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 15%">
    <div class="panel panel-primary " >
        <div class="panel-heading">
            <h3 class="panel-title">增加图书</h3>
        </div>
        <div class="panel-body">
            <form  style="display: flex;flex-wrap: wrap" id="addbook" accept-charset="UTF-8">
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="name" style="width: 80px">图书名</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="请输入书名">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="author" style="width: 80px">作者</label>
                    <input type="text" class="form-control" name="author" id="author"  placeholder="请输入作者名">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="publish" style="width: 80px">出版社</label>
                    <input type="text" class="form-control"  name="publish" id="publish"  placeholder="请输入出版社">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="isbn" style="width: 80px">ISBN</label>
                    <input type="text" class="form-control" name="isbn" id="isbn"  placeholder="请输入ISBN">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="language" style="width: 80px">语言</label>
                    <input type="text" class="form-control" name="language" id="language"  placeholder="请输入语言">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="price" style="width: 80px">价格</label>
                    <input type="text" class="form-control"  name="price"  id="price" placeholder="请输入价格">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="pubdate" style="width: 80px">出版日期</label>
                    <input type="text" class="form-control"  name="pubdate" id="pubdate"   placeholder="请输入出版日期">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="classId" style="width: 80px">分类号</label>
                    <input type="text" class="form-control" name="classId" id="classId"  placeholder="请输入分类号">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="pressmark" style="width: 80px">书架号</label>
                    <input type="text" class="form-control"  name="pressmark" id="pressmark" placeholder="请输入书架号">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:300px;margin: 15px">
                    <label for="state" style="width: 80px">状态</label>
                    <input type="text" class="form-control"  name="state"  id="state"   placeholder="请输入图书状态">
                </div>
                <div class="form-group" style="display: flex;align-items: center;width:630px;margin: 15px">
                    <label for="introduction" style="width: 80px">简介</label>
                    <textarea class="form-control" rows="3"  name="introduction" id="introduction" placeholder="请输入简介"></textarea>
                </div>
                <div style="width: 1000px;text-align: center;margin-top: 50px">
                    <input type="submit" style="width: 120px;height: 40px;font-size: 16px" value="添加" class="btn btn-success btn-sm" class="text-left">
                </div>
                <script>
                    function mySubmit(flag){
                        return flag;
                    }



                    $("#addbook").submit(function () {
                        if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubdate").val()==''||$("#classId").val()==''||$("#pressmark").val()==''||$("#state").val()==''){
                            alert("请填入完整图书信息！");
                            return mySubmit(false);
                        }else{
                            $.ajax({
                                url: "book_add_do.html",
                                type: "post",
                                data: {
                                    name:$("#name").val(),
                                    author:$("#author").val(),
                                    publish:$("#publish").val(),
                                    isbn:$("#isbn").val(),
                                    introduction:$("#introduction").val(),
                                    language:$("#language").val(),
                                    price:$("#price").val(),
                                    pubdate:$("#pubdate").val(),
                                    classId:$("#classId").val(),
                                    pressmark:$("#pressmark").val(),
                                    state:$("#state").val()

                                },
                                success: function(data) {
                                    data = JSON.parse(data)
                                    if (data.code == 200) {
                                        alert("添加成功")
                                        window.location.replace("http://localhost:8080/book_war/allbooks.html");
                                    } else {
                                        alert(data.message);
                                    }
                                }
                            })
                        }
                    })
                </script>
            </form>

        </div>
    </div>
</div>




</body>
</html>
