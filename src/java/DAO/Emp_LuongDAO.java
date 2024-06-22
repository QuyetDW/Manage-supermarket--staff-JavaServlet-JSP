/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Emp_ChamCong;
import Model.Emp_Luong;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author PC
 */
public class Emp_LuongDAO {
    public ArrayList<Emp_Luong> getAllLuong(){
            ArrayList<Emp_Luong> list = new ArrayList<Emp_Luong>();
            String sql ="select * from luong";
            try {
                DBConnection db = new DBConnection();
                PreparedStatement st = db.getConnection().prepareStatement(sql);
                ResultSet rs = st.executeQuery();

                while (rs.next()){
                    
                    Emp_Luong cc = new Emp_Luong();
                    
                    cc.setId_luong(rs.getInt("id_luong"));
                    cc.setManv(rs.getInt("manv"));
                    cc.setNgayluong(rs.getString("ngayLuong"));
                    cc.setLuongcoban(rs.getInt("luongcoban"));
                    cc.setLuongtheogio(rs.getInt("luongtheogio"));
                    cc.setSogiolam(rs.getInt("sogiolam"));
                    cc.setSongaynghi(rs.getInt("songaynghi"));
                    cc.setLuongthuong(rs.getInt("luongthuong"));
                    cc.setLuongtong(rs.getInt("tongluong"));
                    
                    list.add(cc);
                }

            } catch (Exception e){
                e.printStackTrace();
                return null;
            }
            return list;
    }
        public ArrayList<Emp_Luong> timkiem(int id){
        ArrayList<Emp_Luong> list = new ArrayList<>();
        String sql = "SELECT * FROM luong WHERE manv=?";
        try {
            DBConnection db = new DBConnection();
            PreparedStatement st = db.getConnection().prepareStatement(sql);
            st.setInt(1, id  );
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                    Emp_Luong cc = new Emp_Luong();
                    
                    cc.setId_luong(rs.getInt("id_luong"));
                    cc.setManv(rs.getInt("manv"));
                    cc.setNgayluong(rs.getString("ngayLuong"));
                    cc.setLuongcoban(rs.getInt("luongcoban"));
                    cc.setLuongtheogio(rs.getInt("luongtheogio"));
                    cc.setSogiolam(rs.getInt("sogiolam"));
                    cc.setSongaynghi(rs.getInt("songaynghi"));
                    cc.setLuongthuong(rs.getInt("luongthuong"));
                    cc.setLuongtong(rs.getInt("tongluong"));

                    list.add(cc);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return  list;
    }
    public static void main(String[] args) {
        Emp_LuongDAO dao = new Emp_LuongDAO();
        List<Emp_Luong> list = dao.getAllLuong();
        System.err.println(list);
    }
    public double convertTimeToHours(String time) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm a");
        Date date = dateFormat.parse(time);
        long millis = date.getTime();
        return (millis / (1000.0 * 60 * 60)) % 24;
    }

    public double calculateWorkingHours(String startTime, String endTime) throws ParseException {
        double startHours = convertTimeToHours(startTime);
        double endHours = convertTimeToHours(endTime);
        return endHours - startHours;
    }
    public Emp_Luong getLuongByManv(int manv){
        String sql = "SELECT * FROM luong WHERE manv = ?";
        try {
                DBConnection db = new DBConnection();
                PreparedStatement st = db.getConnection().prepareStatement(sql);
                st.setInt(1, manv);
                ResultSet rs = st.executeQuery();

                if (rs.next()){
                    
                    Emp_Luong cc = new Emp_Luong();
                    
                    cc.setId_luong(rs.getInt("id_luong"));
                    cc.setManv(rs.getInt("manv"));   
                    cc.setNgayluong(rs.getString("ngayLuong"));
                    cc.setLuongcoban(rs.getInt("luongcoban"));
                    cc.setLuongtheogio(rs.getInt("luongtheogio"));
                    cc.setSogiolam(rs.getInt("sogiolam"));
                    cc.setSongaynghi(rs.getInt("songaynghi"));
                    cc.setLuongthuong(rs.getInt("luongthuong"));
                    cc.setLuongtong(rs.getInt("tongluong"));
                    
                    return cc;
                }

            } catch (Exception e){
                e.printStackTrace();
                
            }
            return null;
    }
    public void them(Emp_Luong luong) throws SQLException{
         String sql = "INSERT INTO luong (manv,ngayLuong,luongcoban,luongtheogio,sogiolam,songaynghi,luongthuong,tongluong) VALUES (?,?,?,?,?,?,?,?)";
        try {
            DBConnection db = new DBConnection();
            PreparedStatement st = db.getConnection().prepareStatement(sql);
            
            st.setInt(1, luong.getManv());
            st.setString(2,luong.getNgayluong());
            st.setInt(3, luong.getLuongcoban());
            st.setInt(4, luong.getLuongtheogio());
            st.setInt(5, luong.getSogiolam());
            st.setInt(6, luong.getSongaynghi());
            st.setInt(7, luong.getLuongthuong());
            st.setInt(8, luong.getLuongtong());
            
            st.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    public int tongluong(int luongthuong, int songaynghi, int tongsogio, int luongtheogio){
        return luongthuong - (songaynghi*300) + (tongsogio*luongtheogio);
    }
    
    public void delete(int id) {
        String sql = "DELETE FROM luong WHERE id_luong = ?";
        try {
            DBConnection db = new DBConnection();
            PreparedStatement st = db.getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    
    public void sua(Emp_Luong luong){
        String sql = "update luong set manv=?,ngayLuong=?, luongcoban=?, luongtheogio=?,sogiolam=?,songaynghi=?,luongthuong=?,tongluong=? where id_luong=?";
        try {
            DBConnection db = new DBConnection();
            PreparedStatement st = db.getConnection().prepareStatement(sql);
            
            st.setInt(1, luong.getManv());
            st.setString(2, luong.getNgayluong());
            st.setInt(3, luong.getLuongcoban());
            st.setInt(4, luong.getLuongtheogio());
            st.setInt(5, luong.getSogiolam());
            st.setInt(6, luong.getSongaynghi());
            st.setInt(7, luong.getLuongthuong());
            st.setInt(8, luong.getLuongtong());
            st.setInt(9, luong.getId_luong());
            
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    public int tongLuong(){
        int tongluong = 0;
        String sql = "SELECT SUM(tongluong) AS tongLuong FROM luong";
        try {
            DBConnection db = new DBConnection();
            PreparedStatement st = db.getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                tongluong = rs.getInt("tongLuong");
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return  tongluong;
    }
}
