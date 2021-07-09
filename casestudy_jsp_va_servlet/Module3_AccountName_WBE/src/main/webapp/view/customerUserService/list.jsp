<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/7/2021
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <center>
                <h1>Customer Information</h1>
            </center>
            <table id="tableCustomer" class="table table-striped table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>Customer Id</th>
                    <th>Customer Code</th>
                    <th>Customer Name</th>
                    <th>Customer Id Card</th>
                    <th>Customer Address</th>
                    <th>Contract Id</th>
                    <th>Contract Detail Id</th>
                    <th>Attach Service Name</th>
                    <th>Total Money</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${customerList}">
                    <tr>
                        <td><c:out value="${employee.getCustomerId()}"/></td>
                        <td><c:out value="${employee.getCustomerCode()}"/></td>
                        <td><c:out value="${employee.getCustomerName()}"/></td>
                        <td><c:out value="${employee.getCustomerIdCard()}"/></td>
                        <td><c:out value="${employee.getCustomerAddress()}"/></td>
                        <td><c:out value="${employee.getContractId()}"/></td>
                        <td><c:out value="${employee.getContractDetailId()}"/></td>
                        <td><c:out value="${employee.getAttachServiceName()}"/></td>
                        <td><c:out value="${employee.getTotalMoney()}"/></td>
                        <td>
                            <a class="btn btn-primary" href="/customerUserService?action=edit&customerId=${employee.getCustomerId()}" role="button">Edit</a>
                            <a onclick="onDelete('${employee.getCustomerId()}','${employee.getCustomerCode()}')" class="btn btn-danger"
                               role="button" data-toggle="modal" data-target="#modelId">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
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
                            <input type="hidden" name="customerId" value="" id="idCustomerDel">
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
<jsp:include page="/layout/footer.jsp"></jsp:include>
<jsp:include page="/layout/bootstrap-js-footer.jsp"></jsp:include>
<script>
    function onDelete(customerId, customerCode) {
        document.getElementById("idCustomerDel").value = customerId;
        document.getElementById("codeCustomerDel").value = customerCode;
    }
</script>
<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        } );
    } );
</script>
</body>
</html>
