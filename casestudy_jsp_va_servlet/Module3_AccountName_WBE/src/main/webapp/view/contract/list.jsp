<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/7/2021
  Time: 9:34 AM
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
            <jsp:include page="/layout/contract-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <center>
                <h1>Contract Management</h1>
            </center>
            <form action="/contract" method="post">
                <input type="hidden" name="action" value="list">
                <fieldset>
                    <table id="tableContract" class="table table-striped table-bordered" style="width: 100%">
                        <thead>
                        <tr>
                            <th>Contract Id</th>
                            <th>Contract Start Date</th>
                            <th>Contract End Date</th>
                            <th>Contract Deposit</th>
                            <th>Contract Total Money</th>
                            <th>Employee Id</th>
                            <th>Customer Id</th>
                            <th>Service Id</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="customer" items="${contractList}">
                            <tr>
                                <td><c:out value="${customer.getContractId()}"/></td>
                                <td><c:out value="${customer.getContractStartDate()}"/></td>
                                <td><c:out value="${customer.getContractEndDate()}"/></td>
                                <td><c:out value="${customer.getContractDeposit()}"/></td>
                                <td><c:out value="${customer.getContractTotalMoney()}"/></td>
                                <td><c:out value="${customer.getEmployeeId()}"/></td>
                                <td><c:out value="${customer.getCustomerId()}"/></td>
                                <td><c:out value="${customer.getServiceId()}"/></td>
                                <td>
                                    <a class="btn btn-primary" href="/contract?action=edit&contractId=${customer.getContractId()}" role="button">Edit</a>
                                    <a onclick="onDelete('${customer.getContractId()}')" class="btn btn-danger"
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
                                <form action="/contract">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="customerId" value="" id="idServiceDel">
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            Bạn có muốn xóa hợp đồng?
<%--                                            <input style="border: none;outline: none;color: blue"--%>
<%--                                                                   id="idServiceDel">--%>
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
                </fieldset>
            </form>

        </div>
    </div>
</div>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<jsp:include page="/layout/bootstrap-js-footer.jsp"></jsp:include>
<script>
    function onDelete(contractId) {
        document.getElementById("idServiceDel").value = contractId;
    }
</script>
<script>
    $(document).ready(function() {
        $('#tableContract').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>
