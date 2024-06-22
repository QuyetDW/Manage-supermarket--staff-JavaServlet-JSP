
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;
import Model.Adm_Account;

/**
 *
 * @author ADMIN
 */
public class Adm_LoginDAO {
    private static final Logger LOGGER = Logger.getLogger(Adm_LoginDAO.class.getName());

    public Adm_Account checkLogin(String email, String matkhau) {
        String query = "SELECT * FROM admin WHERE email = ? AND matkhau = ?";
        try (Connection conn = new DBConnection().getConnection();
            PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, email);
            ps.setString(2, matkhau);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Adm_Account(rs.getString("tenadmin"), rs.getString("taikhoan"), rs.getString("matkhau"), rs.getString("email"));
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking login for email: " + email, e);
        }
        return null;
    }
    
    public void ChangeMK(String matkhau, String email){
        String query = "UPDATE admin SET matkhau = ? WHERE email = ?";
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