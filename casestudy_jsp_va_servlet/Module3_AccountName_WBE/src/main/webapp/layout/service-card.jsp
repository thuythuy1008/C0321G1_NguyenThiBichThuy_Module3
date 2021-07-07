<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/6/2021
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="row">
    <div class="card col-4" style="width: 18rem;">
    <img src="assert/image/villa.webp" class="card-img-top" alt="...">
    <div class="card-body">
    <h5 class="card-title">Villa service</h5>
<%--    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
    <a href="/service?action=createVilla" class="btn btn-primary">Add new Villa</a>
    </div>
    </div>

    <div class="card col-4" style="width: 18rem;">
    <img src="assert/image/house.jpg" class="card-img-top" alt="...">
    <div class="card-body">
    <h5 class="card-title">House service</h5>
<%--    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
    <a href="/service?action=createHouse" class="btn btn-primary">Add new House</a>
    </div>
    </div>

    <div class="card col-4" style="width: 18rem;">
    <img src="assert/image/room.jpg" class="card-img-top" alt="...">
    <div class="card-body">
    <h5 class="card-title">Room service</h5>
<%--    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
    <a href="/service?action=createRoom" class="btn btn-primary">Add new Room</a>
    </div>
    </div>
    </div>
</body>
</html>
