<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/6/11
  Time: 16:08
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
                    <a href="/admin/index" class="nav-link ">
                        <i class="am-icon-home"></i>
                        <span>留言板</span>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="#" class="nav-link active tpl-left-nav-link-list">
                        <i class="am-icon-bar-chart"></i>
                        <span>用户列表</span>
                        <i class="tpl-left-nav-content tpl-badge-danger">
                            <c:out value="${fn:length(users)}"></c:out>
                        </i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            User
        </div>
        <div class="tpl-content-scope">
            <div class="note note-info">
                <table class="am-table am-table-bordered am-table-striped am-table-hover">
                    <thead>
                    <tr style="text-align:center">
                        <th>用户名</th>
                        <th>密码</th>
                        <th>权限</th>
                    </tr>
                    </thead>
                    <c:if test="${users!=null}">
                        <tbody>
                        <c:forEach items="${users}" var="user">
                            <tr class="am-active" style="text-align:center">
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td><c:if test="${user.privilege==0}"><a href="#"
                                                                         class="am-badge am-badge-primary am-radius">用户</a>
                                    <a href="/admin/update?username=${user.username}"
                                       onclick="return confirm('确认升级为管理?')"><span
                                            class="am-icon-diamond"></span></a>
                                </c:if>
                                    <c:if test="${user.privilege==1}"><a href="#"
                                                                         class="am-badge am-badge-danger am-radius">管理
                                    </a>&nbsp;<a href="#"><span class="am-icon-user"></span></a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </c:if>
                </table>
                <ul class="am-pagination">
                    <li><a href="/admin/userinfo?page=${page.firstPage}">&laquo;</a></li>
                    <li><a href="/admin/userinfo?page=${page.prePage}">&lt;</a></li>
                    <li class="active"><a>${page.pageNum}</a></li>
                    <li><a href="/admin/userinfo?page=${page.nextPage}">&gt;</a></li>
                    <li><a href="/admin/userinfo?page=${page.lastPage}">&raquo;</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>

</html>