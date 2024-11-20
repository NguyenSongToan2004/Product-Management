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

function firstNameCheck() {
    let firstName = document.getElementById("firstName").value;
    var check = checkFormat(firstName, /^[a-zA-ZĐđÀ-ỹỲỹ ]+$/, "Không nhập null nha !!", "Nhập sai pattern !!");
    if (check != "true") {
        document.getElementById("firstNameCheck").innerHTML = check;
    } else {

        document.getElementById("firstNameCheck").innerHTML = "";
    }
    return check;
}
function lastNameCheck() {
    let lastName = document.getElementById("lastName").value;
    var check = checkFormat(lastName, /^[a-zA-ZĐđÀ-ỹỲỹ ]+$/, "Không nhập null nha !!", "Nhập sai pattern !!");
    if (check != "true") {
        document.getElementById("lastNameCheck").innerHTML = check;
    } else {

        document.getElementById("lastNameCheck").innerHTML = "";

    }
    return check;
}

function passCheck() {
    let pass = document.getElementById("pass").value;
    var check = checkFormat(pass, /^.{8,20}$/, "Không nhập null nha !!", "Password dài từ 8-30 kí tự !!");
    if (check != "true") {
        document.getElementById("passCheck").innerHTML = check;
    } else {
        document.getElementById("passCheck").innerHTML = "";
    }
    return check;
}

function passCheckUpdate() {
    let pass = document.getElementById("pass").value;
    var check = checkFormat(pass, /^.{8,20}$/, "Không nhập null nha !!", "Password dài từ 8-30 kí tự !!");
    if (check != "true") {
        document.getElementById("passCheck").innerHTML = check;
    } else {
        document.getElementById("passCheck").innerHTML = "";
        document.getElementById("passCorrect").value = pass;
        document.getElementById("pass").value = pass;
        console.log(document.getElementById("passCorrect").value);
    }
    return check;
}

function checkUser() {
    let user = document.getElementById("user").value;
    var check = checkFormat(user, /^[a-zA-Z0-9_]{1,20}$/, "Không nhập null nha !!", "User là kí tự chữ số dài từ 1-30 !!");

    if (check != "true") {
        document.getElementById("userCheck").innerHTML = check;
    } else {
        document.getElementById("userCheck").innerHTML = "";
    }
    return check;
}
function checkPhone() {
    let phone = document.getElementById("phone").value;
    let check = checkFormatBlank(phone, /^[0]\d{9}$/, "Số điện thoại dài 10 số và bắt đầu bằng số 0 !!");
    if (check != "true") {
        document.getElementById("phoneCheck").innerHTML = check;
    } else {
        document.getElementById("phoneCheck").innerHTML = "";
    }
    return check;
}
function checkAll() {
    var checkF = firstNameCheck();
    var checkL = lastNameCheck();
    var checkP = passCheck();
    var checkPhoneNumber = checkPhone();

    if (checkF != "true" || checkL != "true" || checkP != "true" || checkPhoneNumber != "true") {
        document.getElementById("errolSubmit").style = "";
        document.getElementById("errolSubmit").innerHTML = "Dữ Liệu Không Đúng";
    } else if (checkF == "true" && checkL == "true" && checkP == "true" && checkPhoneNumber == "true") {
        document.getElementById("errolSubmit").innerHTML = "";
        document.getElementById("formSubmit").submit();
    }
}

function checkAllGuess() {
    var checkF = firstNameCheck();
    var checkL = lastNameCheck();
    var checkP = passCheck();
    var checkU = checkUser();
    var checkPhoneNumber = checkPhone();
    console.log(checkF);
    console.log(checkL);
    console.log(checkP);
    console.log(checkPhoneNumber);
    if (checkF != "true" || checkL != "true" || checkP != "true" || checkU != "true" || checkPhoneNumber != "true") {
        document.getElementById("errolSubmit").style = "";
        document.getElementById("errolSubmit").innerHTML = "Dữ Liệu Không Đúng";
    } else if (checkF == "true" && checkL == "true" && checkP == "true" && checkU == "true" && checkPhoneNumber == "true") {
        document.getElementById("errolSubmit").innerHTML = "";
        document.getElementById("formSubmit").submit();
    }
}



