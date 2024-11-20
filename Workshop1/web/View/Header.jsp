<%-- 
    Document   : Header
    Created on : Jun 1, 2024, 8:28:23 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <!--         Latest compiled and minified CSS 
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        
                 jQuery library 
                <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        
                 Popper JS 
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        
                 Latest compiled JavaScript 
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>-->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body>
        <!--Xét người dùng còn tại tại hay không ? -->
        <nav class="  navbar navbar-expand-sm fixed-top d-flex" style="font-size: 30px; background-color: #021024; border-radius: 0px;">
            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item mr-5">
                    <a class="nav-link active text-light" href="/Workshop1/home"><strong>Trang Chủ</strong></a>
                </li>
                <c:if test="${role == 1 || role == 0}">
                    <li class="nav-item mr-3"><a href="/Workshop1/MainController?action=Dashboard&&action2=DashAccount" class="nav-link ">Tài Khoản</a></li>
                    <li class="nav-item mr-3"><a href="/Workshop1/MainController?action=Dashboard&&action2=DashCategory" class="nav-link ">Thể Loại</a></li>
                    <li class="nav-item mr-3"><a href="/Workshop1/MainController?action=Dashboard&&action2=DashProduct" class="nav-link ">Sản Phẩm</a></li>
                    </c:if>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/Workshop1/cart?action=cartForward">Giỏ Hàng</a>
                </li>
            </ul>
            <c:set var="user" value="guess"/>
            <c:if test="${sessionScope.valueUser == user || sessionScope.valueUser == null}">
                <ul class="navbar-nav account ml-auto">
                    <li class="nav-item account-section">
                        <a class="nav-link" href="/Workshop1/MainController?action=Login">Đăng Nhập</a>
                    </li>
                </ul> 
            </c:if> 
            <c:if test="${sessionScope.valueUser!= null && sessionScope.valueUser!= user}">
                <ul class="navbar-nav ml-auto mr-3">
                    <li class="nav-item">
                        <a class="nav-link" href="/Workshop1/MainController?action=LogOut">Đăng Xuất <span class="fa fa-sign-out"></span></a>
                    </li>
                </ul> 
                <ul class="navbar-nav account">
                    <li class="nav-item ">
                        <a class="nav-link" href="#"><span class="fa fa-user-circle"></span></a>
                        <div class="tool-tip bg-light" style="font-size: 14px;">
                            <p><strong>Xin Chào : </strong>${a.lastName} ${a.firstName}</p>
                            <div class="row">
                                <div class="col-md-5">
                                    <a href="/Workshop1/MainController?action=Profile&&action2=View" class="btn btn-outline-secondary">Hồ Sơ</a>
                                </div>
                                <div class="col-md-6">
                                    <a href="/Workshop1/MainController?action=LogOut" class="btn btn-outline-secondary">Đăng Xuất</a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul> 
            </c:if>
        </nav>
        <div style="margin-bottom: 100px;"></div>
    </body>
</html>
