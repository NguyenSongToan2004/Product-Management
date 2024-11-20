/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DTO;

import java.io.Serializable;

/**
 *
 * @author ACER
 */
public class Category implements Serializable{

    private int typeId;
    private String categoryName;
    private String memo;

    public Category() {

    }

    public Category(String category, String memo) {
        this.categoryName = category;
        this.memo = memo;
    }

    public Category(int typeId, String categoryName, String memo) {
        this.typeId = typeId;
        this.categoryName = categoryName;
        this.memo = memo;
    }

    public int getTypeId() {
        return typeId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getMemo() {
        return memo;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    @Override
    public String toString() {
        return "Category{" + "typeId=" + typeId + ", categoryName=" + categoryName + ", memo=" + memo + '}';
    }

}
