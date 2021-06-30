<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/29/2021
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="bootstrap4/css/bootstrap.css">

</head>
<body>
<h1>Products</h1>
<p>
    <a class="btn btn-primary" href="/products?action=create" role="button">Create</a>
</p>
<form action="/products?action=search" method="post">
        <input type="text" name="name" placeholder="Nhập tên sản phẩm">
        <input type="submit" value="Search Product">
</form>
<table class="table table-striped" border="1px" >
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Producer</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${product}" var="products">
        <tr>
            <td>${products.getId()}</td>
            <td>${products.getName()}</td>
            <td>${products.getPrice()}</td>
            <td>${products.getDescription()}</td>
            <td>${products.getProducer()}</td>
            <td><a  class="btn btn-primary" href="/products?action=edit&id=${products.getId()}" role="button">Edit</a></td>
            <td><a onclick="onDelete('${products.getId()}','${products.getName()}')" class="btn btn-primary"
                   role="button" data-toggle="modal" data-target="#modelId">Delete</a></td>
        </tr>
    </c:forEach>
</table>

<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/products">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="idProductDelete">
                <div class="modal-body">
                    <div class="container-fluid">
                        Bạn có muốn xóa <input style="border: none;outline: none;color: red"
                                                                  id="nameProductDelete">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Ok</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function onDelete(id, name) {
        document.getElementById("idProductDelete").value = id;
        document.getElementById("nameProductDelete").value = name;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="jquery/popper.min.js"></script>
<script src="bootstrap4/js/bootstrap.js"></script>
</body>
</html>