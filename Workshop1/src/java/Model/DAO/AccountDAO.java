/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.DTO.Account;
import DataConnect.DataConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class AccountDAO implements CommonFunction<Account> {

    private Connection c = null;
    private ResultSet rs = null;
    private PreparedStatement pst = null;

    @Override
    public int insertRec(Account obj) {
        c = DataConnect.getConnection();
        String sql = "insert into Accounts(account,pass,lastName,firstName,birthday,gender,phone,isUse,roleInSystem) Values "
                + "(?,?,?,?,?,?,?,?,?)";
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, obj.getAccount());
            pst.setString(2, obj.getPass());
            pst.setString(3, obj.getLastName());
            pst.setString(4, obj.getFirstName());
            pst.setDate(5, (Date) obj.getBirthday());
            pst.setBoolean(6, obj.isGender()); // 1 : male || 0 : female
            pst.setString(7, obj.getPhone()); // Only digits, start with 0, include 10 digit 
            pst.setBoolean(8, obj.isIsUse()); // 1: being used || 0 : is prevented
            pst.setInt(9, obj.getRoleInSystem()); // 1 : admin - others : staff
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
    public int updateRec(Account obj) {
        c = DataConnect.getConnection();
        String sql = "update Accounts\n"
                + "set pass = ? , lastName = ? , firstName = ? , birthday = ? , gender = ? , phone = ? , isUse = ? , roleInSystem = ? \n"
                + "where account = ?";
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, obj.getPass());
            pst.setString(2, obj.getLastName());
            pst.setString(3, obj.getFirstName());
            pst.setDate(4, (Date) obj.getBirthday());
            pst.setBoolean(5, obj.isGender()); // 1 : male || 0 : female
            pst.setString(6, obj.getPhone()); // Only digits, start with 0, include 10 digit 
            pst.setBoolean(7, obj.isIsUse()); // 1: being used || 0 : is prevented
            pst.setInt(8, obj.getRoleInSystem()); // 1 : admin - others : staff
            pst.setString(9, obj.getAccount());
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
    public int deleteRec(Account obj) {
        c = DataConnect.getConnection();
        String sql = "delete from Accounts\n"
                + "where account = ?";
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, obj.getAccount());
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
    public Account getObjectById(String id) {
        c = DataConnect.getConnection();
        String sql = "select * from Accounts where account = ?";
        Account acc = null;
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                String account = rs.getString("account");
                String pass = rs.getString("pass");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                Date birthday = rs.getDate("birthday");
                boolean gender = rs.getBoolean("gender");
                String phone = rs.getString("phone");
                boolean isUse = rs.getBoolean("isUse");
                int roleInSystem = rs.getInt("roleInSystem");
                acc = new Account(account, pass, lastName, firstName, birthday, gender, phone, isUse, roleInSystem);
//                System.out.println("Execute : \n" + sql);
            }
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    @Override
    public ArrayList<Account> listAll() {
        c = DataConnect.getConnection();
        String sql = "select * from Accounts";
        Account acc = null;
        ArrayList<Account> list = new ArrayList<>();
        try {
            pst = c.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                String account = rs.getString("account");
                String pass = rs.getString("pass");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                Date birthday = rs.getDate("birthday");
                boolean gender = rs.getBoolean("gender");
                String phone = rs.getString("phone");
                boolean isUse = rs.getBoolean("isUse");
                int roleInSystem = rs.getInt("roleInSystem");
                acc = new Account(account, pass, lastName, firstName, birthday, gender, phone, isUse, roleInSystem);
                list.add(acc);
            }
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Account checkExist(String account, String password) {
        c = DataConnect.getConnection();
        String sql = "select * from Accounts where account = ? and pass = ?";
        Account acc = null;
        try {
            pst = c.prepareStatement(sql);
            pst.setString(1, account);
            pst.setString(2, password);
            rs = pst.executeQuery();
            while (rs.next()) {
                String pass = rs.getString("pass");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                Date birthday = rs.getDate("birthday");
                boolean gender = rs.getBoolean("gender");
                String phone = rs.getString("phone");
                boolean isUse = rs.getBoolean("isUse");
                int roleInSystem = rs.getInt("roleInSystem");
                acc = new Account(account, pass, lastName, firstName, birthday, gender, phone, isUse, roleInSystem);
            }
            DataConnect.disconnect(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        Date d = new Date(104, 9, 26);
//        Account acc = new Account("blackpro","yasuo", "black", "pro", d, true, "0344017063", true, 1);
//        System.out.println(acc);
//        a.insertRec(acc);
//        Account accUpdate = new Account("blackpro","999", "haha", "hihi", d, true, "0344017063", true, 1);
//        a.updateRec(accUpdate);
        System.out.println("-----------Show All Accounts-----------");
        ArrayList<Account> list = new ArrayList<>();
//        Account acc = new Account("blackpro","yasuo", "black", "pro", d, true, "0344017063", true, 1);
//        Account aa = a.checkExist("blackpro","999");
        list = a.listAll();
        for (Account account : list) {
            System.out.println(account);
        }
    }
}
