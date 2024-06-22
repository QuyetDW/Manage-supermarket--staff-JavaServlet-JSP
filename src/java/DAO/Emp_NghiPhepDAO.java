/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Emp_NghiPhep;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import org.apache.catalina.valves.StuckThreadDetectionValve;

/**
 *
 * @author ADMIN
 */
public class Emp_NghiPhepDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public Emp_NghiPhepDAO(){}
    
        public List<Emp_NghiPhep> getAllNghiPhep() {
        List<Emp_NghiPhep> nghiphep = new ArrayList<>();
        String query = "SELECT * FROM nghiphep;";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                nghiphep.add(new Emp_NghiPhep(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                         rs.getString(5)));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return nghiphep;
    }
    public void deleteNghiPhep(String id){
        String query = "DELETE FROM nghiphep WHERE id = ?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch(Exception e){
            
        }
    }
    public void insertNghiPhep(String manv, String ngaynghi, String lydo, String trangthai){
        String query = "INSERT INTO nghiphep (manv, ngaynghi, lydo, trangthai) VALUES (?,?,?,?);";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);  
            ps.setString(1, manv);
            ps.setString(2, ngaynghi);
            ps.setString(3, lydo);
            ps.setString(4, trangthai);
            ps.executeUpdate();
            
        } catch(Exception e){
            
        }
    }
    
    public Emp_NghiPhep getNghiPhepByID(String id){
        String query = "select * from nghiphep where id=?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Emp_NghiPhep(rs.getInt(1),
                rs.getInt(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5));
            }
        }catch(Exception e){
            
        }
        return null;
    }
    public void updateNghiPhep(String id, String manv, String ngaynghi, String lydo, String trangthai){
        String query = "UPDATE nghiphep SET manv = ?, ngaynghi = ?, lydo = ?, trangthai = ? WHERE id = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, manv);
            ps.setString(2, ngaynghi);
            ps.setString(3, lydo);
            ps.setString(4, trangthai);
            ps.setString(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public ArrayList<Emp_NghiPhep> timkiem(String manv){
        ArrayList<Emp_NghiPhep> list = new ArrayList<>();
        String sql = "SELECT * FROM nghiphep WHERE manv LIKE ?";
        try {
            DBConnection db = new DBConnection();
            PreparedStatement st = db.getConnection().prepareStatement(sql);
            st.setString(1,"%" + manv + "%" );
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                   Emp_NghiPhep cc = new Emp_NghiPhep();

                    cc.setId(rs.getInt("id"));
                    cc.setManv(rs.getInt("manv"));
                    cc.setNgaynghi(rs.getString("ngaynghi"));
                    cc.setLydo(rs.getString("lydo"));
                    cc.setTrangthai(rs.getString("trangthai"));

                    list.add(cc);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return  list;
    }    
    
//    public int count(String txtSearch){
//        try {
//            String query = "select count(*) from nghiphep where id like ?";
//            DBConnection db = new DBConnection();
//            conn = db.getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, "%"+ txtSearch+"%");
//            rs = ps.executeQuery();
//            while(rs.next()){
//                return rs.getInt(1);
//            }
//        } catch (Exception e) {
//        }
//        return 0;
//    }

        
    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }  
}
