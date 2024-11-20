<%-- 
    Document   : UpdateCategory
    Created on : Jun 17, 2024, 5:40:03 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
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

        <script src="js/UpdateCategory.js" type="text/javascript"></script>
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
        <style>
            .errol {
                color: red;
            }
            .title {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp" />
        <c:if test="${sessionScope.cUpdate == null}" >
            <jsp:forward page="HomeUser.jsp"/>
        </c:if>
        <div class="container">
            <h1>Update Category</h1>
            ${statusUpdate}
            <form action="/Workshop1/update?action=updateCat" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="from-group"><label for="name" class="title">Tên Loại Sản Phẩm</label>
                            <input onchange="checkName()" value="${cUpdate.categoryName}" type="text" id="name" name="name" class="form-control" required/>
                        </div>
                    </div>
                    <div id="errolName" class="col-md-12 errol"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="from-group">
                            <label for="memo" class="title">Mô tả</label>
                            <input type="text" id="memo" name="memo" class="form-control" value="${cUpdate.memo}"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-outline-success">Lưu</button>
                    </div>
                </div> 
            </form>
        </div>
    </body>
</html>
