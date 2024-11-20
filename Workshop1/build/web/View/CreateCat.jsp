<%-- 
    Document   : CreateCat
    Created on : Jun 19, 2024, 12:25:39 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Category</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
            .save-button {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h1>Thêm Mới Một Loại Sản Phẩm</h1>
            ${statusUpdate}
            <form action="/Workshop1/update?action=addCat" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="from-group"><label for="name" class="title">Tên Thể Loại</label>
                            <input onchange="checkName()" type="text" placeholder="Enter Category Name" id="name" name="name" class="form-control" required/>
                        </div>
                    </div>
                    <div id="errolName" class="col-md-12 errol"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="from-group">
                            <label for="memo" class="title">Nhập mô tả</label>
                            <input type="text" placeholder="Enter Memo for Category" id="memo" name="memo" class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" id="create" class="btn btn-outline-success save-button">Tạo</button>
                    </div>
                </div> 
            </form>
        </div>
    </body>
</html>
