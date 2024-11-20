/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function addQuantity(price) {
    let oldQuantity = Number(document.getElementById("quantity").value);
    let newQuantity = oldQuantity + 1;
    document.getElementById("quantity").value = newQuantity;
    let amount = newQuantity * price;
    const formattedAmount = amount.toLocaleString('vi-VN');
    document.getElementById("totalAmount").innerHTML = formattedAmount;
}
function negQuantity(price) {
    let oldQuantity = Number(document.getElementById("quantity").value);
    console.log(price);
    if (oldQuantity > 1) {
        let newQuantity = oldQuantity - 1;
        document.getElementById("quantity").value = newQuantity;
        let amount = newQuantity * price;
        const formattedAmount = amount.toLocaleString('vi-VN');
        document.getElementById("totalAmount").innerHTML = formattedAmount;
    } else {
        alert("Không thể giảm số lượng xuống 0");
    }
}
function changeQuantity(price) {
    let quantity = Number(document.getElementById("quantity").value);
    let formattedAmount = 0;
    if (quantity >= 1) {
        let amount = quantity * price;
        formattedAmount = amount.toLocaleString('vi-VN');
        document.getElementById("totalAmount").innerHTML = formattedAmount;
    } else {
        document.getElementById("quantity").value = 1;
        formattedAmount = price.toLocaleString('vi-VN');
        document.getElementById("totalAmount").innerHTML = formattedAmount;
        alert("Số lượng ko được ít hơn 0 !!");
    }
}

