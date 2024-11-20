<%-- 
    Document   : DetailProduct
    Created on : Jun 13, 2024, 10:59:08 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Model.DTO.Product"%>
<%@page import="Model.DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Product</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <!--Icon cloundfare -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="css/DetailProduct.css" rel="stylesheet" type="text/css"/>
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
        <script src="js/DetailProduct.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <br>
        <br>
        <c:if test="${requestScope.productDetail == null}">
            <jsp:forward page="HomeUser.jsp"/>
        </c:if>
        <div class="container">
            ${requestScope.status}
            <hr>
            <div class="detail-product">
                <div class="row">
                    <div class="col-md-6 detail-image">
                        <img src="/Workshop1${productDetail.productImage}" class="img-fluid" alt="Cinque Terre">
                    </div>
                    <div class="col-md-6 detail-info">
                        <div class="col-md-12">
                            <h1><strong><span style="color: #052659;">${productDetail.productName} </span> 
                                    <c:if test="${productDetail.discount != 0}">
                                        <span class="badge badge-pill badge-danger">Sale ${productDetail.discount}%</span>
                                    </c:if>
                                </strong></h1>
                        </div>
                        <div class="col-md-12"><span class="sub-title">Mô tả : </span> ${productDetail.brief}</div>
                        <div class="col-md-12"><span class="sub-title">Loại : </span> ${productDetail.type.categoryName}</div>
                        <div class="col-md-12">
                            <div class="row">
                                <fmt:setLocale value="vi-VN" scope="page"/>
                                <div class="col-md-6"><span class="sub-title">Giá :</span> <fmt:formatNumber value="${productDetail.price}" /> VND</div>
                                <c:set value="${productDetail.price*(1 - productDetail.discount/100)}" var="priceDiscount"/>
                                <c:if test="${productDetail.discount != 0}">
                                    <div class="col-md-1">-</div>
                                    <div class="col-md-5" id="price-discount"><fmt:formatNumber value="${priceDiscount}"/> VND</div>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3"><span class="sub-title">Số Lượng</span></div>
                                <div class="col-md-1"><button class="btn btn-outline-secondary" onclick="negQuantity(${priceDiscount})">-</button></div>
                                <div class="col-md-3"><input onchange="changeQuantity(${priceDiscount})" type="number" class="form-control" value="1" id="quantity"/></div>
                                <div class="col-md-1" style="padding-left: 0;"><button class="btn btn-outline-secondary" onclick="addQuantity(${priceDiscount})" >+</button></div>
                            </div>
                        </div>
                        <div class="col-md-12 detail-buy">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href="/Workshop1/cart?action=change&&action2=addDetail&&pId=${productDetail.productId}" class="btn btn-outline-warning">Vào giỏ hàng</a>
                                    <a href="/Workshop1/MainController?action=CSKH" class="btn btn-outline-success">Mua Ngay</a>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <span class="text-danger h3">Tổng Tiền :  <span id="totalAmount" ><fmt:formatNumber value="${priceDiscount}"/></span> VND</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp" />
    </body>
</html>
