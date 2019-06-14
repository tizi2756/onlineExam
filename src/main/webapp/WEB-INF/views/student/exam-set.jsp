<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/11
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>loading</title>
    <link href="../resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row">
        <h3 style="margin-top:100px">
            正在提交中，请等待服务器响应
        </h3>
        <div class="bs-example" data-example-id="animated-progress-bar">
            <div class="progress">
                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" ><span class="sr-only"> </span></div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/jquery/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            var i=0;

            var timer=setInterval(function(){

                $(".progress-bar").width(i);
                i=i+5;
                if($(".progress-bar").width()>=$(".progress").width()){
                    $("h3").html("提交完成");
                    clearInterval(timer);
                }
            },50)

        })
    </script>
</body>
</html>
