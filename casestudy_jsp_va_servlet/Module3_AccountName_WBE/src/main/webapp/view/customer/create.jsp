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
                    <table >
                        <legend>Customer information</legend>
                        <tr>
                            <th>Customer Code:</th>
                            <td>
                                <input type="text" name="customerCode" id="customerCode" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Name:</th>
                            <td>
                                <input type="text" name="customerName" id="customerName" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Birthday:</th>
                            <td>
                                <input type="date" name="customerBirthday" id="customerBirthday" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Gender:</th>
                            <td>
                                <input type="text" name="customerGender" id="customerGender" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Id Card:</th>
                            <td>
                                <input type="number" name="customerIdCard" id="customerIdCard" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Phone:</th>
                            <td>
                                <input type="number" name="customerPhone" id="customerPhone" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Email:</th>
                            <td>
                                <input type="text" name="customerEmail" id="customerEmail" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Address:</th>
                            <td>
                                <input type="text" name="customerAddress" id="customerAddress" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Type Id:</th>
                            <td>
                                <input type="number" name="customerTypeId" id="customerTypeId" size="45"/>
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
