<%-- 
    Document   : LogIn
    Created on : Jun 11, 2024, 9:36:44 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/LogInStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body>
        <div class="container container-width">
            <div class="row row-border full">
                <div class="col-md-7 left-section">
                    <h1 class="title-style" style="margin-bottom: 40px;"><strong>Chào Mừng Tới Blackpro Mall</strong></h1>
                    <p>Welcome to our Commerce Hub, where business meets innovation, and opportunities are boundless. Whether you're an entrepreneur, a seasoned business owner, or someone curious about the world of commerce, our platform is designed to provide you with insights, resources, and the latest trends in the industry.</p>
                </div>
                <div class="col-md-5 main-content">
                    <div class="row">
                        <div class="col-md-8">
                            <h1 class="title-style"><strong>Đăng Nhập</strong></h1>
                        </div>
                        <div class="col-md-12">
                            ${status}
                            ${statusFilter}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <form action="MainController?action=LoginAccount" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="user" placeholder="Tên đăng nhập">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="password" placeholder="Mật khẩu">
                                </div>
                                <button type="submit" class="btn btn-primary">Đăng nhập</button> 
                                <a href="/Workshop1/MainController?action=CSKH">Quên Mật Khẩu</a>
                            </form>
                            <br>
                            <p>Tạo tài khoản mới ngay !!  <a href="/Workshop1/MainController?action=CreateAccountGuessForward">Đăng Kí</a></p>
                            <a href="/Workshop1/MainController?action=Guess">Chế độ khách !!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
