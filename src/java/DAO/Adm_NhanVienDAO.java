
package DAO;

import Model.Adm_NhanVien;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ADMIN
 */
public class Adm_NhanVienDAO {
    
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public Adm_NhanVienDAO(){
    }
    public List<Adm_NhanVien> getAllNhanVien() {
        List<Adm_NhanVien> nhanvien = new ArrayList<>();
        String query = "SELECT * FROM nhanvien";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                nhanvien.add(new Adm_NhanVien(rs.getInt(1) ,rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
                rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return nhanvien;
    }
    
    public void insertNhanVien(String hoten, String ngaysinh, String gioitinh, String diachi, String sdt, String email, String chucvu, String ngaybatdau, String taikhoan, String matkhau) {
            String query = "INSERT INTO nhanvien (hoten, ngaysinh, gioitinh, diachi, sdt, email, chucvu, ngaybatdau, taikhoan, matkhau) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, hoten);
            ps.setString(2, ngaysinh);
            ps.setString(3, gioitinh);
            ps.setString(4, diachi);
            ps.setString(5, sdt);
            ps.setString(6, email);
            ps.setString(7, chucvu);
            ps.setString(8, ngaybatdau);
            ps.setString(9, taikhoan);
            ps.setString(10, matkhau);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }
    
    public void deleteNhanVien(String manv) {
    String query = "DELETE FROM nhanvien WHERE manv = ?";
    try {
        conn = new DBConnection().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, manv);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeResources();
    }
    }
    
    public Adm_NhanVien getmaNhanVien(int manv){
        String query ="SELECT* FROM nhanvien WHERE manv = ?";
        try {
        conn = new DBConnection().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, manv);
        rs = ps.executeQuery();
         while (rs.next()) {
                return new Adm_NhanVien(rs.getInt(1) ,rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
                rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11));
            }
    } catch (SQLException e) {
        e.printStackTrace();
    }
        return null;
    }
    
    public void updateNhanVien(String manv, String hoten, String ngaysinh, String gioitinh, String sdt, String email, String chucvu) {
            String query = "UPDATE nhanvien SET hoten=?, ngaysinh=?, gioitinh=?, sdt=?, email=?, chucvu=? WHERE manv=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, hoten);
            ps.setString(2, ngaysinh);
            ps.setString(3, gioitinh);
            ps.setString(4, sdt);
            ps.setString(5, email);
            ps.setString(6, chucvu);
            ps.setString(7, manv);
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }
    
    public List<Adm_NhanVien> searchNhanVienByName(String manv, String hoten, String email, String chucvu) {
        List<Adm_NhanVien> nhanvien = new ArrayList<>();
        String query = "SELECT * FROM nhanvien WHERE manv LIKE ? OR hoten LIKE ? OR email LIKE ? OR chucvu LIKE ?";
        
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + manv + "%");
            ps.setString(2, "%" + hoten + "%");
            ps.setString(3, "%" + email + "%");
            ps.setString(4, "%" + chucvu + "%");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                nhanvien.add(new Adm_NhanVien(rs.getInt(1) ,rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
                rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        
        return nhanvien;
    }

    
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
