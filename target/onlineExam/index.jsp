<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>\
    <link href="/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
    <style>
        *{color: #3c3c3c;
            font-weight: 600;}
        body{
            background: url("/images/bg.jpg") no-repeat;
        }
        .col-sm-4{
            margin-top: 300px!important;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-4 col-offset-sm-6">
            <shiro:guest>
                <h3>欢迎游客访问，<a href="${pageContext.request.contextPath}/login.jsp"><button class="btn btn-primary">点击登录</button> </a></h3><br/>
            </shiro:guest>
            <shiro:user>
              <h3>欢迎[<shiro:principal/>]登录，<a href="${pageContext.request.contextPath}/logout"><button class="btn btn-danger">点击退出</button> </a></h3>  <br/>
             <h3><a href="/toMyPage"><button class="btn btn-primary">点击前往</button></a></h3>
            </shiro:user>
        </div>
    </div>

</div>

            <script type="text/javascript" src="/js/jquery/jquery-1.9.0.min.js"></script>
            <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--    <title>Welcome</title>--%>
<%--    <link href="/bootstrap/css/bootstrap-huan.css" rel="stylesheet">--%>
<%--    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">--%>
<%--    <link href="/css/style.css" rel="stylesheet">--%>
<%--    <style>--%>

<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="jq22">--%>
<%--&lt;%&ndash;    <shiro:guest>&ndash;%&gt;--%>
<%--&lt;%&ndash;        欢迎游客访问，<a href="${pageContext.request.contextPath}/login.jsp">点击登录</a><br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </shiro:guest>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <shiro:user>&ndash;%&gt;--%>
<%--&lt;%&ndash;        欢迎[<shiro:principal/>]登录，<a href="${pageContext.request.contextPath}/logout">点击退出</a><br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </shiro:user>&ndash;%&gt;--%>
<%--</div>--%>

<%--<script type="text/javascript" src="/js/jquery/jquery-1.9.0.min.js"></script>--%>
<%--<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script type="text/javascript" src="/js/jquery.fireworks.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--    $('.jq22').fireworks({--%>
<%--        sound: false, // sound effect--%>
<%--        opacity: 0.9,--%>
<%--        width: '100%',--%>
<%--        height: '100%'--%>
<%--    });--%>
<%--</script>--%>

<%--</body>--%>
<%--</html>--%>