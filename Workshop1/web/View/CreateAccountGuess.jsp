<%-- 
    Document   : CreateAccount.jsp
    Created on : Jun 12, 2024, 7:20:32 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.sql.Date"%>
<%@page import="Model.DTO.Account"%>
<%@page import="Model.DAO.AccountDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/CreateAccount.js" type="text/javascript"></script>
        <link href="css/CreateAccount.css" rel="stylesheet" type="text/css"/>
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
        <style>
            .star {
                color: red;
            }
            .title {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="container">
            <h1 style="color: #052659;"><strong>ĐIỀN THÔNG TIN</strong></h1>
            ${status}
            <div class="row">
                <div class="col-md-12">
                    <form method="post" action="/Workshop1/MainController?action=CreateAccountGuess" id="formSubmit">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="account" class="title">Tên Người Dùng <span class="star">*</span></label> 
                                    <input onchange="checkUser()" type = "text" class="form-control" id="user" name="user" placeholder="Tên đăng nhập 1-20 kí tự" required>
                                </div>
                                <div id="userCheck" class="errol-color"></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pass" class="title">Mật Khẩu <span class="star">*</span></label>
                                    <input onchange="passCheck()" type = "password" class="form-control" id="pass" name="pass" placeholder="Mật khẩu từ 1-30 kí tự" required>
                                </div>
                                <div id="passCheck" class="errol-color"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="firstName" class="title">Họ <span class="star">*</span></label>
                                    <input onchange="firstNameCheck()" type = "text" class="form-control" id="firstName" name="firstName" placeholder="Họ (Tên Lót)" required>
                                </div>
                                <div id="firstNameCheck" class="errol-color"></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="lastName" class="title">Tên <span class="star">*</span></label>
                                    <input onchange="lastNameCheck()" type = "text" class="form-control" id="lastName" name = "lastName" placeholder="Tên Người Dùng" required>
                                </div>
                                <div id="lastNameCheck" class="errol-color"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="birthday" class="title">Sinh Nhật</label>
                                    <input type="date" class="form-control" id="birthday" name="birthday" placeholder="Ngày Sinh"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="title">Giới Tính</label>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" checked value="1"> Nam</label>
                                    </div>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="0"> Nữ</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone" class="title">Số Điện Thoại</label>
                                    <input onchange="checkPhone()" type = "text" class="form-control" id="phone" name="phone" placeholder="Số Điện Thoại 10 số (Bắt đầu với 0)">
                                </div>
                                <div id="phoneCheck" class="errol-color"></div>
                            </div>
                        </div>
                        <button class="btn btn-success" type="button" id="buttonSubmit" onclick="checkAllGuess()">Create</button>
                        <br>
                        <br>
                        <div class="alert alert-danger fade show text-center" style="display: none;" id="errolSubmit"></div>
                    </form>
                </div>
            </div>    
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
