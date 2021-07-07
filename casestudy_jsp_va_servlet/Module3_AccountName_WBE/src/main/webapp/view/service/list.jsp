<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/6/2021
  Time: 4:47 PM
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
            <jsp:include page="/layout/service-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <center>
                <h1>Service Management</h1>
            </center>
            <form action="/service" method="post">
                <input type="hidden" name="action" value="list">
                <fieldset>
            <table id="tableService" class="table table-striped table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>Service Id</th>
                    <th>Service Code</th>
                    <th>Service Name</th>
                    <th>Service Area</th>
                    <th>Service Cost</th>
                    <th>Service Max People</th>
                    <th>Standard Room</th>
                    <th>Description Other Convenience</th>
                    <th>Poll Area</th>
                    <th>Number Of Floors</th>
                    <th>Service Type Id</th>
                    <th>Rent Type Id</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${serviceList}">
                    <tr>
                        <td><c:out value="${customer.getServiceId()}"/></td>
                        <td><c:out value="${customer.getServiceCode()}"/></td>
                        <td><c:out value="${customer.getServiceName()}"/></td>
                        <td><c:out value="${customer.getServiceArea()}"/></td>
                        <td><c:out value="${customer.getServiceCost()}"/></td>
                        <td><c:out value="${customer.getServiceMaxPeople()}"/></td>
                        <td><c:out value="${customer.getStandardRoom()}"/></td>
                        <td><c:out value="${customer.getDescriptionOtherConvenience()}"/></td>
                        <td><c:out value="${customer.getPollArea()}"/></td>
                        <td><c:out value="${customer.getNumberOfFloors()}"/></td>
                        <td><c:out value="${customer.getServiceTypeId()}"/></td>
                        <td><c:out value="${customer.getRentTypeId()}"/></td>
                        <td>
                            <a class="btn btn-primary" href="/service?action=edit&serviceId=${customer.getServiceId()}" role="button">Edit</a>
                            <a onclick="onDelete('${customer.getServiceId()}','${customer.getServiceCode()}')" class="btn btn-danger"
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
                        <form action="/service">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="customerId" value="" id="idServiceDel">
                            <div class="modal-body">
                                <div class="container-fluid">
                                    Bạn có muốn xóa <input style="border: none;outline: none;color: blue"
                                                           id="codeServiceDel">
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
    function onDelete(serviceId, serviceCode) {
        document.getElementById("idServiceDel").value = serviceId;
        document.getElementById("codeServiceDel").value = serviceCode;
    }
</script>
<script>
    $(document).ready(function() {
        $('#tableService').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>
