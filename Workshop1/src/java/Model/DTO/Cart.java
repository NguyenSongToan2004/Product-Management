/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DTO;

import Model.DAO.ProductDAO;
import java.util.HashMap;

/**
 *
 * @author ADMIN
 */
public class Cart extends HashMap<String, Item> {

    public HashMap<String, Item> getCart(String txt) {
        ProductDAO pDAO = new ProductDAO();
        if (txt.length() != 0) {
            String[] token = txt.split("/");
            for (String s : token) {
                String[] part = s.split(":");
                String id = part[0];
                int quantity = Integer.parseInt(part[1]);
                Product p = pDAO.getObjectById(id);
                Item i = new Item(p.getProductId(), p.getProductImage(), p.getProductName(), p.getPrice(), quantity);
                this.put(id, i);
            }
        }
        return this;
    }
}
