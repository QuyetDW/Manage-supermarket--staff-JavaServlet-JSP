/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.Emp_LuongDAO;
import DAO.Emp_LuongDAO;
import Model.Emp_Luong;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author PC
 */
@WebServlet(name = "Adm_LuongServlet", urlPatterns = {"/admluongservlet","/searchL"})
public class Adm_LuongServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        

    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        Emp_LuongDAO dao = new Emp_LuongDAO(); 
        String action = request.getServletPath();
        int tongLuong = dao.tongLuong();
               if (action.equals("/searchL")) {
                   doPost(request, response);
               } else {
                   // Default action: load all employees
                        request.setAttribute("tongLuong", tongLuong);
                        List<Emp_Luong> list = dao.getAllLuong();
                        request.setAttribute("dateL", list);
                        request.getRequestDispatcher("Adm_qlLuong.jsp").forward(request, response);
        
               }

        

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String searchID = request.getParameter("searchName");
        int id = Integer.parseInt(searchID);
        Emp_LuongDAO dao = new Emp_LuongDAO();
        List<Emp_Luong> list = dao.timkiem(id);
        
        request.setAttribute("dateL", list);
        request.getRequestDispatcher("Adm_qlLuong.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
