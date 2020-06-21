<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/6/9
  Time: 19:55
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                        <a href="">统计<span class="layui-badge">${page.total}</span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="/msg/add">留言<span
                                class="layui-icon layui-icon-edit"></span> </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="#" id="admin"><img src="/static/img/admin.gif"
                                                    class="layui-nav-img">${sessionScope.user.username}
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="/logout"><span
                                class="layui-icon layui-icon-logout"></span> 注销</a>
                    </li>
                </ul>
            </div>

            <div id="divMain">
                <c:if test="${msgs==null}"><h2>没有任何留言</h2></c:if>
                <c:forEach items="${msgs}" var="msg">
                    <div class="post multi-post cate4 auth1">
                        <h4 class="post-date">${msg.date}</h4>
                        <h2 class="post-title"><a href="#">${msg.title}</a></h2>
                        <div class="post-body"><p>
                            <c:if test="${fn:length(msg.content)>20}">${fn:substring(msg.content,0,20)}...</c:if>
                            <c:if test="${fn:length(msg.content)<=20}">${msg.content}</c:if>
                        </p></div>
                        <h6 class="post-footer">
                            From:${msg.sender} | To:${msg.receiver} | 回复:${msg.count} | <a
                                href="/msg/delete?id=${msg.id}"
                                onClick="return confirm('确定删除?')">删除</a>
                            | <a href="/msg/read?id=${msg.id}">阅读全文 > </a>
                        </h6>
                    </div>
                </c:forEach>
                <div class="post pagebar">
                    <h4 class="post-footer">
                        Total:${page.total}| Pages:${page.pages}
                    </h4>
                    <a
                            href="/user/index?page=${page.firstPage}"><span
                            class="page prev-page">&laquo;</span></a>
                    <a
                            href="/user/index?page=${page.prePage}"><span
                            class="page prev-page">&lt;</span></a>
                    <span class="page now-page">${page.pageNum}</span>
                    <a
                            href="/user/index?page=${page.nextPage}"><span
                            class="page next-page">&gt;</span></a>
                    <a
                            href="/user/index?page=${page.lastPage}"><span
                            class="page next-page">&raquo;</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        $("#admin").click(function () {
            $.ajax({
                type: "post",
                url: "/toadmin.json",
                success: function (data) {
                    if (data.code == "1") {
                        layer.msg(data.message);
                        window.location.href = "/admin/index";
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
</html>