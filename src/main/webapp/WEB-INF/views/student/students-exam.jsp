<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/2
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
    Remove this if you use the .htaccess -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>草民考试</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="keywords" content="">
    <link href="/bootstrap/css/bootstrap-huan.css"
          rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css"
          rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <style>
        *{color: #3c3c3c;
            font-weight: 600;}
        .question-number{
            color: #5cb85c;
            font-weight: bolder;
            display: inline-block;
            width: 30px;
            text-align: center;
        }

        .question-number-2{
            color: #5bc0de;
            font-weight: bolder;
            display: inline-block;
            width: 30px;
            text-align: center;
        }
        .question-number-3{
            color: #d9534f;
            font-weight: bolder;
            display: inline-block;
            width: 30px;
            text-align: center;
        }

        a.join-practice-btn{
            margin:0;
            margin-left:20px;
        }

        .content ul.question-list-knowledge{
            padding:8px 20px;
        }

        .knowledge-title{
            background-color:#EEE;
            padding:2px 10px;
            margin-bottom:20px;
            cursor:pointer;
            border:1px solid #FFF;
            border-radius:4px;
        }

        .knowledge-title-name{
            margin-left:8px;
        }

        .point-name{
            width:200px;
            display:inline-block;
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
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
                <!-- <li>
                    <a href="home.html"><i class="fa fa-home"></i>主页</a>
                </li> -->
                <li class="active">
                    <a href="start-exam"> 试题练习</a>
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

<!-- Slider starts -->


<div class="content" style="margin-bottom: 100px;">

    <div class="container">
        <div class="row">
            <div class="col-xs-4 col-xs-offset-4">
                <div>
                    <h3>开始测验</h3>

                    <div class="row">

                        <div class="select-test col-xs-6">
                            <div style="height: 100px;">

                                <div class="select-test-content">
                                    <h3 class="title">随机出卷</h3>

                                    <a class="btn btn-primary" data-toggle="modal" data-target=".history-exampaper-modal" > 参加练习</a>
                                    <div class="modal fade history-exampaper-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                                                </div>
                                                <div class="modal-body">
                                                    <ul>
                                                        <c:forEach items="${papers}" var="item">
                                                            <li>
                                                                <a href="/qryPaperDetail.action?id=${item.id}">${item.papername}</a>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--//content-->

                            </div>
                        </div>


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
<!-- Bootstrap JS -->
<script type="text/javascript"
        src="/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function(){
        bindQuestionKnowledage();
        var result = checkBrowser();
        if (!result){
            alert("请至少更新浏览器版本至IE8或以上版本");
        }
    });

    function checkBrowser() {
        var browser = navigator.appName;
        var b_version = navigator.appVersion;
        var version = b_version.split(";");
        var trim_Version = version[1].replace(/[ ]/g, "");
        if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
            return false;
        } else if (browser == "Microsoft Internet Explorer"
            && trim_Version == "MSIE6.0") {
            return false;
        } else
            return true;
    }

    function bindQuestionKnowledage(){
        $(".knowledge-title").click(function(){
            var ul = $(this).parent().find(".question-list-knowledge");

            if(ul.is(":visible")){
                $(this).find(".fa-chevron-down").hide();
                $(this).find(".fa-chevron-up").show();

                $(".question-list-knowledge").slideUp();

            }else{
                $(".fa-chevron-down").hide();
                $(".fa-chevron-up").show();

                $(this).find(".fa-chevron-up").hide();
                $(this).find(".fa-chevron-down").show();

                $(".question-list-knowledge").slideUp();
                ul.slideDown();

            }


        });
    }
</script>
</body>
</html>
