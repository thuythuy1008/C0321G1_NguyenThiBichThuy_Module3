<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/6/2021
  Time: 3:12 PM
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
                <input type="hidden" name="action" value="createVilla">
                <fieldset>
                    <table >
                        <legend>Villa information</legend>
                        <tr>
                            <th>Service Code:</th>
                            <td>
                                <input class="form-control" type="text" name="serviceCode" id="serviceCode" size="45"
                                       aria-describedby="code_service" value="${service.getServiceCode()}"/>
                                <c:if test="${messServiceCode != null}">
                                    <small id="code_service" class="form-text text-danger">${messServiceCode}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Name:</th>
                            <td>
                                <input class="form-control" type="text" name="serviceName" id="serviceName" size="45"
                                       aria-describedby="name_service" value="${service.getServiceName()}"/>
                                <c:if test="${messServiceName != null}">
                                    <small id="name_service" class="form-text text-danger">${messServiceName}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Area:</th>
                            <td>
                                <input class="form-control" type="number" name="serviceArea" id="serviceArea" size="45"
                                       value="${service.getServiceArea()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Cost:</th>
                            <td>
                                <input class="form-control" type="number" name="serviceCost" id="serviceCost" size="45"
                                       aria-describedby="cost_service" value="${service.getServiceCost()}"/>
                                <c:if test="${messServiceCost != null}">
                                    <small id="cost_service" class="form-text text-danger">${messServiceCost}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Max People:</th>
                            <td>
                                <input class="form-control" type="number" name="serviceMaxPeople" id="serviceMaxPeople"
                                       size="45" value="${service.getServiceMaxPeople()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Standard Room:</th>
                            <td>
                                <input class="form-control" type="text" name="standardRoom" id="standardRoom" size="45"
                                       value="${service.getStandardRoom()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Description Other Convenience:</th>
                            <td>
                                <input class="form-control" type="text" name="descriptionOtherConvenience"
                                       id="descriptionOtherConvenience" size="45" value="${service.getDescriptionOtherConvenience()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Poll Area:</th>
                            <td>
                                <input class="form-control" type="number" name="pollArea" id="pollArea" size="45"
                                       value="${service.getPollArea()}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Number Of Floors:</th>
                            <td>
                                <input class="form-control" type="number" name="numberOfFloors" id="numberOfFloors" size="45"
                                       aria-describedby="numberOfFloors_service" value="${service.getNumberOfFloors()}"/>
                                <c:if test="${messNumberOfFloors != null}">
                                    <small id="numberOfFloors_service" class="form-text text-danger">${messNumberOfFloors}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Type:</th>
                            <td>
                                <select class="form-control" id="serviceTypeId" name="serviceTypeId"
                                        value="${service.getServiceTypeId()}">
                                    <option value="1" ${service.serviceTypeId == "1" ? 'selected': ''}>Thường</option>
                                    <option value="2" ${service.serviceTypeId == "2" ? 'selected': ''}>Vip</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Rent Type:</th>
                            <td>
                                <select class="form-control" id="rentTypeId" name="rentTypeId"
                                        value="${service.getRentTypeId()}">
                                    <option value="1" ${service.serviceTypeId == "1" ? 'selected': ''}>Ngày</option>
                                    <option value="2" ${service.serviceTypeId == "2" ? 'selected': ''}>Tuần</option>
                                    <option value="3" ${service.serviceTypeId == "3" ? 'selected': ''}>Tháng</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Create Villa"></td>
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
