<%-- 
    Document   : UpdateProduct
    Created on : Jun 13, 2024, 10:29:56 PM
    Author     : ADMIN
--%>

<%@page import="java.io.File"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Model.DTO.Product"%>
<%@page import="Model.DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <title>Update Product</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <!--Icon cloundfare -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/AddAccount.js" type="text/javascript"></script>
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
        <style>
            .errol-color {
                color: red;
            }
            .title {
                color: #052659;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <c:if test="${sessionScope.pUpdate == null}" >
            <jsp:forward page="HomeUser.jsp"/>
        </c:if>
        <div class="container">
            <h1 class="title">CẬP NHẬT THÔNG TIN SẢN PHẨM</h1>
            ${statusUpdate}
            <form action="/Workshop1/update?action=updateProduct" id="formSubmit" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name" class="title">Tên Sản Phẩm</label> 
                            <input onchange="checkName()" value="${pUpdate.productName}" type = "text" class="form-control" id="name" name="name" />
                        </div>
                        <div id="errolName" class="errol-color"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="image" class="title">Hình Ảnh</label>
                            <!-- 0: giữ hình cũ, 1:đổi hình mới   -->
                            <input type="hidden" name="statusImage" value="1" id="statusImageValue"/>
                            <input onchange="statusImages()" type="file" value=""  class="form-control" id="image" name="image" style="height: inherit;" />
                            <br>
                            <button class="btn btn-primary" id="btnImage" type="button" onclick="keepImage()">Nhấn để giữ lại hình ảnh cũ</button>
                        </div>        
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="brief" class="title">Mô tả sản phẩm</label> 
                            <input onchange="checkBrief()" value="${pUpdate.brief}" type = "text" class="form-control" id="brief" name="brief" />
                        </div>
                        <div id="errolBrief" class="errol-color"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="date" class="title">Ngày đăng bán</label> 
                            <input value="${pUpdate.postedDate}" type = "date" class="form-control" id="date" name="date" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="unit" class="title">Đơn vị</label> 
                            <input onchange="checkUnit()" value="${pUpdate.unit}" type = "text" class="form-control" id="unit" name="unit" />
                        </div> 
                        <div id="errolUnit" class="errol-color"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="price" class="title">Giá</label> 
                            <fmt:setLocale value="vi-VN"/>
                            <input onchange="checkPrice()" value="<fmt:formatNumber value="${pUpdate.price}"/>" type = "text" class="form-control" id="price" name="price" />
                        </div>
                        <div id="errolPrice" class="errol-color"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group" >
                            <label for="discount" class="title">Giảm Giá</label> 
                            <input onchange="checkDiscount()" value="${pUpdate.discount}" type = "number" class="form-control" id="discount" name="discount" />
                        </div> 
                        <div id="errolDiscount" class="errol-color"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button onclick="checkAllProductUpdate()" class="btn btn-outline-success" type="button">Lưu</button>
                    </div>
                    <br>
                    <br>
                    <div class="alert alert-danger fade show text-center" style="display: none;" id="errolSubmit"></div>
                </div>
            </form>
        </div>
    </body>
</html>
