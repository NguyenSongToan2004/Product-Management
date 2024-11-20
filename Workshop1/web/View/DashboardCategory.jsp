<%-- 
    Document   : DashboardCategory
    Created on : May 24, 2024, 9:57:30 PM
    Author     : ACER
--%>
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
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
        <script src="js/DeleteScript.js" type="text/javascript"></script>
        <style>
            .log-in-button {
                background-color: turquoise;
                border-radius: 5px;
            }
            .sign-up-button {
                background-color: beige;
                border-radius: 5px;
            }
            .tool-tip a {
                color : black;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-6"><h2>Danh Sách Loại Sản Phẩm</h2></div>
                    <div class="col-md-4">
                        <a href="/Workshop1/update?action=addCatForward" class="btn btn-info"><strong style="font-size: 20px;">+</strong>Thêm Mới</a>
                    </div>
                </div>
            ${statusUpdate}
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Tên Loại</th>
                        <th>Mô Tả</th>
                        <th>Cập Nhật</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listC}" var="o">
                        <tr>
                            <td>${o.typeId}</td>
                            <td>${o.categoryName}</td>
                            <td>${o.memo}</td>
                            <td>
                                <a href="/Workshop1/update?action=updateCatForward&&cId=${o.typeId}" class="btn btn-info">Cập Nhật</a>
                                <span onclick="deleteId('${o.typeId}')" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Xóa</span>
                            </td>    
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <hr>
        </div>
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
                        Bạn có chắc sẽ xóa loại này
                        Điều này có thể xóa cả những sản phẩm có liên quan.
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Hủy</button>
                        <form action="/Workshop1/update?action=deleteCat" method="post" id="submitId" >
                            <button class="btn btn-danger text-light" type="button" onclick="confirmDeleteCat()">Xóa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
