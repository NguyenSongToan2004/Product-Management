/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DTO;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author ACER
 */
public class Product implements Serializable{
    private String productId;
    private String productName;
    private String productImage;
    private String brief;
    private Date postedDate;
    private Category type;
    private Account account;
    private String unit;
    private int price;
    private int discount;
    

    public Product(String productId, String productName, String productImage, String brief, Date postedDate, Category type, Account account, String unit, int price, int discount) {
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.brief = brief;
        this.postedDate = postedDate;
        this.type = type;
        this.account = account;
        this.unit = unit;
        this.price = price;
        this.discount = discount;
    }
    
    public String getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public String getBrief() {
        return brief;
    }

    public Date getPostedDate() {
        return postedDate;
    }

    public Category getType() {
        return type;
    }

    public Account getAccount() {
        return account;
    }

    public String getUnit() {
        return unit;
    }

    public int getPrice() {
        return price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }

    public void setType(Category type) {
        this.type = type;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", productImage=" + productImage + ", brief=" + brief + ", postedDate=" + postedDate + ", type=" + type + ", account=" + account + ", unit=" + unit + ", price=" + price + ", discount=" + discount + '}';
    }
    
    
}
