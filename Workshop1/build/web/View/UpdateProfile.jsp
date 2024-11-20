<%-- 
    Document   : CreateAccount.jsp
    Created on : Jun 12, 2024, 7:20:32 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!--Icon cloundfare -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <script src="js/CreateAccount.js" type="text/javascript"></script>
        <link href="css/CreateAccount.css" rel="stylesheet" type="text/css"/>
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h1 style="color: #052659;"><strong>CẬP NHẬT THÔNG TIN</strong></h1>
            ${statusUpdate}
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="pass" class="title">Tài Khoản</label>
                        <input value="${a.account}" disabled="" type = "text" class="form-control" id="account" name="account" >
                    </div>
                </div> 
                <div class="col-md-12">
                    <form method="post" action="/Workshop1/profile?action=profile&&action2=UpdateProfile" id="formSubmit">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pass" class="title">Mật Khẩu <span class="star">*</span></label>
                                    <input type="hidden" value="${a.pass}" id="passCorrect" name="pass"/>
                                    <input value="********" onchange="passCheckUpdate()" type = "password" class="form-control" id="pass" required>
                                </div>
                                <div id="passCheck"></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="lastName" class="title">Họ (tên lót) <span class="star">*</span></label>
                                    <input onchange="lastNameCheck()" value="${a.lastName}" type = "text" class="form-control" id="lastName" name = "lastName" required>
                                </div>
                                <div id="lastNameCheck"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="firstName" class="title">Tên<span class="star">*</span></label>
                                    <input onchange="firstNameCheck()" value="${a.firstName}" type = "text" class="form-control" id="firstName" name="firstName"  required>
                                </div>
                                <div id="firstNameCheck"></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="birthday" class="title">Sinh Nhật</label>
                                    <input type="date" value="${a.birthday}" class="form-control" id="birthday" name="birthday" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone" class="title">Số điện thoại</label>
                                    <input onchange="checkPhone()" value ="${a.phone}" type = "text" class="form-control" id="phone" name="phone">
                                </div>
                                <div id="phoneCheck"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="title">Giới Tính</label>
                                    <c:if test="${a.gender == true}" >
                                        <div class="radio">
                                            <label><input type="radio" name="optradio" checked value="1">Nam</label>
                                        </div>
                                        <div class="radio">
                                            <label><input type="radio" name="optradio" value="0">Nữ</label>
                                        </div>
                                    </c:if>
                                    <c:if test="${a.gender == false}" >
                                        <div class="radio">
                                            <label><input type="radio" name="optradio"  value="1">Nam</label>
                                        </div>
                                        <div class="radio">
                                            <label><input type="radio" name="optradio" checked value="0">Nữ</label>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" value="${a.roleInSystem}" name="role"/>
                        <!--                        <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="sel1" class="title">Chọn vai trò:</label>
                                                            <select class="form-control" id="sel1" name="role">
                        <c:if test="${a.roleInSystem == 1}">
                            <option value="1" selected="selected">Administrator</option>
                            <option value="0" >Staff</option>
                            <option value="2">Customer</option>
                        </c:if>
                        <c:if test="${a.roleInSystem == 2}">
                            <option value="1" >Administrator</option>
                            <option value="0" >Staff</option>
                            <option value="2" selected="selected">Customer</option>
                        </c:if>
                        <c:if test="${a.roleInSystem == 0}">
                            <option value="1" >Administrator</option>
                            <option value="0" selected="selected">Staff</option>
                            <option value="2" >Customer</option>
                        </c:if>
                    </select>
                </div>
            </div>
        </div>-->
                        <button class="btn btn-success" type="button" id="buttonSubmit" onclick="checkAll()">Lưu Thay Đổi</button>
                        <br>
                        <br>
                        <div class="alert alert-danger fade show text-center" style="display: none;" id="errolSubmit"></div>
                    </form>
                </div>
            </div>    
        </div>
        <jsp:include page="Footer.jsp" />
    </body>
</html>
