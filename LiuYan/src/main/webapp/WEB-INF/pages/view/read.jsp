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
    <link rel="stylesheet" href="/static/css/amazeui.min.css">

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
                <div class="layui-container">
                    <div class="layui-row">
                        <div class="layui-col-md3">
                            From:${msg.sender}
                            <hr class="layui-bg-black">
                        </div>
                        <div class="layui-col-md3">
                            To:${msg.receiver}
                            <hr class="layui-bg-black">
                        </div>
                        <div class="layui-col-md3">
                            Date:${msg.date}
                            <hr class="layui-bg-black">
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md9">
                            <h1 style="text-align: center">${msg.title}</h1>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md9">
                            <h3>${msg.content}</h3>
                            <hr class="layui-bg-blue">
                        </div>
                    </div>
                    <c:if test="${replys!=null}">
                        <div class="layui-row">
                            <div class="layui-col-md9">
                                <ul class="am-comments-list am-comments-list-flip">
                                    <c:forEach items="${replys}" var="rp">
                                        <li class="am-comment am-comment-highlight">
                                            <article class="am-comment">
                                                <a href="#link-to-user-home">
                                                    <img src="/static/img/admin.gif" alt="" class="am-comment-avatar"
                                                         width="48"
                                                         height="48"/>
                                                </a>

                                                <div class="am-comment-main">
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <a href="#link-to-user"
                                                               class="am-comment-author">${rp.commentator}</a>
                                                            回复于
                                                            <time datetime="${rp.date}">${rp.date}</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                            ${rp.content}
                                                    </div>
                                                </div>
                                            </article>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </c:if>

                    <div class="layui-row">
                        <div class="layui-col-md6">
                            <form style="text-align: center">
                                <div class="layui-form-item layui-form-text">
                                    <div class="layui-input-block">
                                        <input type="hidden" id="mid" name="mid" value="${msg.id}">
                                        <textarea name="content" id="content" placeholder="请输入内容"
                                                  class="layui-textarea"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <a class="layui-btn" id="submit">回复</a>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                        <a href="/index" class="layui-btn  layui-btn-normal">返回</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;

    });
    $(function () {
        //回复
        $("#submit").click(function () {
            var mid = $("#mid").val();
            var content = $("#content").val();
            data = {
                "mid": mid,
                "content": content
            };
            console.log(data);
            $.ajax({
                type: "post",
                url: "/msg/reply.json",
                // contentType: "application/json; charset=utf-8",
                //加此句ajax后台无法接收
                dataType: "json",
                data: data,
                success: function (data) {
                    if (data.code == "1") {
                        layer.msg(data.message);
                        setTimeout(function () {
                            window.location.reload();
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
</body>
</html>