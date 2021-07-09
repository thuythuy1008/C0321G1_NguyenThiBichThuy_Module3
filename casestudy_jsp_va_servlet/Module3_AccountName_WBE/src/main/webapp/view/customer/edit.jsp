<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/5/2021
  Time: 11:01 PM
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
                    <legend>Customer Information</legend>
                    <table>
                        <c:if test="${customer != null}">
                            <input class="form-control" type="hidden" name="customerId" id="customerId" value="${customer.getCustomerId()}">
                        </c:if>
                        <tr>
                            <th>Customer Code:</th>
                            <td><input class="form-control" type="text" name="customerCode" id="customerCode" value="${customer.getCustomerCode()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Name:</th>
                            <td><input class="form-control" type="text" name="customerName" id="customerName" value="${customer.getCustomerName()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Birthday:</th>
                            <td><input class="form-control" type="date" name="customerBirthday" id="customerBirthday" value="${customer.getCustomerBirthday()}"></td>
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
                            <td><input class="form-control" type="number" name="customerIdCard" id="customerIdCard" value="${customer.getCustomerIdCard()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Phone:</th>
                            <td><input class="form-control" type="number" name="customerPhone" id="customerPhone" value="${customer.getCustomerPhone()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Email:</th>
                            <td><input class="form-control" type="text" name="customerEmail" id="customerEmail" value="${customer.getCustomerEmail()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Address:</th>
                            <td><input class="form-control" type="text" name="customerAddress" id="customerAddress" value="${customer.getCustomerAddress()}"></td>
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
                            <td><input type="submit" value="Edit customer"></td>
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
