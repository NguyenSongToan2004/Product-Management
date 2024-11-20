/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.DTO.Category;
import DataConnect.DataConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class CategoryDAO implements CommonFunction<Category> {

    private Connection c = null;
    private ResultSet rs = null;
    private PreparedStatement pst = null;
    
    @Override
    public int insertRec(Category obj) {
        c = DataConnect.getConnection();
        String sql = "insert into Categories(categoryName,memo) Values "
                + "(?,?)";
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, obj.getCategoryName());
            pst.setString(2, obj.getMemo());
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
    public int updateRec(Category obj) {
        c = DataConnect.getConnection();
        String sql = "update categories\n"
                + "set categoryName = ? , memo = ? "
                + "where typeId = ?";
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, obj.getCategoryName());
            pst.setString(2, obj.getMemo());
            pst.setInt(3, obj.getTypeId());
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
    public int deleteRec(Category obj) {
        c = DataConnect.getConnection();
        String sql = "delete from categories\n"
                + "where typeId = ?";
        try {
            pst = c.prepareStatement(sql);
            pst.setInt(1, obj.getTypeId());
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
    public Category getObjectById(String id) {
        c = DataConnect.getConnection();
        String sql = "select * from Categories where typeId = ?";
        Category cat = null;
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                int typedId = rs.getInt("typeId");
                String categoryName = rs.getString("categoryName");
                String memo = rs.getString("memo");
                cat = new Category(typedId, categoryName, memo);
//                System.out.println("Execute : \n" + sql);
            }
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }

    @Override
    public ArrayList<Category> listAll() {
        c = DataConnect.getConnection();
        String sql = "select * from Categories";
        Category cat = null;
        ArrayList<Category> list = new ArrayList<>();
        try {
            pst = c.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                int typedId = rs.getInt("typeId");
                String categoryName = rs.getString("categoryName");
                String memo = rs.getString("memo");
                cat = new Category(typedId, categoryName, memo);
                list.add(cat);
            }
//            System.out.println("Execute : \n" + sql);

            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        CategoryDAO cDAO = new CategoryDAO();
        ArrayList<Category> list = new ArrayList<>();

        //        Category cat1 = new Category("Blackpro Shoes", "");
//        cDAO.insertRec(cat1);
        Category catUpdate = new Category(7, "HEHE `s shoes", "");
        cDAO.deleteRec(catUpdate);
        cDAO.updateRec(catUpdate);
        list = cDAO.listAll();
        for (Category c : list) {
            System.out.println(c.toString());
        }
        Category findCat = cDAO.getObjectById("1");
        System.out.println(findCat);
    }
}
