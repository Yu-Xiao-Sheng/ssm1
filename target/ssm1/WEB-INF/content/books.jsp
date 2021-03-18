<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿离机智的一逼
  Date: 2021/3/18
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书列表</title>
</head>
<body>
提示信息：${tip}
<a href="/bookForm">添加图书</a>
<table>
    <thead>
    <tr>
        <th scope="col">书名</th>
        <th scope="col">作者</th>
        <th scope="col">价格</th>
        <th scope="col">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${books}">
        <tr>
            <td>${item.title}</td>
            <td>${item.author}</td>
            <td>${item.price}</td>
            <td><a href="${pageContext.request.contextPath}/updateForm?id=${item.id}">修改</a>
                <a href="${pageContext.request.contextPath}/deleteBook?id=${item.id}" onclick="return confirm('请您确认是否真的删除?');">删除</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
