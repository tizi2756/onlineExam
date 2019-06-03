<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/30
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%--     <base href="<%=basePath%>"> --%>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>试题管理</title>
    <meta name="keywords" content="">

    <link href="/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <link href="/css/question-add.css" rel="stylesheet">
    <link href="/chart/morris.css" rel="stylesheet">
    <link href="/css/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        *{color: #3c3c3c ;font-weight: 600!important;}
        .navbar{
            background: pink;

        }
        .navbar .nav > li > a{
            color:white!important;
        }
        body{
            background: url("/images/bg.jpg") no-repeat;
        }
        .uploadify-button-text{
            text-decoration: underline;
        }

        span.add-img{
            text-decoration: underline;
            cursor:pointer;
        }

        span.add-img:hover{
            text-decoration: underline;
        }

        .swfupload {
            z-index: 10000 !important;
        }

        .add-content-img{
            display:block;
        }

        .diaplay-img{
            margin-right:5px;
        }

        .diaplay-img:hover{
            text-decoration: underline;

        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <div class="row">
            <div class="col-xs-5">
                <div class="logo">
                    <h1><a href="#">在线考试</a></h1>
                    <div class="hmeta">
                        自制的草民项目
                    </div>
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

                <li class="active">
                    <a href="/teacher/toPaperList"><i class="fa fa-edit"></i>试题管理</a>
                </li>

                <li>
                    <a href="/teacher/toPaperList"><i class="fa fa-file-text-o"></i>试卷管理</a>
                </li>


            </ul>
        </nav>
    </div>
</div>

<!-- Navigation bar ends -->

<!-- Slider starts -->

<div>
    <!-- Slider (Flex Slider) -->

    <div class="container" style="min-height:500px;">

        <div class="row">
            <div class="col-xs-3">
                <ul class="nav default-sidenav">
                    <li>
                        <a href="question-list.html"> <i class="fa fa-list-ul"></i> 试题管理 </a>

                    </li>
                    <li class="active">
                        <a> <i class="fa fa-pencil-square-o"></i> 添加试题 </a>

                    </li>
                    <!-- <li>
                        <a href="admin/question-import"> <i class="fa fa-cloud-upload"></i> 导入试题 </a>

                    </li> -->

                </ul>

            </div>
            <div class="col-xs-9">
                <div class="page-header">
                    <h1><i class="fa fa-pencil-square-o"></i> 添加试题 </h1>
                </div>
                <div class="message" class="error">${message}</div>
                <div class="page-content row">
                    <form action="/admin/questionAdd" method="post" id="question-add-form" style="margin-top:40px;">
                        <div class="form-line question-type" id="question-type">
                            <span class="form-label"><span class="warning-label">*</span>试题类型：</span>
                            <select id="question-type-select" class="df-input-narrow" name="typeId">

                                <option value="1">单选题</option>

                                <!-- <option value="2">多选题</option>


                                <option value="4">简答题</option> -->


                            </select><span class="form-message"></span>
                        </div>


                        <div class="form-line question-content">
                            <span class="form-label"><span class="warning-label">*</span>试题内容：</span>
                            <textarea class="add-question-ta" name="name" id="name"></textarea>
                            <!-- <span class="add-img add-content-img" style="width:100px;">添加图片</span> -->
                            <span class="form-message"></span>
                        </div>
                        <div class="form-line form-question-opt" style="display: block;">
                            <span class="form-label"><span class="warning-label">*</span>选项：</span>
                            <div class="add-opt-items">
										<span class="add-opt-item"><label class="que-opt-no">A</label>
											<input type="text" class="df-input-narrow form-question-opt-item" name="optiona" id="optiona">
                                            <!-- <span class="add-img add-opt-img">添加图片</span> -->
										</span>
                                <span class="add-opt-item"><label class="que-opt-no">B</label>
											<input type="text" class="df-input-narrow form-question-opt-item"name="optionb" id="optionb">
                                    <!-- <span class="add-img add-opt-img">添加图片</span> -->
										</span>
                                <span class="add-opt-item"><label class="que-opt-no">C</label>
											<input type="text" class="df-input-narrow form-question-opt-item" name="optionc" id="optionc">
                                    <!-- <span class="add-img add-opt-img">添加图片</span> <span><i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项"></i></span> -->
										</span>
                                <span class="add-opt-item"><label class="que-opt-no">D</label>
											<input type="text" class="df-input-narrow form-question-opt-item" name="optiond" id="optiond">
                                    <!-- <span class="add-img add-opt-img">添加图片</span> <span><i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项"></i></span> -->
										</span>
                            </div>
                            <!--	<div class="small-icon" id="ques-add-opt" title="娣诲姞閫夐」"></div>-->
                            <span id="ques-add-opt"><i class="small-icon fa fa-plus-square" title="添加选项"></i></span>
                            <br>
                            <span class="form-message"></span>
                        </div>
                        <div class="form-line form-question-answer1 correct-answer" style="display: block;">
                            <span class="form-label"><span class="warning-label">*</span>正确答案：</span>
                            <select class="df-input-narrow" name="answer">
                                <option value="A">A</option><option value="B">B</option><option value="C">C</option><option value="D">D</option>
                            </select><span class="form-message"></span>
                        </div>

                        <div class="form-line">
                            <input id="btn-save" value="保存" type="submit" class="df-submit"  >
                        </div>
                    </form>

                </div>

        </div>
    </div>

</div>



<!-- Slider Ends -->

<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript" src="/js/jquery/jquery-1.9.0.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<!-- <script type="text/javascript" src="js/all.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui-1.9.2.custom.min.js"></script> -->

<!-- <script type="text/javascript" src="js/uploadify/jquery.uploadify3.1Fixed.js"></script>
<script type="text/javascript" src="js/question-upload-img.js"></script>
<script type="text/javascript" src="js/field-2-point.js"></script> -->


<!-- Bootstrap JS -->
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/question-add.js"></script>

</body>
</html>