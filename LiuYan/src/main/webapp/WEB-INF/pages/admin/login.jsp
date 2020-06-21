<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/6/11
  Time: 14:37
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <link rel="stylesheet" href="/static/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/static/css/admin.css">
    <link rel="stylesheet" href="/static/css/app.css">
</head>

<body data-type="login">

<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                Liu Yan<span> Login</span> <i class="am-icon-skyatlas"></i>

            </div>
        </div>

        <div class="login-font">
            <i>Log In </i> or <span> Sign Up</span>
        </div>
        <div class="am-u-sm-10 login-am-center">
            <form class="am-form" id="form">
                <fieldset>
                    <div class="am-form-group">
                        <input type="text" class="" name="username" id="doc-ipt-email-1" placeholder="输入用户名">
                    </div>
                    <div class="am-form-group">
                        <input type="password" name="password" class="" id="doc-ipt-pwd-1" placeholder="输入密码">
                    </div>
                    <p>
                        <a id="submit" class="am-btn am-btn-default">登录</a>
                    </p>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        //登录
        $("#submit").click(function () {
            $.ajax({
                type: "post",
                url: "/admin/login.json",
                dataType: "json",
                data: $("#form").serialize(),
                success: function (data) {
                    if (data.code == "1") {
                        layer.msg(data.message);
                        setTimeout(function () {
                            window.location.href = "/admin/index";
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