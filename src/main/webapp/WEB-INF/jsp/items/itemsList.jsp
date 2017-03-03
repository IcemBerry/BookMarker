<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Test</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/item/queryItem.action" method="post">
    <table width="100%" border="1">
        <tr>
            <td><input type="submit" value="SUBMIT"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td>Name</td>
            <td>Id</td>
            <td>Last login time</td>
        </tr>
        <c:forEach items="${user}" var="user" >
        <tr>
            <td>${user.name}</td>
            <td>${user.id}</td>
            <td>${user.name}</td>
        </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
