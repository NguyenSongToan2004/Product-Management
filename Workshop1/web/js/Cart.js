/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function checkQuantity(id) {
    let quantity = document.getElementById(id).value;
    console.log(id);
    if (quantity < 1) {
        document.getElementById(id).value = 1;
        alert("Bạn không được hạ sản phẩm dưới 0 !");
    } else {
        document.getElementById("formQuantity"+id).submit();
    }
}
