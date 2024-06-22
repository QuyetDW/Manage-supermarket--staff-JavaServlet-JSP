
package Controller;

import DAO.Adm_NhanVienDAO;
import Model.Adm_NhanVien;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Adm_NhanVienServlet")
public class Adm_NhanVienServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

            Adm_NhanVienDAO nv = new Adm_NhanVienDAO();
            List<Adm_NhanVien> nhanvien = nv.getAllNhanVien();
            request.setAttribute("nvs", nhanvien);
            request.getRequestDispatcher("Adm_NhanVien.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "NhanVienServlet handling employee operations";
    }
}