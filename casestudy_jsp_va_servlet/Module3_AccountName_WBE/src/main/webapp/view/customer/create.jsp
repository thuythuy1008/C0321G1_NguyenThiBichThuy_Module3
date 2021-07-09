<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/5/2021
  Time: 9:25 PM
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
            <form action="/customer" method="post">
                <input type="hidden" name="action" value="create">
                <fieldset>
                    <table>
                        <legend>Customer information</legend>
                        <tr>
                            <th>Customer Code:</th>
                            <td>
                                <input type="text" class="form-control" name="customerCode" id="customerCode"
                                       aria-describedby="code_customer" size="45"
                                       value="${customer.getCustomerCode()}"/>
                                <c:if test="${messCustomerCode != null}">
                                    <small id="code_customer" class="form-text text-danger">${messCustomerCode}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Name:</th>
                            <td>
                                <input type="text" class="form-control" name="customerName" id="customerName"
                                       aria-describedby="name_customer" size="45" value="${customer.getCustomerName()}"/>
                                <c:if test="${messCustomerName != null}">
                                    <small id="name_customer" class="form-text text-danger">${messCustomerName}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Birthday:</th>
                            <td>
                                <input type="date" class="form-control" name="customerBirthday" id="customerBirthday"
                                       size="45" value="${customer.getCustomerBirthday()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Gender:</th>
                            <td>
                                <select class="form-control" id="customerGender" name="customerGender" value="${customer.getCustomerGender()}">
                                    <option value="Nam" ${customer.customerGender == "Nam" ? 'selected': ''}>Nam</option>
                                    <option value="Nữ" ${customer.customerGender == "Nữ" ? 'selected': ''}>Nữ</option>
                                    <option value="Khác" ${customer.customerGender == "Khác" ? 'selected': ''}>Khác</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Id Card:</th>
                            <td>
                                <input type="number" class="form-control" name="customerIdCard" id="customerIdCard"
                                       aria-describedby="idCard_customer" size="45"
                                       value="${customer.getCustomerIdCard()}"/>
                                <c:if test="${messCustomerIdCard != null}">
                                    <small id="idCard_customer"
                                           class="form-text text-danger">${messCustomerIdCard}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Phone:</th>
                            <td>
                                <input type="number" class="form-control" name="customerPhone" id="customerPhone"
                                       aria-describedby="phone_customer" size="45"
                                       value="${customer.getCustomerPhone()}"/>
                                <c:if test="${messCustomerPhone != null}">
                                    <small id="phone_customer"
                                           class="form-text text-danger">${messCustomerPhone}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Email:</th>
                            <td>
                                <input type="text" class="form-control" name="customerEmail" id="customerEmail"
                                       aria-describedby="email_customer" size="45"
                                       value="${customer.getCustomerEmail()}"/>
                                <c:if test="${messCustomerEmail != null}">
                                    <small id="email_customer"
                                           class="form-text text-danger">${messCustomerEmail}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Address:</th>
                            <td>
                                <input type="text" class="form-control" name="customerAddress" id="customerAddress"
                                       size="45" value="${customer.getCustomerAddress()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Type:</th>
                            <td>
                                <select class="form-control" id="customerTypeId" name="customerTypeId" value="${customer.getCustomerTypeId()}">
                                    <option value="1" ${customer.customerTypeId == 1 ? 'selected': ''}>Diamond</option>
                                    <option value="2" ${customer.customerTypeId == 2 ? 'selected': ''}>Platinium</option>
                                    <option value="3" ${customer.customerTypeId == 3 ? 'selected': ''}>Gold</option>
                                    <option value="4" ${customer.customerTypeId == 4 ? 'selected': ''}>Silver</option>
                                    <option value="5" ${customer.customerTypeId == 5 ? 'selected': ''}>Member</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Create customer"></td>
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
