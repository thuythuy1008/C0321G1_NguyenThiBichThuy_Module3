<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/6/2021
  Time: 11:54 PM
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
            <jsp:include page="/layout/customer-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <form action="/employee" method="post">
                <input type="hidden" name="action" value="create">
                <fieldset>
                    <table >
                        <legend>Employee information</legend>
                        <tr>
                            <th>Employee Name:</th>
                            <td>
                                <input type="text" name="employeeName" id="employeeName" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Birthday:</th>
                            <td>
                                <input type="date" name="employeeBirthday" id="employeeBirthday" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Id Card:</th>
                            <td>
                                <input type="number" name="employeeIdCard" id="employeeIdCard" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Salary:</th>
                            <td>
                                <input type="number" name="employeeSalary" id="employeeSalary" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Phone:</th>
                            <td>
                                <input type="number" name="employeePhone" id="employeePhone" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Email:</th>
                            <td>
                                <input type="text" name="employeeEmail" id="employeeEmail" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Address:</th>
                            <td>
                                <input type="text" name="employeeAddress" id="employeeAddress" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Position Id:</th>
                            <td>
                                <input type="number" name="positionId" id="positionId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Education Degree Id:</th>
                            <td>
                                <input type="number" name="educationDegreeId" id="educationDegreeId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Division Id:</th>
                            <td>
                                <input type="number" name="divisionId" id="divisionId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>User Name:</th>
                            <td>
                                <input type="text" name="userName" id="userName" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Create employee"></td>
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
