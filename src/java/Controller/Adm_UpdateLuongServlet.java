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

/**
 *
 * @author PC
 */
public class Adm_UpdateLuongServlet extends HttpServlet {
   
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
            out.println("<title>Servlet Adm_UpdateLuongServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Adm_UpdateLuongServlet at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        int maluong = Integer.parseInt(request.getParameter("maluong"));
        int manv = Integer.parseInt(request.getParameter("manv"));
        String ngay = request.getParameter("ngay");
        int luongcoban = Integer.parseInt(request.getParameter("luongcoban"));
        int luongtheogio = Integer.parseInt(request.getParameter("luongtheogio"));
        int sogiolam = Integer.parseInt(request.getParameter("sogiolam"));
        int songaynghi = Integer.parseInt(request.getParameter("songaynghi"));
        int luongthuong = Integer.parseInt(request.getParameter("luongthuong")); 
        Emp_LuongDAO luong = new Emp_LuongDAO();
        int tongluong = luong.tongluong(luongthuong, songaynghi, sogiolam, luongtheogio);
        Emp_LuongDAO dao = new Emp_LuongDAO();
        Emp_Luong c = new Emp_Luong(maluong, manv,ngay, luongcoban, luongtheogio, sogiolam, songaynghi, luongthuong, tongluong);
        dao.sua(c);
        response.sendRedirect("admluongservlet");
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
