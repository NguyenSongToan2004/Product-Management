<%-- 
    Document   : DashboardProduct
    Created on : May 24, 2024, 9:56:17 PM
    Author     : ACER
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <!--Icon cloundfare -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <script src="js/DeleteScript.js" type="text/javascript"></script>
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-2">
                    <h2>Product List</h2>
                </div>
                <div class="col-md-4">
                    <a href="/Workshop1/update?action=addProductForward" class="btn btn-info"><strong style="font-size: 20px;">+</strong> Thêm Sản Phẩm Mới</a>
                </div>
            </div>
        ${statusUpdate}

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Hình Ảnh(đường dẫn)</th>
                    <th>Mô tả</th>
                    <th>Ngày đăng bán</th>
                    <th>Loại</th>
                    <th>Tài Khoản</th>
                    <th>Đơn vị</th>
                    <th>Giá</th>
                    <th>Giảm Giá</th>
                    <th>Cập Nhật</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${sessionScope.listP}" var="o">
                    <c:if test="${o.account.account == valueUser}" >
                        <tr>
                            <td>${o.productId}</td>
                            <td>${o.productName}</td>
                            <td>${o.productImage}</td>
                            <td>${o.brief}</td>
                            <td>${o.postedDate}</td>
                            <td>${o.type.typeId}</td>
                            <td>${o.account.account}</td>
                            <td>${o.unit}</td>
                            <fmt:setLocale value="vi-Vn" />

                            <td><fmt:formatNumber value="${o.price}" />đ</td>
                            <td>${o.discount}%</td>
                            <td>
                                <a href="/Workshop1/update?action=updateProductForward&&pId=${o.productId}" class="btn btn-info">Cập Nhật</a>
                                <span onclick="deleteId('${o.productId}')" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Xóa</span>
                            </td>           
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Xác Nhận</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        Bạn có chắc chắn khi xóa sản phẩm này đi không ?
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Hủy</button>
                        <form action="/Workshop1/update?action=deleteProduct" method="post" id="submitId" >
                            <button class="btn btn-danger text-light" type="button" onclick="confirmDeleteProduct()">Xóa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
