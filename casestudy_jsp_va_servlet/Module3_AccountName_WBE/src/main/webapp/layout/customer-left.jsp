<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/5/2021
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <ul class="list-group">
    <li class="list-group-item active" aria-current="true">Customer item</li>
    <li class="list-group-item"><a href="/customer?action=create">Add new customer</a></li>
    <li class="list-group-item">
    <a href="#">Search customer</a>
    <form action="/customer?action=search" method="post">
    <input type="number" name="customerId" placeholder="Nhập id" style="width: 90%">
    <input type="submit" value="Search customer">
    </form>
    </li>
    </ul>
</body>
</html>
