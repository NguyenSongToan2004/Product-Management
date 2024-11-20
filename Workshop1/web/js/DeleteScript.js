/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var x;
function deleteId(id) {
    x = id;
}

function confirmDelete() {
    document.getElementById("submitId").action = "/Workshop1/update?action=deleteAccount&&aId=" + x;
    document.getElementById("submitId").submit();
}

function confirmDeleteCat() {
    document.getElementById("submitId").action = "/Workshop1/update?action=deleteCat&&cId=" + x;
    document.getElementById("submitId").submit();
}

function confirmDeleteProduct() {
    document.getElementById("submitId").action = "/Workshop1/update?action=deleteProduct&&pId=" + x;
    document.getElementById("submitId").submit();
}
