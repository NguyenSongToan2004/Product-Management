/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.DTO.Account;
import Model.DTO.Product;
import DataConnect.DataConnect;
import Model.DTO.Category;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class ProductDAO implements CommonFunction<Product> {

    private Connection c = null;
    private ResultSet rs = null;
    private PreparedStatement pst = null;

    @Override
    public int insertRec(Product obj) {
        c = DataConnect.getConnection();
        String sql = "insert into products(productId, productName, productImage, brief, postedDate, typeId, account, unit, price, discount) Values "
                + "(?,?,?,?,?,?,?,?,?,?)";
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, obj.getProductId());
            pst.setString(2, obj.getProductName());
            pst.setString(3, obj.getProductImage());
            pst.setString(4, obj.getBrief());
            pst.setDate(5, (Date) obj.getPostedDate());
            pst.setInt(6, obj.getType().getTypeId());
            pst.setString(7, obj.getAccount().getAccount());
            pst.setString(8, obj.getUnit());
            pst.setInt(9, obj.getPrice());
            pst.setInt(10, obj.getDiscount());
            int affect = pst.executeUpdate();
//            System.out.println("Execute : \n" + sql);
//            System.out.println(affect + " rows affected !");
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updateRec(Product obj) {
        c = DataConnect.getConnection();
        String sql = "update products\n"
                + "set productName = ? , productImage = ?, brief = ?, postedDate = ?, typeId = ?, account = ?, unit = ?, price = ?, discount= ? "
                + "where productId = ?";
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, obj.getProductName());
            pst.setString(2, obj.getProductImage());
            pst.setString(3, obj.getBrief());
            pst.setDate(4, (Date) obj.getPostedDate());
            pst.setInt(5, obj.getType().getTypeId());
            pst.setString(6, obj.getAccount().getAccount());
            pst.setString(7, obj.getUnit());
            pst.setInt(8, obj.getPrice());
            pst.setInt(9, obj.getDiscount());
            pst.setString(10, obj.getProductId());
            int affect = pst.executeUpdate();
//            System.out.println("Execute : \n" + sql);
//            System.out.println(affect + " rows affected !");
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<Product> getDeleteProduct(String typeId) {
        c = DataConnect.getConnection();
        String sql = "select * from products where typeId = ?";
        ArrayList<Product> list = null;
        Product pro = null;
        try {
            pst = c.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(typeId));
            rs = pst.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postedDate = rs.getDate("postedDate");
                CategoryDAO cDAO = new CategoryDAO();
                Category type = cDAO.getObjectById(rs.getInt("typeId") + "");
                AccountDAO aDAO = new AccountDAO();
                Account account = aDAO.getObjectById(rs.getString("account"));
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");
                pro = new Product(productId, productName, productImage, brief, postedDate, type, account, unit, price, discount);
                list.add(pro);
            }
//            System.out.println("Execute : \n" + sql);
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public int deleteRec(Product obj) {
        c = DataConnect.getConnection();
        String sql = "delete from products\n"
                + "where productId = ?";
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, obj.getProductId());
            int affect = pst.executeUpdate();
//            System.out.println("Execute : \n" + sql);
//            System.out.println(affect + " rows affected !");
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Product getObjectById(String id) {
        c = DataConnect.getConnection();
        String sql = "select * from products where productId = ?";
        Product pro = null;
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postedDate = rs.getDate("postedDate");
                CategoryDAO cDAO = new CategoryDAO();
                Category type = cDAO.getObjectById(rs.getInt("typeId") + "");
                AccountDAO aDAO = new AccountDAO();
                Account account = aDAO.getObjectById(rs.getString("account"));
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");
                pro = new Product(productId, productName, productImage, brief, postedDate, type, account, unit, price, discount);
            }
//            System.out.println("Execute : \n" + sql);

            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pro;
    }

    @Override
    public ArrayList<Product> listAll() {
        c = DataConnect.getConnection();
        String sql = "select * from products";
        Product pro = null;
        ArrayList<Product> list = new ArrayList<>();
        try {
            pst = c.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postedDate = rs.getDate("postedDate");
                CategoryDAO cDAO = new CategoryDAO();
                Category type = cDAO.getObjectById(rs.getInt("typeId") + "");
                AccountDAO aDAO = new AccountDAO();
                Account account = aDAO.getObjectById(rs.getString("account"));
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");
                pro = new Product(productId, productName, productImage, brief, postedDate, type, account, unit, price, discount);
                list.add(pro);
            }
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Product> listSearchProduct(String condition) {
        c = DataConnect.getConnection();
        String sql = "select * from products where productName like ?";
        Product pro = null;
        ArrayList<Product> list = new ArrayList<>();
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, "%" + condition + "%");
            rs = pst.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postedDate = rs.getDate("postedDate");
                CategoryDAO cDAO = new CategoryDAO();
                Category type = cDAO.getObjectById(rs.getInt("typeId") + "");
                AccountDAO aDAO = new AccountDAO();
                Account account = aDAO.getObjectById(rs.getString("account"));
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");
                pro = new Product(productId, productName, productImage, brief, postedDate, type, account, unit, price, discount);
                list.add(pro);
            }
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Product> selectByCatId(String cId) {
        c = DataConnect.getConnection();
        String sql = "select * from products where typeId = ?";
        Product pro = null;
        ArrayList<Product> list = new ArrayList<>();
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, cId);
            rs = pst.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postedDate = rs.getDate("postedDate");
                CategoryDAO cDAO = new CategoryDAO();
                Category type = cDAO.getObjectById(rs.getInt("typeId") + "");
                AccountDAO aDAO = new AccountDAO();
                Account account = aDAO.getObjectById(rs.getString("account"));
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");
                pro = new Product(productId, productName, productImage, brief, postedDate, type, account, unit, price, discount);
                list.add(pro);
            }
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Product> selectByAcc(String aId) {
        c = DataConnect.getConnection();
        String sql = "select * from products where account = ?";
        Product pro = null;
        ArrayList<Product> list = new ArrayList<>();
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, aId);
            rs = pst.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postedDate = rs.getDate("postedDate");
                CategoryDAO cDAO = new CategoryDAO();
                Category type = cDAO.getObjectById(rs.getInt("typeId") + "");
                AccountDAO aDAO = new AccountDAO();
                Account account = aDAO.getObjectById(rs.getString("account"));
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");
                pro = new Product(productId, productName, productImage, brief, postedDate, type, account, unit, price, discount);
                list.add(pro);
            }
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO pDAO = new ProductDAO();
        ArrayList<Product> list = new ArrayList<>();
        list = pDAO.listAll();
        for (Product p : list) {
            System.out.println(p);
        }
//        Date d = new Date(2024, 10, 26);
//        System.out.println("-----------insert-------------");
//        Category c = new Category(6, "hehe", "");
//        Account accUpdate = new Account("blackpro", "999", "haha", "hihi", d, true, "0344017063", true, 1);
//        Product p = new Product("26102004", "kekekekeke", "vaix chupng", "hmmm", d, c, accUpdate, "Cái", 50000, 10);
//        Product findProduct = pDAO.getObjectById("26102004");
//        System.out.println(findProduct);
//        pDAO.updateRec(p);
//        ArrayList<Product> list2 = pDAO.listSearchProduct("giay");
//        int count = 0;
//        for (Product p : list2) {
//            System.out.println(p);
//        }
        System.out.println("haha");
        Product p1 = pDAO.getObjectById("NAG1452");
        System.out.println(p1);
        ArrayList<Product> list2 = pDAO.selectByAcc("admin");
        for (Product product : list2) {
            System.out.println(product);
        }
    }
}
