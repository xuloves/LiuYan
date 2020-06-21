<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/6/11
  Time: 15:07
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<c:import url="header.jsp"></c:import>
<div class="tpl-page-container tpl-page-header-fixed">
    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-title">
            Liu Yan 列表
        </div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="#" class="nav-link active">
                        <i class="am-icon-home"></i>
                        <span>留言板</span>
                        <i class="tpl-left-nav-content tpl-badge-danger">
                            <c:out value="${fn:length(msgs)}"></c:out>
                        </i>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="/admin/userinfo" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-bar-chart"></i>
                        <span>用户列表</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            Liu Yan Ban
        </div>
        <div class="tpl-content-scope">
            <div class="note note-info">
                <table class="am-table am-table-bordered am-table-striped am-table-hover">
                    <thead>
                    <tr style="text-align:center">
                        <th>Title</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Date</th>
                        <th><span class="am-icon-cog"></span></th>
                    </tr>
                    </thead>
                    <c:if test="${msgs!=null}">
                        <tbody>
                        <c:forEach items="${msgs}" var="msg">
                            <tr class="am-active" style="text-align:center">
                                <td>${msg.title}</td>
                                <td>${msg.sender}</td>
                                <td>${msg.receiver}</td>
                                <td>${msg.date}</td>
                                <td><a href="/admin/delete?id=${msg.id}" onclick="return confirm('确定删除?')">
                                    <span class="am-icon-trash"></span></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </c:if>
                </table>
                <ul class="am-pagination">
                    <li><a href="/admin/index?page=${page.firstPage}">&laquo;</a></li>
                    <li><a href="/admin/index?page=${page.prePage}">&lt;</a></li>
                    <li class="active"><a>${page.pageNum}</a></li>
                    <li><a href="/admin/index?page=${page.nextPage}">&gt;</a></li>
                    <li><a href="/admin/index?page=${page.lastPage}">&raquo;</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>

</html>