/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function checkFormat(content, pattern, msg, msgreg) {
    var result = "";
    console.log(content);
    if (content.length == 0) {
        result = msg;
    } else if (pattern.test(content) == false) {
        result = msgreg;
    } else {
        result = "true";
    }
    return result;
}

function checkFormatBlank(content, pattern, msgreg) {
    var result = "";
    if (pattern.test(content) == false && content.length != 0) {
        result = msgreg;
    } else {
        result = "true";
    }
    return result;
}
function checkId() {
    let id = document.getElementById("productId").value;
    let check = checkFormat(id, /^[a-zA-Z0-9]{1,10}$/, "Mã sản phẩm không được để trống!!", "Nhập sai kiểu dữ liệu từ 1-10 kí tự (chỉ nhập chữ số) !!");
    if (check != "true") {
        document.getElementById("errolId").innerHTML = check;
    } else {
        document.getElementById("errolId").innerHTML = "";
    }
    return check;
}
function checkName() {
    let name = document.getElementById("name").value;
    let check = checkFormat(name, /^.{1,500}$/, "Tên sản phẩm không được để trống!!", "Tên sản phẩm không chứa kí tự đặt biệt !!");
    if (check != "true") {
        document.getElementById("errolName").innerHTML = check;
    } else {
        document.getElementById("errolName").innerHTML = "";
    }
    return check;
}
function checkBrief() {
    let brief = document.getElementById("brief").value;
    let check = checkFormatBlank(brief, /^.{1,2000}$/, "Mô tả không chứa kí tự đặc biệt !!")
    if (check != "true") {
        document.getElementById("errolBrief").innerHTML = check;
    } else {
        document.getElementById("errolBrief").innerHTML = "";
    }
    return check;
}

function checkPrice() {
    let price = document.getElementById("price").value;
    let token = price.split(".");
    price = Number(token.join(""));
    let check = checkFormatBlank(price, /^[0-9]+$/, "Nhập sai định dạng số lượng ");
    if (check != "true") {
        document.getElementById("errolPrice").innerHTML = check;
    } else {
        let formatPrice = price.toLocaleString('vi-VN');
        document.getElementById("price").value = formatPrice;
        if (price >= 0) {
            document.getElementById("errolPrice").innerHTML = "";
        }
    }
    return check;
}

function checkUnit() {
    let unit = document.getElementById("unit").value;
    let check = checkFormatBlank(unit, /^[a-zA-Z0-9ĐđÀ-ỹỲỹ]+$/, "Đơn vị phải là chữ cái !!");
    if (check != "true") {
        document.getElementById("errolUnit").innerHTML = check;
    } else {
        document.getElementById("errolUnit").innerHTML = "";
    }
    return check;w
}

function checkDiscount() {
    let discount = document.getElementById("discount").value;
    let check = "true";
    if (discount < 0 || discount > 100) {
        document.getElementById("errolDiscount").innerHTML = "Tỉ lệ giảm giá phải từ 0% đến 100% !!";
        check = false;
    } else {
        document.getElementById("errolDiscount").innerHTML = "";
    }
    return check;
}

function checkAllProduct() {
    let a = checkId();
    let b = checkName();
    let c = checkBrief();
    let d = checkPrice();
    let e = checkDiscount();
    let f = checkUnit();
    if (a != "true" || b != "true" || c != "true" || d != "true" || e != "true" || f != "true") {
        document.getElementById("errolSubmit").innerHTML = "Dữ Liệu Chưa Đúng";
    } else if (a == "true" && b == "true" && c == "true" && d == "true" && e == "true" && f == "true") {
        document.getElementById("errolSubmit").innerHTML = "";
        document.getElementById("formSubmit").submit();
    }
}
// check all condition
function checkAllProductUpdate() {
    let b = checkName();
    let c = checkBrief();
    let d = checkPrice();
    let e = checkDiscount();
    let f = checkUnit();
    if (b != "true" || c != "true" || d != "true" || e != "true" || f != "true") {
        document.getElementById("errolSubmit").innerHTML = "Dữ Liệu Chưa Đúng";
    } else if (b == "true" && c == "true" && d == "true" && e == "true" && f == "true") {
        document.getElementById("errolSubmit").innerHTML = "";
        document.getElementById("formSubmit").submit();
    }
}
//set up image
function statusImages() {
    document.getElementById("statusImageValue").value = 1; // thay đổi
    document.getElementById("btnImage").innerHTML = "Giữ lại ảnh cũ";
    console.log(document.getElementById("statusImageValue").value);
    console.log("hehe");
}

function keepImage() {
    document.getElementById("statusImageValue").value = 0; // thay đổi
    document.getElementById("btnImage").innerHTML = "Đã giữ lại hình ảnh cũ";
}