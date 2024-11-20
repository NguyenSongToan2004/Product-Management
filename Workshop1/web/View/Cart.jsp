<%-- 
    Document   : Cart
    Created on : Jul 4, 2024, 8:17:38 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.DTO.Cart" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ Hàng</title>
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
        <script src="js/Cart.js" type="text/javascript"></script>
        <script>
            var list = new Map();
            function chooseItem(idProduct, totalPrice, idTick) {
                console.log(idProduct);
                console.log(totalPrice);
                console.log(idTick);
                console.log(document.getElementById(idTick).checked);
                if (document.getElementById(idTick).checked) {
                    list.set(idProduct, Number(totalPrice));
                } else {
                    list.delete(idProduct);
                }
                let total = 0;
                for (let x of list.values()) {
                    total = total + Number(x);
                }
                total = total.toLocaleString("vi-VN");
                document.getElementById("numberItem").innerHTML = list.size;
                document.getElementById("totalAmount").innerHTML = total + 'đ';
            }

            function negQuantity(id) {
                console.log(document.getElementById(id).value);
                if (document.getElementById(id).value == 1) {
                    if (confirm("Bạn có muốn xóa sản phẩm này không ?")) {
                        document.getElementById("neg" + id).action = "/Workshop1/cart?action=change&&action2=delete";
                        document.getElementById("neg" + id).submit();
                    }
                } else {
                    document.getElementById("neg" + id).submit();
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <h1 class="ml-4 mb-3"><strong>Giỏ Hàng Của Bạn</strong></h1>
        <jsp:useBean id="list" class="Model.DTO.Cart" />
        <c:set var="cookie"  value="${pageContext.request.cookies}"/>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Mua</th>
                        <th>Hình Ảnh</th>
                        <th>Tên</th>
                        <th>Giá</th>
                        <th>Số Lượng</th>
                        <th>Tổng Tiền</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Cookie[] c = request.getCookies();
                        HttpSession ses = request.getSession();
                        String txt = "";
                        for (Cookie cookie : c) {
                            if (cookie.getName().equals("Cart" + ses.getAttribute("valueUser"))) {
                                txt += cookie.getValue();
                            }
                        }
                        ses.setAttribute("txt", txt);
                    %>
                    <c:set var="cartMap" value="${list.getCart(sessionScope.txt)}" />
                    <fmt:setLocale value="vi-VN"/>
                    <c:set var="count"  value="0"/>
                    <c:forEach items="${cartMap.keySet()}" var="o">
                        <tr>
                            <td><input style="cursor: pointer;" type="checkbox" class="form-control mt-3" id="tick${count}" onclick="chooseItem('${cartMap.get(o).getId()}', '${cartMap.get(o).getTotalMoney()}', 'tick${count}')"/></td>
                            <td><img src="/Workshop1/${cartMap.get(o).getImage()}" alt="Ảnh Minh Họa" width="150px" height="150px"/></td>
                            <td>${cartMap.get(o).getName()}</td>
                            <td><fmt:formatNumber value="${cartMap.get(o).getPrice()}"/> đ</td>
                            <td>
                                <c:set var="count" value="${count+1}"/>
                                <div class="row">
                                    <div class="col-md-2">
                                        <form action="/Workshop1/cart?action=change&&action2=addNeg" method="post" id="neg${count}">
                                            <input type="hidden" value="${cartMap.get(o).getId()}" name="pId" />
                                            <input type="hidden" value="-" name="op"/>
                                            <button class="btn btn-outline-secondary" type="button" onclick="negQuantity('${count}')">-</button>
                                        </form>
                                    </div>
                                    <div class="col-md-4">
                                        <form action="/Workshop1/cart?action=change&&action2=update" id="formQuantity${count}" method="post">
                                            <input type="hidden" value="${cartMap.get(o).getId()}" name="pId" />
                                            <input id="${count}" onchange="checkQuantity('${count}')" class="form-control" type="number" value="${cartMap.get(o).getQuantity()}" name="quantity"/>
                                        </form>
                                    </div>
                                    <div class="col-md-2">
                                        <form action="/Workshop1/cart?action=change&&action2=addNeg" method="post">
                                            <input type="hidden" value="${cartMap.get(o).getId()}" name="pId" />
                                            <input type="hidden" value="+" name="op"/>
                                            <button class="btn btn-outline-secondary" type="submit">+</button>
                                        </form>
                                    </div>
                                </div>                            
                            </td>
                            <td><fmt:formatNumber value="${cartMap.get(o).getTotalMoney()}"/> đ</td>
                            <td>
                                <form action="/Workshop1/cart?action=change&&action2=delete" method="post">
                                    <input type="hidden" value="${cartMap.get(o).getId()}" name="pId"/>
                                    <button class="btn"><span class="fa fa-trash" aria-hidden="true"></span></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>    
        </div>
        <hr>
        <div class="container">

            <div class="row">
                <div class="col-md-6">
                    <h3>Số sản phẩm đã chọn (<span id="numberItem" style="color: red;">0</span>)</h3>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Tổng tiền <span id="totalAmount" class="h3" style="color: red;">0đ</span></h4>        
                        </div>
                        <div class="col-md-12">
                            <a href="/Workshop1/MainController?action=CSKH" class="btn btn-outline-primary">Thanh Toán</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
