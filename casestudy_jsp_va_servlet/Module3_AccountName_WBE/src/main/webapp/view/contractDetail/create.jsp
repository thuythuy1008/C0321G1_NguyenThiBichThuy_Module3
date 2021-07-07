<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/7/2021
  Time: 11:01 AM
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
            <jsp:include page="/layout/contractDetail-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <form action="/contractDetail" method="post">
                <input type="hidden" name="action" value="create">
                <fieldset>
                    <table >
                        <legend>Contract Detail information</legend>
                        <tr>
                            <th>Contract Id:</th>
                            <td>
                                <input type="number" name="contractId" id="contractId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Attach Service Id:</th>
                            <td>
                                <input type="number" name="attachServiceId" id="attachServiceId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Quantity:</th>
                            <td>
                                <input type="number" name="quantity" id="quantity" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Create Contract Detail"></td>
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
