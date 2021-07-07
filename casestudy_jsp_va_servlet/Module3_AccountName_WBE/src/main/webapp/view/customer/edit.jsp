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
                            <input type="hidden" name="customerId" id="customerId" value="${customer.getCustomerId()}">
                        </c:if>
                        <tr>
                            <th>Customer Code:</th>
                            <td><input type="text" name="customerCode" id="customerCode" value="${customer.getCustomerCode()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Name:</th>
                            <td><input type="text" name="customerName" id="customerName" value="${customer.getCustomerName()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Birthday:</th>
                            <td><input type="date" name="customerBirthday" id="customerBirthday" value="${customer.getCustomerBirthday()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Gender:</th>
                            <td><input type="text" name="customerGender" id="customerGender" value="${customer.getCustomerGender()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Id Card:</th>
                            <td><input type="number" name="customerIdCard" id="customerIdCard" value="${customer.getCustomerIdCard()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Phone:</th>
                            <td><input type="number" name="customerPhone" id="customerPhone" value="${customer.getCustomerPhone()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Email:</th>
                            <td><input type="text" name="customerEmail" id="customerEmail" value="${customer.getCustomerEmail()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Address:</th>
                            <td><input type="text" name="customerAddress" id="customerAddress" value="${customer.getCustomerAddress()}"></td>
                        </tr>
                        <tr>
                            <th>Customer Type Id:</th>
                            <td><input type="number" name="customerTypeId" id="customerTypeId" value="${customer.getCustomerTypeId()}"></td>
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
