<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/30/2021
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to Product List</a>
</p>
<table>
    <tr>
        <td>ID : </td>
        <td>${product.getId()}</td>
    </tr>
    <tr>
        <td>Name : </td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price : </td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Description : </td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>Producer : </td>
        <td>${product.getProducer()}</td>
    </tr>
</table>
</body>
</html>
