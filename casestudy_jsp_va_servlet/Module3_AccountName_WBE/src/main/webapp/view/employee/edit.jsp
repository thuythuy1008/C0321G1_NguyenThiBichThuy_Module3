<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/7/2021
  Time: 12:15 AM
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
            <form method="post">
                <input type="hidden" value="edit" name="action">
                <fieldset>
                    <legend>Employee Information</legend>
                    <table>
                        <c:if test="${employee != null}">
                            <input type="hidden" name="employeeId" id="employeeId" value="${employee.getEmployeeId()}">
                        </c:if>
                        <tr>
                            <th>Employee Name:</th>
                            <td><input type="text" name="employeeName" id="employeeName" value="${employee.getEmployeeName()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Birthday:</th>
                            <td><input type="date" name="employeeBirthday" id="employeeBirthday" value="${employee.getEmployeeBirthday()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Id Card:</th>
                            <td><input type="number" name="employeeIdCard" id="employeeIdCard" value="${employee.getEmployeeIdCard()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Salary:</th>
                            <td><input type="number" name="employeeSalary" id="employeeSalary" value="${employee.getEmployeeSalary()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Phone:</th>
                            <td><input type="number" name="employeePhone" id="employeePhone" value="${employee.getEmployeePhone()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Email:</th>
                            <td><input type="text" name="employeeEmail" id="employeeEmail" value="${employee.getEmployeeEmail()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Address:</th>
                            <td><input type="text" name="employeeAddress" id="employeeAddress" value="${employee.getEmployeeAddress()}"></td>
                        </tr>
                        <tr>
                            <th>Position Id:</th>
                            <td><input type="number" name="positionId" id="positionId" value="${employee.getPositionId()}"></td>
                        </tr>
                        <tr>
                            <th>Education Degree Id:</th>
                            <td><input type="number" name="educationDegreeId" id="educationDegreeId" value="${employee.getEducationDegreeId()}"></td>
                        </tr>
                        <tr>
                            <th>Division Id:</th>
                            <td><input type="number" name="divisionId" id="divisionId" value="${employee.getDivisionId()}"></td>
                        </tr>
                        <tr>
                            <th>User Name:</th>
                            <td><input type="text" name="userName" id="userName" value="${employee.getUserName()}"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Edit employee"></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<jsp:include page="/layout/bootstrap-js-footer.jsp"></jsp:include>
</body>
</html>
