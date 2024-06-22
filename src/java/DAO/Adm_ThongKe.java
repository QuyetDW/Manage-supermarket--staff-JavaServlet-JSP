
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
/**
 *
 * @author ADMIN
 */
public class Adm_ThongKe {
    
    public int getTotalNhanVien() {
        int totalNhanVien = 0;
        try (Connection connection = DBConnection.getConnection()) {
            String totalQuery = "SELECT COUNT(*) AS Total FROM nhanvien";
            PreparedStatement totalPs = connection.prepareStatement(totalQuery);
            ResultSet totalRs = totalPs.executeQuery();
            if (totalRs.next()) {
                totalNhanVien = totalRs.getInt("Total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalNhanVien;
    }

    public Map<String, Integer> getChucVuCount() {
        Map<String, Integer> chucVuCount = new HashMap<>();
        try (Connection connection = DBConnection.getConnection()) {
            String chucVuQuery = "SELECT chucvu, COUNT(*) AS SoLuong FROM nhanvien GROUP BY chucvu";
            PreparedStatement chucVuPs = connection.prepareStatement(chucVuQuery);
            ResultSet chucVuRs = chucVuPs.executeQuery();
            while (chucVuRs.next()) {
                chucVuCount.put(chucVuRs.getString("chucvu"), chucVuRs.getInt("SoLuong"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chucVuCount;
    }
}
