<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/7/2021
  Time: 10:46 AM
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
            <jsp:include page="/layout/contractDetail-left.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <center>
                <h1>Contract Detail Management</h1>
            </center>
            <form action="/contractDetail" method="post">
                <input type="hidden" name="action" value="list">
                <fieldset>
                    <table id="tableContractDetail" class="table table-striped table-bordered" style="width: 100%">
                        <thead>
                        <tr>
                            <th>Contract Detail Id</th>
                            <th>Contract Id</th>
                            <th>Attach Service</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="contractDetail" items="${contractDetailList}">
                            <tr>
                                <td><c:out value="${contractDetail.getContractDetailId()}"/></td>
                                <td><c:out value="${contractDetail.getContractId()}"/></td>
                                <td>
<%--                                    <c:out value="${contractDetail.getAttachServiceId()}"/>--%>
                                    <c:choose>
                                        <c:when test="${contractDetail.getAttachServiceId()==1}"><p>Massage</p></c:when>
                                        <c:when test="${contractDetail.getAttachServiceId()==2}"><p>Karaoke</p></c:when>
                                        <c:when test="${contractDetail.getAttachServiceId()==3}"><p>Thức ăn</p></c:when>
                                        <c:when test="${contractDetail.getAttachServiceId()==4}"><p>Nước uống</p></c:when>
                                        <c:when test="${contractDetail.getAttachServiceId()==5}"><p>Xe thuê</p></c:when>
                                    </c:choose>
                                </td>
                                <td><c:out value="${contractDetail.getQuantity()}"/></td>
                                <td>
                                    <a class="btn btn-primary" href="/contractDetail?action=edit&contractDetailId=${contractDetail.getContractDetailId()}" role="button">Edit</a>
                                    <a onclick="onDelete('${contractDetail.getContractDetailId()}')" class="btn btn-danger"
                                       role="button" data-toggle="modal" data-target="#modelId">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Confirm</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="/contractDetail">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="contractDetailId" value="" id="idContractDetailDel">
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            Bạn có muốn xóa hợp đồng chi tiết?
                                            <%--                                            <input style="border: none;outline: none;color: blue"--%>
                                            <%--                                                                   id="idServiceDel">--%>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <button type="submit" class="btn btn-success">Ok</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>

        </div>
    </div>
</div>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<jsp:include page="/layout/bootstrap-js-footer.jsp"></jsp:include>
<script>
    function onDelete(contractDetailId) {
        document.getElementById("idContractDetailDel").value = contractDetailId;
    }
</script>
<script>
    $(document).ready(function() {
        $('#tableContractDetail').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>
