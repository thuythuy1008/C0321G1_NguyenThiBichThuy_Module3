<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/25/2021
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Customer List</title>
    <link rel="stylesheet" href="bootstrap4/css/bootstrap.css">
    <style>
      div {
        width: 100%;
        text-align: center;
      }
      table {
        border: 1px solid gray;
        width: 600px;
        height: 300px;
      }
      h2 {
        color: crimson;
      }
      th {
        text-align: left;
      }
      img {
        width: 50px;
        height: 50px;
      }
      .content {
        margin: 10px 200px;
      }
    </style>
  </head>
  <body>
  <div>
    <div>
      <h2>Danh sách khách hàng</h2>
    </div>
    <div class="content">
    <table class="table table-striped table-bordered" style="width: 70%">
      <thead>
      <tr>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Địa chỉ</th>
      <th>Ảnh</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="customer" items="${customer}" >
        <tr>
          <td>${customer.name}</td>
          <td>${customer.birthday}</td>
          <td>${customer.address}</td>
          <td><img src="${customer.image}"></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    </div>
  </div>
  <script src="jquery/jquery-3.5.1.min.js"></script>
  <script src="jquery/popper.min.js"></script>
  <script src="bootstrap4/js/bootstrap.js"></script>
  </body>
</html>
