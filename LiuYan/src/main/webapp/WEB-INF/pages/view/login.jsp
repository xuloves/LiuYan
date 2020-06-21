<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/6/10
  Time: 13:03
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="/static/css/mystyle.css">
    <link rel="stylesheet" type="text/css" href="/static/css/reset.css"/>
</head>
<body>

<div id="particles-js">
    <div class="login">
        <div class="login-top">
            登录
        </div>
        <form id="form">
            <div class="login-center clearfix">
                <div class="login-center-img"><img src="/static/img/name.png"/></div>
                <div class="login-center-input">
                    <input type="text" name="username" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=''"
                           onblur="this.placeholder='请输入您的用户名'"/>
                    <div class="login-center-input-text">用户名</div>
                </div>
            </div>
            <div class="login-center clearfix">
                <div class="login-center-img"><img src="/static/img/password.png"/></div>
                <div class="login-center-input">
                    <input type="password" name="password" value="" placeholder="请输入您的密码" onfocus="this.placeholder=''"
                           onblur="this.placeholder='请输入您的密码'"/>
                    <div class="login-center-input-text">密码</div>
                </div>
            </div>
            <div class="login-button">
                登陆
            </div>
            <a href="/register">
                <div class="register-button">
                    注册
                </div>
            </a>
            <a href="/forget">
                <div class="forget-button">
                    忘记密码
                </div>
            </a>
        </form>
    </div>
    <div class="sk-rotating-plane"></div>
</div>

<!-- scripts -->
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/particles.min.js"></script>
<script src="/static/js/myapp.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        //登录
        $(".login-button").click(function () {
            $.ajax({
                type: "get",
                url: "/login.json",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: $("#form").serialize(),
                success: function (data) {
                    if (data.code == "1") {
                        layer.msg(data.message);
                        setTimeout(function () {
                            window.location.href = "/index";
                        }, 1000);
                    } else {
                        layer.msg(data.message);
                    }
                }, error: function () {
                    layer.msg("操作失败");
                }
            });
        })
    })
</script>
</body>
</html>