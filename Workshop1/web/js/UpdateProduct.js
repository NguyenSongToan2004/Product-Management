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
    console.log(content);
    if (pattern.test(content) == false && content.length != 0) {
        result = msgreg;
    } else {
        result = "true";
    }
    return result;
}

function checkName() {
    let name = document.getElementById("name").value;
    let check = checkFormat(name, /^.{1,500}$/, "Không nhập null nha !!", "Nhập sai pattern !!");
    if (check != "true") {
        document.getElementById("errolName").innerHTML = check;
    } else {
        document.getElementById("errolName").innerHTML = "";
    }
}
function checkBrief() {
    let brief = document.getElementById("brief").value;
    let check = checkFormatBlank(brief, /^.{1,2000}$/, "Nhập sai pattern !!")
    if (check != "true") {
        document.getElementById("errolBrief").innerHTML = check;
    } else {
        document.getElementById("errolBrief").innerHTML = "";
    }
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
}

function checkDiscount() {
    let discount = document.getElementById("discount").value;
    if (discount < 0 || discount > 100) {
        document.getElementById("errolDiscount").innerHTML = "Discount is between 0 and 100 !!";
    } else {
        document.getElementById("errolDiscount").innerHTML = "";
    }
}