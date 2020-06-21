<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/6/9
  Time: 19:55
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Language" content="zh-CN"/>
    <title>Liuyan</title>
    <link rel="stylesheet" rev="stylesheet" href="/static/css/style.css" type="text/css" media="screen"/>
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <link rel="stylesheet" href="/static/layui/css/layui.css">

</head>
<body class="multi default">
<div id="divAll">
    <div id="divPage">
        <div id="divMiddle">
            <div id="divTop">
                <h1 id="BlogTitle">
                    LiuYan
                </h1>
            </div>
            <div class="layui-col-md12">
                <ul class="layui-nav">
                    <li class="layui-nav-item">
                        <a href="#">留言<span
                                class="layui-icon layui-icon-edit"></span> </a>
                    </li>
                </ul>
            </div>

            <div id="divMain">
                <form class="layui-form" id="form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">Title</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">To</label>
                        <div class="layui-input-block">
                            <select name="receiver" lay-verify="required">
                                <c:forEach items="${users}" var="user">
                                    <option value="${user.username}">${user.username}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">Content</label>
                        <div class="layui-input-block">
                            <textarea name="content" lay-verify="required" placeholder="请输入内容"
                                      class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <a class="layui-btn" id="submit">立即提交</a>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            <a href="/index" class="layui-btn  layui-btn-normal">返回</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;

    });
    $(function () {
        //留言
        $("#submit").click(function () {
            $.ajax({
                type: "post",
                url: "/msg/add.json",
                dataType: "json",
                data: $("#form").serialize(),
                success: function (data) {
                    if (data.code == "1") {
                        setTimeout(function () {
                            window.location.href = "/index";
                        }, 1000);
                    } else {
                        layer.msg(data.message);
                    }
                }, error: function (data) {
                    layer.msg("操作失败");
                }
            });
        })
    })
</script>
</html>