<%-- 
    Document   : Left
    Created on : May 31, 2024, 9:27:34 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>${(selectedCatId == o.typeId)?active: ""}</h1>
        <div class="col-md-3">
            <nav class="navbar bg-light">
                <ul class="navbar-nav">
                    <li class="nav-item active"><a href="/Workshop1/MainController?action=HomeUser"><h3><strong>Loại</strong></h3> </a></li>
                                    <c:forEach items="${listC}" var="o">
                        <li class="nav-item" ${(selectedCatId == o.typeId)?active: ""}><a href="/Workshop1/MainController?action=SelectCat&&cId=${o.typeId}" class="nav-link">${o.categoryName}</a></li>
                        </c:forEach> 
                </ul>
            </nav>
        </div>
    </body>
</html>
