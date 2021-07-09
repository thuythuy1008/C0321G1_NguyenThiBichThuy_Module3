<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <table>
                        <legend>Employee information</legend>
                        <tr>
                            <th>Employee Name:</th>
                            <td>
                                <input class="form-control" type="text" name="employeeName" id="employeeName"
                                       aria-describedby="name_employee" size="45" value="${employee.getEmployeeName()}"/>
                                <c:if test="${messEmployeeName != null}">
                                    <small id="name_employee" class="form-text text-danger">${messEmployeeName}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Birthday:</th>
                            <td>
                                <input class="form-control" type="date" name="employeeBirthday" id="employeeBirthday"
                                       size="45" value="${employee.getEmployeeBirthday()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Id Card:</th>
                            <td>
                                <input class="form-control" type="number" name="employeeIdCard" id="employeeIdCard"
                                       size="45" aria-describedby="idCard_employee" value="${employee.getEmployeeIdCard()}"/>
                                <c:if test="${messEmployeeIdCard != null}">
                                    <small id="idCard_employee" class="form-text text-danger">${messEmployeeIdCard}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Salary:</th>
                            <td>
                                <input class="form-control" type="number" name="employeeSalary" id="employeeSalary"
                                       size="45" aria-describedby="salary_employee" value="${employee.getEmployeeSalary()}"/>
                                <c:if test="${messEmployeeSalary != null}">
                                    <small id="salary_employee" class="form-text text-danger">${messEmployeeSalary}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Phone:</th>
                            <td>
                                <input class="form-control" type="number" name="employeePhone" id="employeePhone"
                                       size="45" aria-describedby="phone_employee" value="${employee.getEmployeePhone()}"/>
                                <c:if test="${messEmployeePhone != null}">
                                    <small id="phone_employee" class="form-text text-danger">${messEmployeePhone}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Email:</th>
                            <td>
                                <input class="form-control" type="text" name="employeeEmail" id="employeeEmail"
                                       size="45" aria-describedby="email_employee" value="${employee.getEmployeeEmail()}"/>
                                <c:if test="${messEmployeeEmail != null}">
                                    <small id="email_employee" class="form-text text-danger">${messEmployeeEmail}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Address:</th>
                            <td>
                                <input class="form-control" type="text" name="employeeAddress" id="employeeAddress"
                                       size="45" value="${employee.getEmployeeAddress()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Position:</th>
                            <td>
                                <select class="form-control" id="positionId" name="positionId"
                                        value="${employee.getPositionId()}">
                                    <option value="1" ${employee.positionId == "1" ? 'selected': ''}>Lễ tân</option>
                                    <option value="2" ${employee.positionId == "2" ? 'selected': ''}>Phục vụ</option>
                                    <option value="3" ${employee.positionId == "3" ? 'selected': ''}>Chuyên viên</option>
                                    <option value="4" ${employee.positionId == "4" ? 'selected': ''}>Giám sát</option>
                                    <option value="5" ${employee.positionId == "5" ? 'selected': ''}>Quản lý</option>
                                    <option value="6" ${employee.positionId == "6" ? 'selected': ''}>Giám đốc</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Education Degree Id:</th>
                            <td>
                                <select class="form-control" id="educationDegreeId" name="educationDegreeId"
                                        value="${employee.getEducationDegreeId()}">
                                    <option value="1" ${employee.educationDegreeId == "1" ? 'selected': ''}>Trung cấp</option>
                                    <option value="2" ${employee.educationDegreeId == "2" ? 'selected': ''}>Cao đẳng</option>
                                    <option value="3" ${employee.educationDegreeId == "3" ? 'selected': ''}>Đại học</option>
                                    <option value="4" ${employee.educationDegreeId == "4" ? 'selected': ''}>Sau đại học</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Division Id:</th>
                            <td>
                                <select class="form-control" id="divisionId" name="divisionId"
                                        value="${employee.getDivisionId()}">
                                    <option value="1" ${employee.divisionId == "1" ? 'selected': ''}>Sale – Marketing</option>
                                    <option value="2" ${employee.divisionId == "2" ? 'selected': ''}>Hành chính</option>
                                    <option value="3" ${employee.divisionId == "3" ? 'selected': ''}>Phục vụ</option>
                                    <option value="4" ${employee.divisionId == "4" ? 'selected': ''}>Quản lý</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>User Name:</th>
                            <td>
                                <input class="form-control" type="text" name="userName" id="userName" size="45"
                                       value="${employee.getUserName()}"/>
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
