<%-- 
    Document   : Profile
    Created on : Jul 9, 2024, 10:35:22 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="a" uri="/WEB-INF/tlds/CustomTag" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
        <style>
            p{
                font-size: 18px;
            }
            h1{
                color: #052659;
            }
            .main {
                padding: 20px;
            }   
            .title{
                font-size: 20px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="container main bg-light">
            <h1>Hồ Sơ Của Bạn</h1>
            <hr>
            <br>
            ${statusUpdate}
            <div class="ml-5">
                <div class="row">
                    <div class="col-md-3 title">
                        <p>Tên đăng nhập</p>
                    </div>
                    <div class="col-md-8">
                        <p>:  ${a.account}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 title">
                        <p>Mật Khẩu</p>
                    </div>
                    <div class="col-md-8">
                        <p>:  ***********</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 title">
                        <p>Họ và Tên</p>
                    </div>
                    <div class="col-md-8">
                        <p>:  ${a.lastName} ${a.firstName}</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3 title">
                        <p>Ngày Sinh</p>
                    </div>
                    <div class="col-md-8">
                        <p>:  <fmt:formatDate pattern="dd-MM-YYYY"  value="${a.birthday}"/></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 title">
                        <p>Giới Tính</p>
                    </div>
                    <div class="col-md-8">
                        <p>:  <a:ShowValue attribute="gender" value="${a.gender}"/></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 title">
                        <p>Số Điện Thoại</p>
                    </div>
                    <div class="col-md-8">
                        <p>:  ${a.phone}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 title">
                        <p>Vai Trò</p>
                    </div>
                    <div class="col-md-8">
                        <p>:  <a:ShowValue attribute="role" value="${a.roleInSystem}"/></p>
                    </div>
                </div>
                <a href="/Workshop1/MainController?action=Profile&&action2=updateForward&&aId=${a.account}" class="btn btn-outline-primary">Thay Đổi Thông Tin</a>
            </div>
            <hr>
        </div>
        <jsp:include page="Footer.jsp" />
    </body>
</html>
