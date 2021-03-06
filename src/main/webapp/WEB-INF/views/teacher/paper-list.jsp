<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/2
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
<%--    <base href="<%=basePath%>">--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>草民考试试题管理</title>
    <meta name="keywords" content="">

    <link href="/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <link href="/css/exam.css" rel="stylesheet">
    <link href="/chart/morris.css" rel="stylesheet">
    <style>
        .change-property, .publish-paper, .delete-paper, .offline-paper{
            cursor:pointer;
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
                    <h1><a href="#">网站管理系统</a></h1>
                    <div class="hmeta">
                        专注互联网在线考试解决方案
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
                <!-- <li>
                    <a href="#"><i class="fa fa-home"></i>网站首页</a>
                </li> -->
                <li>
                    <a href="question-list.html"><i class="fa fa-edit"></i>试题管理</a>
                </li>

                <li class="active">
                    <a href="exampaper-list.html"><i class="fa fa-file-text-o"></i>试卷管理</a>
                </li>
                <!-- <li>
                    <a href="admin/user-list"><i class="fa fa-user"></i>会员管理</a>
                </li>
                <li>
                    <a href="admin/field-list-1"><i class="fa fa-cloud"></i>题库管理</a>
                </li>
                <li>
                    <a href="admin/sys-backup"><i class="fa fa-cogs"></i>网站设置</a>
                </li> -->
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
                    <li class="active">
                        <a href="exampaper-list.html"> <i class="fa fa-list-ul"></i> 试卷管理 </a>
                    </li>
                    <li>
                        <a href="/teacher/toAddPaper"> <i class="fa fa-file-text-o"></i> 创建新试卷 </a>
                    </li>
                </ul>

            </div>
            <div class="col-xs-9">
                <div class="page-header">
                    <h1><i class="fa fa-list-ul"></i> 试卷管理 </h1>
                </div>
                <div class="page-content row">




                    <div class="page-link-content">
                        <ul class="pagination pagination-sm">${pageStr}</ul>
                    </div>
                </div>
                <div id="question-list">
                    <table class="table-striped table">
                        <thead>
                        <tr>
                            <td></td><td>ID</td><td>试卷名称</td><td>时长</td> <td>创建人</td> <td>操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${papers}" var="item">
                            <tr>
                                <td>
                                    <input type="checkbox" value="${item.id }">
                                </td>
                                <td>${item.id }</td>
                                <td><a href="exampaper-preview/${item.id }" target="_blank" title="预览" class="td-paper-name">${item.papername }</a></td>
                                <td><span class="td-paper-duration">${item.allowtime}</span>分钟</td>
                                <!-- <td>
<%--													<c:if test="${item.paper_type == '1' }">--%>
<%--														<span class="td-paper-type" data-id="${item.paper_type}">--%>
<%--															随机组卷--%>
<%--														</span>--%>
<%--													</c:if>--%>
<%--													<c:if test="${item.paper_type == '2' }">--%>
<%--														<span class="td-paper-type" data-id="${item.paper_type}">--%>
<%--														模拟考试--%>
<%--														</span>--%>
<%--													</c:if>--%>
<%--													<c:if test="${item.paper_type == '3' }">--%>
<%--														<span class="td-paper-type" data-id="${item.paper_type}">--%>
<%--														专家试卷--%>
<%--														</span>--%>
<%--													</c:if>--%>
												</td> -->
                                <td>${item.creator }</td>
                                <!-- <td>
<%--													<c:choose>--%>
<%--														<c:when test="${item.status == 0 }">--%>
<%--															未上线--%>
<%--														</c:when>--%>
<%--														<c:when test="${item.status == 1 }">--%>
<%--															已上线--%>
<%--														</c:when>--%>
<%--														<c:when test="${item.status == 2 }">--%>
<%--															已下线--%>
<%--														</c:when>--%>
<%--													</c:choose>--%>
												</td> -->
                                <td>
                                    <c:choose>
                                        <c:when test="${item.paperstate == 0 }">
                                            <a href="exampaper-edit/${item.id}">修改内容</a>
                                            <!-- <a class="change-property">修改属性</a> -->
                                            <a class="publish-paper">上线</a>
                                            <a class="delete-paper">删除</a>
                                        </c:when>
                                        <c:when test="${item.paperstate == 1 }">
                                            <a class="offline-paper">下线</a>
                                        </c:when>
                                    </c:choose>

                                </td>
                            </tr>
                        </c:forEach>

                        </tbody><tfoot></tfoot>
                    </table>
                    <div class="modal fade" id="change-property-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h6 class="modal-title" id="myModalLabel">修改试卷属性</h6>
                                </div>
                                <div class="modal-body">
                                    <form id="question-add-form">
                                        <span id="add-update-exampaperid" style="display:none;"></span>
                                        <div class="form-line add-update-exampapername">
                                            <span class="form-label"><span class="warning-label">*</span>试卷名称：</span>
                                            <input type="text" class="df-input-narrow">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-line add-update-duration">
                                            <span class="form-label"><span class="warning-label">*</span>时长（分钟）：</span>
                                            <input type="text" class="df-input-narrow">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-line exampaper-type" id="exampaper-type">
                                            <span class="form-label"><span class="warning-label">*</span>分类：</span>
                                            <select id="exampaper-type-select" class="df-input-narrow">

                                                <option value="1">随机组卷</option>
                                                <option value="2">模拟考试</option>
                                                <option value="3">专家试卷</option>
                                            </select><span class="form-message"></span>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
                                    <button id="update-exampaper-btn" type="button" class="btn btn-primary">确定修改</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-link-content">
                    <a href="/teacher/toPaperList?pageNo=${pageInfo.firstPage}">第一页</a>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <a href="/teacher/toPaperList?pageNo=${pageInfo.pageNum-1}">上一页</a>
                    </c:if>
                    <c:if test="${pageInfo.hasNextPage}">
                        <a href="/teacher/toPaperList?pageNo=${pageInfo.pageNum+1}">下一页</a>
                    </c:if>
                    <a href="/teacher/toPaperList?pageNo=${pageInfo.lastPage}">第一页</a>
                </div>

            </div>
        </div>
    </div>
</div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="copy">
                    <p>
                        Exam++ Copyright © <a href="http://www.examxx.net/" target="_blank">Exam++</a> - <a href="." target="_blank">主页</a> | <a href="http://www.examxx.net/" target="_blank">关于我们</a> | <a href="http://www.examxx.net/" target="_blank">FAQ</a> | <a href="http://www.examxx.net/" target="_blank">联系我们</a>
                    </p>
                </div>
            </div>
        </div>

    </div>

</footer>

<!-- Slider Ends -->

<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript" src="/js/jquery/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="/js/all.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/exampaper-list.js"></script>
</body>
</html>