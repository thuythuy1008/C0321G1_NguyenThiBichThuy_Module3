<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/7/2021
  Time: 12:09 AM
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
            <jsp:include page="/layout/employee-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <table class="table table-striped">
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
                <%--                <c:forEach var="customer" items="${customer}">--%>
                <tr>
                    <td><c:out value="${employee.getEmployeeId()}"/></td>
                    <td><c:out value="${employee.getEmployeeName()}"/></td>
                    <td><c:out value="${employee.getEmployeeBirthday()}"/></td>
                    <td><c:out value="${employee.getEmployeeIdCard()}"/></td>
                    <td><c:out value="${employee.getEmployeeSalary()}"/></td>
                    <td><c:out value="${employee.getEmployeePhone()}"/></td>
                    <td><c:out value="${employee.getEmployeeEmail()}"/></td>
                    <td><c:out value="${employee.getEmployeeAddress()}"/></td>
                    <td><c:out value="${employee.getPositionId()}"/></td>
                    <td><c:out value="${employee.getEducationDegreeId()}"/></td>
                    <td><c:out value="${employee.getDivisionId()}"/></td>
                    <td><c:out value="${employee.getUserName()}"/></td>
                    <td>
                        <a class="btn btn-primary" href="/employee?action=edit&employeeId=${employee.getEmployeeId()}" role="button">Edit</a>
                        <a onclick="onDelete('${employee.getEmployeeId()}','${employee.getEmployeeName()}')" class="btn btn-danger"
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
<script>
    function onDelete(employeeId, employeeName) {
        document.getElementById("idEmployeeDel").value = employeeId;
        document.getElementById("nameEmployeeDel").value = employeeName;
    }
</script>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<jsp:include page="/layout/bootstrap-js-footer.jsp"></jsp:include>
</body>
</html>
