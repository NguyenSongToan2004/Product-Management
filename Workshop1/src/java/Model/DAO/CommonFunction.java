/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public interface CommonFunction<T> {
    int insertRec(T obj);
    int updateRec(T obj);
    int deleteRec(T obj);
    T getObjectById(String id);
    ArrayList<T> listAll();
}
