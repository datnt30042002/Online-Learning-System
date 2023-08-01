/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dao.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import dto.Blog;
import dto.User;

/**
 *
 * @author trank
 */
@WebServlet(name = "MyBlog", urlPatterns = {"/myblog"})
public class MyBlog extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        BlogDAO dao = new BlogDAO();
            int id = 0;
            try {

                id = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e) {
            }
            String type = request.getParameter("type");
            if (type != null && type.equals("0")) {
                dao.delBlog(id);
            }
        String status = request.getParameter("status");
        int statusValue = 0; // Default value when status is null or cannot be parsed

        if (status != null) {
            try {
                statusValue = Integer.parseInt(status);
            } catch (NumberFormatException e) {
            }
        }
        HttpSession session = request.getSession();
        User a = (User) session.getAttribute("expert");
        int uid = a.getUserID();
        ArrayList<Blog> blogS = dao.getBlogFromStatus(statusValue, uid);
        request.setAttribute("bList", blogS);
        request.getRequestDispatcher("view/user/blog/myblog.jsp").forward(request, response);
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
