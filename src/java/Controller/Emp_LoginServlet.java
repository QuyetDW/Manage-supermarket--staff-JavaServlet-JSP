
package Controller;

import DAO.Emp_LoginDAO;
import Model.Emp_Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class Emp_LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
        // Input validation
        String email = request.getParameter("email");
        String matkhau = request.getParameter("matkhau");

        if (email == null || email.isEmpty() || matkhau == null || matkhau.isEmpty()) {
            request.setAttribute("errorMessage", "*Vui lòng nhập đúng Email và Mật khẩu...");
            request.getRequestDispatcher("Adm_Login.jsp").forward(request, response);
            return;
        }
        
        Emp_LoginDAO loginDAO = new Emp_LoginDAO();
        Emp_Account account = loginDAO.checkLogin(email, matkhau);

        if (account == null) {
            request.setAttribute("errorMessage", "*Email hoặc mật khẩu không hợp lệ!!");
            request.getRequestDispatcher("Emp_Login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("account", account);
            response.sendRedirect("Emp_Dahsboard.jsp");
        }
    } catch (Exception e) {
        Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Login processing failed", e);
        request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
        request.getRequestDispatcher("Emp_Login.jsp").forward(request, response);
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
