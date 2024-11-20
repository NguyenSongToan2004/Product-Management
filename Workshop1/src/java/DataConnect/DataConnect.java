/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataConnect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ACER
 */
public class DataConnect {

    public static Connection getConnection() {
        Connection cn = null;
        String IP = "localhost";
        String instanceName = "DESKTOP-G40RPV2\\SQLEXPRESS";
        String port = "1433";
        String uid = "product";
        String pwd = "12345";
        String db = "ProductIntro";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
        try {
            Class.forName(driver);
            cn = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();;
        }

        return cn;
    }

    public static void disconnect(Connection c) {
        try {
            c.close();
        } catch (Exception e) {
        }
    }
    public static void main(String[] args) {
        Connection c = DataConnect.getConnection();
        DataConnect.disconnect(c);
    }
}
