<%-- 
    Document   : Dashboard
    Created on : May 24, 2024, 8:30:34 PM
    Author     : ACER
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="a" uri="/WEB-INF/tlds/CustomTag"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
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
        <script src="js/DeleteScript.js" type="text/javascript"></script>
    </head
    <body>
        <jsp:include page="Header.jsp" />
        <div class="">
            <div class="row">
                <div class="col-md-6 ml-3"><h2>Danh Sách Tài Khoản</h2></div>
                <div class="col-md-4">
                    <a href="/Workshop1/update?action=addAccountFoward" class="btn btn-info"><strong style="font-size: 20px;">+</strong> Thêm Tài Khoản Mới</a>
                </div>
            </div>
            ${statusUpdate}
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Tên Người Dùng</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Sinh Nhật</th>
                        <th>Giới Tính</th>
                        <th>Số Điện Thoại</th>
                        <th>Trạng thái</th>
                        <th>Vai trò</th>
                        <th>Cập Nhật</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.listA}" var="o">
                        <c:if test="${o.account != valueUser}">
                            <tr>
                                <td>${o.account}</td>
                                <td>${o.lastName}</td>
                                <td>${o.firstName}</td>
                                <td><fmt:formatDate value="${o.birthday}" pattern="dd-MM-YYYY"/></td>
                                <td><a:ShowValue attribute="gender" value="${o.gender}"/></td>
                                <td>${o.phone}</td>
                                <td><a:ShowValue attribute="status" value="${o.isUse}"/></td>
                                <td><a:ShowValue attribute="role" value="${o.roleInSystem}"/></td>
                                <td>
                                    <a href="/Workshop1/update?action=updateAccountForward&&aId=${o.account}" class="btn btn-info">Cập Nhật</a>
                                    <c:if test="${o.isUse == true}">
                                        <a href="/Workshop1/update?action=deactiveAccount&&aId=${o.account}&&isUse=${o.isUse}" class="btn btn-success">Hoạt Động</a>
                                    </c:if>
                                    <c:if test="${o.isUse == false}">
                                        <a href="/Workshop1/update?action=deactiveAccount&&aId=${o.account}&&isUse=${o.isUse}" class="btn btn-warning">Cấm</a>
                                    </c:if>
                                    <span onclick="deleteId('${o.account}')" class="btn btn-danger" id="" data-toggle="modal" data-target="#myModal">Xóa</span>
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
                            <h4 class="modal-title">Delete Confirm</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            Bạn có chắc chắn khi xóa tài khoản không ?
                            <br>
                            Điều này có thể dẫn đến một số sản phẩm liên quan <strong>bị xóa theo</strong>.
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" data-dismiss="modal">Hủy</button>
                            <form action="/Workshop1/update?action=deleteAccount" method="post" id="submitId" >
                                <button class="btn btn-danger text-light" type="button" onclick="confirmDelete()">Xóa</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="check"></div> <!--stop here -->
        </div>
    </body>
</html>
