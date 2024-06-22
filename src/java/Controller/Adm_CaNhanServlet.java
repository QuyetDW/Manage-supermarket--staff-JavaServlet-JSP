
package Controller;

import DAO.Adm_LoginDAO;
import Model.Adm_Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class Adm_CaNhanServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("matkhau");
        String newPassword = request.getParameter("newmk");

        Adm_LoginDAO loginDAO = new Adm_LoginDAO();
        Adm_Account account = loginDAO.checkLogin(email, currentPassword);

        if (account == null) {
            request.setAttribute("errorMessage", "*Mật khẩu hiện tại không hợp lệ!");
            request.getRequestDispatcher("Adm_CaNhan.jsp").forward(request, response);
        } else {
            loginDAO.ChangeMK(newPassword, email);
            account.setMatkhau(newPassword);
            request.getSession().setAttribute("account", account);
            response.sendRedirect("Adm_CaNhan.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
