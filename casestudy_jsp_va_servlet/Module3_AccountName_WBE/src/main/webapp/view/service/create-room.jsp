<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/6/2021
  Time: 8:12 PM
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
            <jsp:include page="/layout/service-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <form action="/service" method="post">
                <input type="hidden" name="action" value="createRoom">
                <fieldset>
                    <table >
                        <legend>Room information</legend>
                        <tr>
                            <th>Service Code:</th>
                            <td>
                                <input type="text" name="serviceCode" id="serviceCode" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Name:</th>
                            <td>
                                <input type="text" name="serviceName" id="serviceName" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Area:</th>
                            <td>
                                <input type="number" name="serviceArea" id="serviceArea" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Cost:</th>
                            <td>
                                <input type="number" name="serviceCost" id="serviceCost" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Max People:</th>
                            <td>
                                <input type="number" name="serviceMaxPeople" id="serviceMaxPeople" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Type Id:</th>
                            <td>
                                <input type="number" name="serviceTypeId" id="serviceTypeId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Rent Type Id:</th>
                            <td>
                                <input type="number" name="rentTypeId" id="rentTypeId" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Create Room"></td>
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
