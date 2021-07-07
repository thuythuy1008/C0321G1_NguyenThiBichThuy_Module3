<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/7/2021
  Time: 10:08 AM
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
            <jsp:include page="/layout/contract-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <form action="/contract" method="post">
                <input type="hidden" name="action" value="create">
                <fieldset>
                    <table >
                        <legend>Contract information</legend>
                        <tr>
                            <th>Contract Start Date:</th>
                            <td>
                                <input type="date" name="contractStartDate" id="contractStartDate" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Contract End Date:</th>
                            <td>
                                <input type="date" name="contractEndDate" id="contractEndDate" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Contract Deposit:</th>
                            <td>
                                <input type="number" name="contractDeposit" id="contractDeposit" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Contract Total Money:</th>
                            <td>
                                <input type="number" name="contractTotalMoney" id="contractTotalMoney" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Employee Id:</th>
                            <td>
                                <input type="number" name="employeeId" id="employeeId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Id:</th>
                            <td>
                                <input type="number" name="customerId" id="customerId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Id:</th>
                            <td>
                                <input type="number" name="serviceId" id="serviceId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Create Contract"></td>
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
