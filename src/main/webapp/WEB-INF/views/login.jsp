<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/28
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>登录</title>--%>
<%--    <style>.error{color:red;}</style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="error">${error}</div>--%>
<%--<form action="/login.do" method="post">--%>
<%--    用户名：<input type="text" name="username"><br/>--%>
<%--    密码：<input type="password" name="password"><br/>--%>
<%--    <input type="checkbox" name="rememberMe">记住我<br/>--%>
<%--    <input type="submit" value="登录">--%>
<%--</form>--%>

<%--</body>--%>
<%--</html>--%>


<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>草民!!!!!</title>

    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="keywords" content="">

    <link href="/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style type="text/css">
        *{color: #3c3c3c;font-weight: 600;}
    .navbar{
        background: dodgerblue;
    }
    .navbar-nav a:hover{
        background-color: deepskyblue;
    }
        .form-group {
            margin-bottom: 5px;
            height: 59px;
        }
        body{
            background: url("/images/bg.jpg") no-repeat;
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <div class="row">
            <div class="col-xs-5">
                <div class="logo">
                </div>
            </div>

        </div>
    </div>
</header>
<!-- Navigation bar starts -->

<div class="navbar bs-docs-nav" role="banner">
    <div class="container">
        <nav class="collapse navbar-collapse bs-navbar-collapse"
             role="navigation">
            <ul class="nav navbar-nav">
                <!-- <li>
                    <a href="home"><i class="fa fa-home"></i>主页</a>
                </li> -->
                <li>
                    <a href="start-exam.html"><i class="fa fa-edit"></i>试题练习</a>
                </li>
                <!-- <li>
                    <a href="student/usercenter"><i class="fa fa-dashboard"></i>会员中心</a>
                </li>
                <li>
                    <a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
                </li> -->
            </ul>
        </nav>
    </div>
</div>

<!-- Navigation bar ends -->

<div class="content" style="margin-bottom: 100px;">

    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="lrform">
                    <h5>登陆</h5>
                    <div class="form">
                        <!-- Login form (not working)-->
                        <form class="form-horizontal" action="/login.do" method="post" id="login_form" name="login_form">
                            <!-- Username -->
                            <div class="form-group">
                                <label class="control-label col-md-3" for="username">用户名</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="username" >
                                </div>
                            </div>
                            <!-- Password -->
                            <div class="form-group">
                                <label class="control-label col-md-3" for="password">密码</label>
                                <div class="col-md-9">
                                    <input type="password" class="form-control" name="password">
                                </div>
                            </div>
                            <!-- Buttons -->
                            <div class="form-group">
                                <!-- Buttons -->
                                <div class="col-md-9 col-md-offset-3">
                                    <button type="submit" class="btn btn-default">
                                        登陆
                                    </button>
                                    <button type="reset" class="btn btn-default">
                                        取消
                                    </button>
                                    <span class="form-message">${result}</span>
                                </div>
                            </div>
                        </form>
                        没有账号? <a href="register.html">注册</a>
                    </div>
                </div>

            </div>
        </div>

    </div>

</div>


<!-- Slider Ends -->

<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript"
        src="/js/jquery/jquery-1.9.0.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>

<!-- Bootstrap JS -->
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/login.js"></script>

</body>
</html>