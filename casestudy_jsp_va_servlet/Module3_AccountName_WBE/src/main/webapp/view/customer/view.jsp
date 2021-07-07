<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/5/2021
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/layout/bootstrap-js-head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/navbar.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-2">
            <jsp:include page="/layout/left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Customer Id</th>
                    <th>Customer Code</th>
                    <th>Customer Name</th>
                    <th>Customer Birthday</th>
                    <th>Customer Gender</th>
                    <th>Customer Id Card</th>
                    <th>Customer Phone</th>
                    <th>Customer Email</th>
                    <th>Customer Address</th>
                    <th>Customer Type Id</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
<%--                <c:forEach var="customer" items="${customer}">--%>
                    <tr>
                        <td><c:out value="${customer.getCustomerId()}"/></td>
                        <td><c:out value="${customer.getCustomerCode()}"/></td>
                        <td><c:out value="${customer.getCustomerName()}"/></td>
                        <td><c:out value="${customer.getCustomerBirthday()}"/></td>
                        <td><c:out value="${customer.getCustomerGender()}"/></td>
                        <td><c:out value="${customer.getCustomerIdCard()}"/></td>
                        <td><c:out value="${customer.getCustomerPhone()}"/></td>
                        <td><c:out value="${customer.getCustomerEmail()}"/></td>
                        <td><c:out value="${customer.getCustomerAddress()}"/></td>
                        <td><c:out value="${customer.getCustomerTypeId()}"/></td>
                        <td>
                            <a  class="btn btn-primary" href="/customer?action=edit&id=${customer.getCustomerId()}" role="button">Edit</a>
                            <a onclick="onDelete('${customer.getCustomerId()}','${customer.getCustomerCode()}')" class="btn btn-danger"
                               role="button" data-toggle="modal" data-target="#modelId">Delete</a>
                        </td>
                    </tr>
<%--                </c:forEach>--%>
                </tbody>
            </table>

            <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/customer">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="" id="idCustomerDel">
                            <div class="modal-body">
                                <div class="container-fluid">
                                    Bạn có muốn xóa <input style="border: none;outline: none;color: blue"
                                                           id="codeCustomerDel">
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

        </div>
    </div>
</div>
<script>
    function onDelete(customerId, customerCode) {
        document.getElementById("idProductDel").value = customerId;
        document.getElementById("nameProductDel").value = customerCode;
    }
</script>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<jsp:include page="/layout/bootstrap-js-footer.jsp"></jsp:include>
</body>
</html>
