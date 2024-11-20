/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function checkName() {
    let name = document.getElementById("name").value;
    if (name.length == 0) {
        document.getElementById("errolName").innerHTML = "Tên không được phép null !!";
    } else {
        document.getElementById("errolName").innerHTML = "";
    }
}

