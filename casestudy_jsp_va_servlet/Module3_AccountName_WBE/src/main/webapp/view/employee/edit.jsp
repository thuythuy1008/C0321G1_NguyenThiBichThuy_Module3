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
                            <input class="form-control" type="hidden" name="employeeId" id="employeeId"
                                   value="${employee.getEmployeeId()}">
                        </c:if>
                        <tr>
                            <th>Employee Name:</th>
                            <td><input class="form-control" type="text" name="employeeName" id="employeeName"
                                       value="${employee.getEmployeeName()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Birthday:</th>
                            <td><input class="form-control" type="date" name="employeeBirthday" id="employeeBirthday"
                                       value="${employee.getEmployeeBirthday()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Id Card:</th>
                            <td><input class="form-control" type="number" name="employeeIdCard" id="employeeIdCard"
                                       value="${employee.getEmployeeIdCard()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Salary:</th>
                            <td><input class="form-control" type="number" name="employeeSalary" id="employeeSalary"
                                       value="${employee.getEmployeeSalary()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Phone:</th>
                            <td><input class="form-control" type="number" name="employeePhone" id="employeePhone"
                                       value="${employee.getEmployeePhone()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Email:</th>
                            <td><input class="form-control" type="text" name="employeeEmail" id="employeeEmail"
                                       value="${employee.getEmployeeEmail()}"></td>
                        </tr>
                        <tr>
                            <th>Employee Address:</th>
                            <td><input class="form-control" type="text" name="employeeAddress" id="employeeAddress"
                                       value="${employee.getEmployeeAddress()}"></td>
                        </tr>
                        <tr>
                            <th>Position:</th>
                            <td>
                                <select class="form-control" id="positionId" name="positionId"
                                        value="${employee.getPositionId()}">
                                    <option value="1" ${employee.positionId == "1" ? 'selected': ''}>L??? t??n</option>
                                    <option value="2" ${employee.positionId == "2" ? 'selected': ''}>Ph???c v???</option>
                                    <option value="3" ${employee.positionId == "3" ? 'selected': ''}>Chuy??n vi??n
                                    </option>
                                    <option value="4" ${employee.positionId == "4" ? 'selected': ''}>Gi??m s??t</option>
                                    <option value="5" ${employee.positionId == "5" ? 'selected': ''}>Qu???n l??</option>
                                    <option value="6" ${employee.positionId == "6" ? 'selected': ''}>Gi??m ?????c</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Education Degree:</th>
                            <td>
                                <select class="form-control" id="educationDegreeId" name="educationDegreeId"
                                        value="${employee.getEducationDegreeId()}">
                                    <option value="1" ${employee.educationDegreeId == "1" ? 'selected': ''}>Trung c???p
                                    </option>
                                    <option value="2" ${employee.educationDegreeId == "2" ? 'selected': ''}>Cao ?????ng
                                    </option>
                                    <option value="3" ${employee.educationDegreeId == "3" ? 'selected': ''}>?????i h???c
                                    </option>
                                    <option value="4" ${employee.educationDegreeId == "4" ? 'selected': ''}>Sau ?????i
                                        h???c
                                    </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Division:</th>
                            <td>
                                <select class="form-control" id="divisionId" name="divisionId"
                                        value="${employee.getDivisionId()}">
                                    <option value="1" ${employee.divisionId == "1" ? 'selected': ''}>Sale ??? Marketing
                                    </option>
                                    <option value="2" ${employee.divisionId == "2" ? 'selected': ''}>H??nh ch??nh</option>
                                    <option value="3" ${employee.divisionId == "3" ? 'selected': ''}>Ph???c v???</option>
                                    <option value="4" ${employee.divisionId == "4" ? 'selected': ''}>Qu???n l??</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>User Name:</th>
                            <td><input class="form-control" type="text" name="userName" id="userName"
                                       value="${employee.getUserName()}"></td>
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
