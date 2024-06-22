
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Emp_Account;

/**
 *
 * @author ADMIN
 */
public class Emp_LoginDAO {

    private static final Logger LOGGER = Logger.getLogger(Emp_LoginDAO.class.getName());

    // SQL query as a constant
    private static final String LOGIN_QUERY = "SELECT * FROM nhanvien WHERE email = ? AND matkhau = ?";

    public Emp_Account checkLogin(String email, String matkhau) {
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(LOGIN_QUERY)) {

            ps.setString(1, email);
            ps.setString(2, matkhau);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Assuming 'email' and 'matkhau' are the column names
                    return new Emp_Account(rs.getInt("manv"), rs.getString("hoten"), rs.getDate("ngaysinh"), rs.getString("gioitinh"), rs.getString("diachi"),
                    rs.getString("sdt"), rs.getString("email"), rs.getString("chucvu"), rs.getDate("ngaybatdau"), rs.getString("taikhoan"),
                    rs.getString("matkhau"));
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking login for email: " + email, e);
        }
        return null;
    }
    
    public void ChangeMK(String matkhau, String email){
        String query = "UPDATE nhanvien SET matkhau = ? WHERE email = ?";
        try(Connection conn = new DBConnection().getConnection();
            PreparedStatement ps = conn.prepareStatement(query)){
            ps.setString(1, matkhau);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}