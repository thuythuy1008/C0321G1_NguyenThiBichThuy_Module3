<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/6/2021
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <ul class="list-group">
    <li class="list-group-item active" aria-current="true">Employee item</li>
    <li class="list-group-item"><a href="/employee?action=create">Add new employee</a></li>
    <li class="list-group-item">
    <a href="#">Search employee</a>
    <form action="/employee?action=search" method="post">
    <input type="number" name="employeeId" placeholder="Nhập id" style="width: 90%">
    <input type="submit" value="Search employee">
    </form>
    </li>
    </ul>
</body>
</html>
