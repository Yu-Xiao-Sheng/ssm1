<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿离机智的一逼
  Date: 2021/3/18
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新图书</title>
</head>
<body>
提示信息：${tip}
<form:form method="post" action="updateBook" modelAttribute="book">
    <div>
        <form:label path="id">图书ID：</form:label>
            <form:input path="id" />
        <div>
            <form:errors path="id"/>
        </div>
    </div>
    <div>
        <form:label path="title" >图书名：</form:label>
        <div>
            <form:input path="title" type="text" id="title" placeholder="请输入图书名"/>
        </div>
        <div>
            <form:errors path="title"/>
        </div>
    </div>
    <div>
        <form:label path="author">作者：</form:label>
        <div>
            <form:input path="author" id="price" type="text" placeholder="请输入作者名"/>
        </div>
        <div>
            <form:errors path="author" />
        </div>
    </div>

    <div>
        <form:label path="price">价格：</form:label>
        <div>
            <form:input path="price" id="price" type="number" placeholder="请输入价格"/>
        </div>
        <div>
            <form:errors path="price" />
        </div>
    </div>
    <div>
        <div>
            <form:button type="submit">修改</form:button>
            <form:button type="reset">重设</form:button>
        </div>
        <a href="${pageContext.request.contextPath}/books">返回</a>
    </div>
</form:form>

</body>
</html>
