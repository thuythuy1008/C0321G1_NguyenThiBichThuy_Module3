<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/6/2021
  Time: 11:35 PM
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
            <jsp:include page="/layout/employee-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <center>
                <h1>Employee Management</h1>
            </center>
            <table id="tableEmployee" class="table table-striped table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>Employee Id</th>
                    <th>Employee Name</th>
                    <th>Employee Birthday</th>
                    <th>Employee Id Card</th>
                    <th>Employee Salary</th>
                    <th>Employee Phone</th>
                    <th>Employee Email</th>
                    <th>Employee Address</th>
                    <th>Position Id</th>
                    <th>Education Degree Id</th>
                    <th>Division Id</th>
                    <th>User Name</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${employeeList}">
                    <tr>
                        <td><c:out value="${customer.getEmployeeId()}"/></td>
                        <td><c:out value="${customer.getEmployeeName()}"/></td>
                        <td><c:out value="${customer.getEmployeeBirthday()}"/></td>
                        <td><c:out value="${customer.getEmployeeIdCard()}"/></td>
                        <td><c:out value="${customer.getEmployeeSalary()}"/></td>
                        <td><c:out value="${customer.getEmployeePhone()}"/></td>
                        <td><c:out value="${customer.getEmployeeEmail()}"/></td>
                        <td><c:out value="${customer.getEmployeeAddress()}"/></td>
                        <td><c:out value="${customer.getPositionId()}"/></td>
                        <td><c:out value="${customer.getEducationDegreeId()}"/></td>
                        <td><c:out value="${customer.getDivisionId()}"/></td>
                        <td><c:out value="${customer.getUserName()}"/></td>
                        <td>
                            <a class="btn btn-primary" href="/employee?action=edit&employeeId=${customer.getEmployeeId()}" role="button">Edit</a>
                            <a onclick="onDelete('${customer.getEmployeeId()}','${customer.getEmployeeName()}')" class="btn btn-danger"
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
                        <form action="/employee">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="customerId" value="" id="idEmployeeDel">
                            <div class="modal-body">
                                <div class="container-fluid">
                                    Bạn có muốn xóa <input style="border: none;outline: none;color: blue"
                                                           id="nameEmployeeDel">
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
    function onDelete(employeeId, employeeName) {
        document.getElementById("idEmployeeDel").value = employeeId;
        document.getElementById("nameEmployeeDel").value = employeeName;
    }
</script>
<script>
    $(document).ready(function() {
        $('#tableEmployee').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        } );
    } );
</script>
</body>
</html>
