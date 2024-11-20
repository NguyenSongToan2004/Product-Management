<%-- 
    Document   : Denied
    Created on : Jul 3, 2024, 8:12:23 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cảnh Báo</title><!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/ProfileUser.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="container">
            <div class="row d-flex justify-content-center text-center" >
                <div class="col-md-6">
                    <img src="/Workshop1/images/warning.png" width="90%" height="90%" class="rounded" alt="Cinque Terre">
                </div>
                <div class="col-md-12" style="font-weight: bold;">Bạn Chưa Được Cấp Quyền Để Truy Cập Tính Năng Này</div>
                <div class="col-md-12" style="font-weight: bold;">Vui Lòng Kiểm Tra lại Thông Tin Trong Hồ Sơ</div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
