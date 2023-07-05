<%--
  Created by IntelliJ IDEA.
  User: WL
  Date: 2023-06-15
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${detail.name}》</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
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
<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 10%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${detail.name}》</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="15%">书名</th>
                    <td>${detail.name}</td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>${detail.author}</td>
                </tr>
                <tr>
                    <th>出版社</th>
                    <td>${detail.publish}</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${detail.isbn}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td>${detail.introduction}</td>
                </tr>
                <tr>
                    <th>语言</th>
                    <td>${detail.language}</td>
                </tr>
                <tr>
                    <th>价格</th>
                    <td>${detail.price}</td>
                </tr>
                <tr>
                    <th>出版日期</th>
                    <td>${detail.pubdate}</td>
                </tr>
                <tr>
                    <th>分类号</th>
                    <td>${detail.classId}</td>
                </tr>
                <tr>
                    <th>书架号</th>
                    <td>${detail.pressmark}</td>
                </tr>
                <tr>
                    <th>状态</th>
                    <c:if test="${detail.state==1}">
                        <td>在馆</td>
                    </c:if>
                    <c:if test="${detail.state==0}">
                        <td>借出</td>
                    </c:if>

                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
