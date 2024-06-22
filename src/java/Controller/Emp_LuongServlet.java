/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.Emp_LuongDAO;
import Model.Emp_Luong;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import DAO.Emp_ChamCongDAO;
import Model.Emp_Account;
import Model.Emp_ChamCong;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
/**
 *
 * @author PC
 */
@WebServlet(name = "Emp_LuongServlet", urlPatterns = {"/empluongservlet","/searchL"})
public class Emp_LuongServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Emp_LuongServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Emp_LuongServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        Emp_ChamCongDAO dao = new Emp_ChamCongDAO();
        Emp_LuongDAO luong = new Emp_LuongDAO();
        int maNV = Integer.parseInt(request.getParameter("manv"));
        String ngay = request.getParameter("ngay");
        int luongcoban = Integer.parseInt(request.getParameter("luongcoban"));
        int luongtheogio = Integer.parseInt(request.getParameter("luongtheogio"));
        int songaynghi = Integer.parseInt(request.getParameter("songaynghi"));
        int luongthuong = Integer.parseInt(request.getParameter("luongthuong"));
        if(dao.kiemTraManv(maNV)){
            int tongsogio = dao.getTongSoGioLam(maNV);
            try {
                int tongluong = luong.tongluong(luongthuong, songaynghi, tongsogio, luongtheogio);
                Emp_Luong lnv = new Emp_Luong(maNV,ngay,luongcoban , luongtheogio, tongsogio, songaynghi,luongthuong,tongluong);
                luong.them(lnv);
                HttpSession session = request.getSession();
                session.setAttribute("tinhluong", true);
                response.sendRedirect("admluongservlet");
            } catch (Exception e) {
            }
        }else{
                HttpSession session = request.getSession();
                session.setAttribute("thongbao", true);
                response.sendRedirect("admluongservlet");
        }
    } 
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response); 
        
        String searchID = request.getParameter("searchName");
        int id = Integer.parseInt(searchID);
        Emp_LuongDAO dao = new Emp_LuongDAO();
        List<Emp_Luong> list = dao.timkiem(id);
        
        request.setAttribute("dateL", list);
        request.getRequestDispatcher("Emp_Luong.jsp").forward(request, response);
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
