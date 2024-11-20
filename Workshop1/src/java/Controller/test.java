/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class test {
    public static void main(String[] args) {
        String num = "C00003";
        int max = Integer.parseInt(num.substring(1, 6)) + 1;
        System.out.println(num.substring(0, 5));
        num = String.format("C%05d", max);
        System.out.println(num);
    }
}
