<%-- 
    Document   : AddProduct
    Created on : Jun 20, 2024, 11:51:46 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Model.DTO.Product"%>
<%@page import="Model.DAO.ProductDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/AddAccount.js" type="text/javascript"></script>
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
        <style>
            .errol-color,.star {
                color: red;
            }
            .title {
                color: #052659;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h1 class="title">Tạo Sản Phẩm Mới</h1>
            ${statusUpdate}
            <form action="/Workshop1/update?action=addProduct" method="post" enctype="multipart/form-data" id="formSubmit">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="id" class="title">Mã Sản Phẩm<span class="star"> *</span></label> 
                            <input onchange="checkId()"  type = "text" class="form-control" id="productId" name="id" placeholder="Nhập id sản phẩm">
                        </div>
                        <div id="errolId" class="errol-color"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name" class="title">Tên Sản Phẩm<span class="star"> *</span></label> 
                            <input onchange="checkName()"  type = "text" class="form-control" id="name" name="name" placeholder="Nhập tên sản phẩm ">
                        </div>
                        <div id="errolName" class="errol-color"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleFormControlSelect1" class="title">Loại Sản Phẩm<span class="star"> *</span></label>
                            <select class="form-control" id="exampleFormControlSelect1" name="typeId">
                                <c:forEach items="${listC}" var="o">
                                    <option value="${o.typeId}">${o.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="image" class="title">Hình Ảnh</label> 
                            <input type = "file" class="form-control" id="image" name="image" style="height: inherit;">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="brief" class="title">Giới Thiệu</label> 
                            <input onchange="checkBrief()" type = "text" class="form-control" id="brief" name="brief" placeholder="Mô tả sản phẩm">
                        </div>
                        <div id="errolBrief" class="errol-color"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="date" class="title">Ngày Đăng Bán</label> 
                            <input type = "date" class="form-control" id="date" name="date" >
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="unit" class="title">Đơn vị</label> 
                            <input onchange="checkUnit()" type = "text" class="form-control" id="unit" name="unit" placeholder="Đơn vị pcs">
                        </div> 
                        <div id="errolUnit" class="errol-color"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="price" class="title">Giá</label> 
                            <fmt:setLocale value="vi-VN"/>
                            <input onchange="checkPrice()" value="0" type = "text" class="form-control" id="price" name="price" placeholder="Nhập giá tiền">
                        </div>
                        <div id="errolPrice" class="errol-color"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group" >
                            <label for="discount" class="title">Mức Giảm Giá</label> 
                            <input onchange="checkDiscount()" value="0" type = "number" class="form-control" id="discount" name="discount" placeholder='Giảm giá'>
                        </div> 
                        <div id="errolDiscount" class="errol-color"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button class="btn btn-outline-success" type="button" onclick="checkAllProduct()">Save Changes</button>
                    </div>
                    <div id="errolSubmit" class="errol-color"></div>
                </div>
            </form>
        </div>
    </body>
</html>
