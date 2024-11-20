<%-- 
    Document   : MainContent
    Created on : May 31, 2024, 9:43:20 PM
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
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="col-md-9 card-gap-format">
            <div class="col-md-12" style="margin-bottom: 10px; padding: 0px;">
                <form method="post" action="/Workshop1/MainController?action=SearchProduct">
                    <div class="col-md-12" style="padding: 0;" >
                        <div class="input-group mb-3">
                            <input type="text" class="form-control"  value="${valueSearched}" name="searchName" style="height: 50px; font-size: 20px;" placeholder="Enter product name to search">
                            <div class="input-group-append">
                                <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row col-md-12">
                <c:forEach items="${listP}" var="o">
                    <div class="card col-md-6" style="width:200px;  margin-bottom: 10px;">
                        <img class="card-img-top" src="/Workshop1${o.productImage}" alt="Card Image" width="100%" height="330px">
                        <div class="card-body">
                            <h2 class="card-title" style="height: 50px;"><strong>${o.productName}</strong></h2>
<!--                            <p class="card-text"> ${o.brief}</p>-->
                            <a href="/Workshop1/cart?action=change&&action2=addToCart&&pId=${o.productId}" class="btn btn-primary add-cart" style="font-size: 20px;">Thêm giỏ hàng</a>
                            <button class="btn btn-info" style="font-size: 20px;"><a href="/Workshop1/MainController?action=DetailProduct&&pId=${o.productId}" class="text-light" style="text-decoration: none;">Chi Tiết</a></button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
