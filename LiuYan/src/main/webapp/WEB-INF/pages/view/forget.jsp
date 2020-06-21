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
    <title>忘记密码</title>
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
            重置密码
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
                <div class="login-center-img"><img src="/static/img/email.png"/></div>
                <div class="login-center-input">
                    <input type="email" value="" lay-verify="email|required" name="email" placeholder="请输入您的邮箱"
                           onfocus="this.placeholder=''"
                           onblur="this.placeholder='请输入您的邮箱'"/>
                    <div class="login-center-input-text">邮箱</div>
                </div>
            </div>
            <div class="register-button" id="forget">
                重置
            </div>
            <a href="/login">
                <div class="forget-button">
                    取消
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
        //重置
        $("#forget").click(function () {
            $.ajax({
                type: "post",
                url: "/forget.json",
                // contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: $("#form").serialize(),
                success: function (data) {
                    alert(data);
                    console.log(data)
                    if (data.code == "1") {
                        layer.msg(data.message);
                        setTimeout(function () {
                            window.location.href = "/login";
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