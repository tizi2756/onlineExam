<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/2
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />

    <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
    Remove this if you use the .htaccess -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title> 草民考试</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/exam.css" rel="stylesheet" type="text/css">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        body{
            background: url("/images/bg.jpg") no-repeat;
        }
    </style>
</head>
<body>

<!-- Navigation bar starts -->

<div class="navbar bs-docs-nav" role="banner">
    <div class="container">
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
                <!-- <li>
                    <a href="home"><i class="fa fa-home"></i>主页</a>
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

<div class="content" style="margin-bottom: 100px;">

    <div class="container">
        <div class="row">

            <div class="col-xs-12" style="padding-right: 0px;">
                <div class="def-bk" id="bk-exampaper">

                    <div class="expand-bk-content" id="bk-conent-exampaper">
                        <div id="exampaper-header">
                            <div id="exampaper-title">

                                <span id="exampaper-title-name">  试卷 </span>
                                <span style="display:none;" id="exampaper-id">1</span>
                            </div>


                        </div>
                        <form action="${ctx}/dealPaper.action" method="post" id="myForm" name="myForm">
                            <!-- <div class="typrography"> -->
                            <div class="container">
                                <!-- 试卷名称 -->
                                <h2 class="bars" align="center"><font color="blue">${paper.papername }</font></h2>
                                <div class="input-group">
                                    <h4 class="bars" align="left"><font color="blue">${selectQ}</font></h4>
                                </div>

                                <c:forEach items="${selList}" var="selType">
                                    <p><h4 class="bars" align="left">${selType.name }</h4></p>
                                    <div class="input-group">
                                        <input name="${selType.id }" type="radio" value="A" checked="checked"/><font size="4">${selType.optiona }</font></br>
                                        <input name="${selType.id }" type="radio" value="B"/><font size="4">${selType.optionb }</font></br>
                                        <input name="${selType.id}" type="radio" value="C"/><font size="4">${selType.optionc}</font></br>
                                        <input name="${selType.id }" type="radio" value="D"/><font size="4">${selType.optiond }</font></br>
                                            <%--  					<p><h4 class="bars"><font color="blue">我的答案：${errorBook.userAnswer } </font></h4></p>
                                                                <p><h4 class="bars">标准答案：${errorBook.question.answer }（ ${errorBook.question.answerDetail }）</h4></p>
                                                                <p><h4 class="bars"><font color="red">解析：${errorBook.question.remark }</font></h4></p> --%>
                                    </div>
                                </c:forEach>
<%--
<%--                                </c:forEach>--%>
                                <div class="grid_3 grid_5" align="center">
                                    <h3 class="t-button">
                                        <!-- <a href="javascript:;" onclick="submitPaper()"><span class="label label-success">提交试卷</span></a>&nbsp;&nbsp; -->

                                    </h3>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
            <div class="col-xs-3" style="padding-right: 0px;padding-bottom:15px;">
                <div class="def-bk" id="bk-exam-control">

                    <div class="def-bk-content" id="exam-control">

                        <div id="question-time" class="question-time-normal">
                            <span id="count_time"></span>
                        </div>
                        <div id="question-submit">
                            <button class="btn-primary btn" style="width:100%;">
                                交卷
                            </button>
                        </div>
                        <div id="exam-info" style="display:none;">
                            <span id="answer-hashcode"></span>
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
<script type="text/javascript" src="/js/jquery/jquery-1.9.0.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="js/all.js?v=0712"></script> -->
<script type="text/javascript" src="/js/paper-examing.js"></script>
导入我的js，看qq


</body>
</html>
