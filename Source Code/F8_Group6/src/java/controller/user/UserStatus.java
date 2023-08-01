/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.UserDAO;
import dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author admin
 */
public class UserStatus extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserStatus</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserStatus at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            String Status = request.getParameter("Status");
            UserDAO userDAO = new UserDAO();
            List<User> listUserByStatus = userDAO.getAllUserByStatus(Status);
            
            String sortBy = request.getParameter("sortBy");
            String sortOrder = request.getParameter("sortOrder");
            List<User> userList = userDAO.sortUsersByFullName(sortOrder);
            String txtSearchUserManager = request.getParameter("txtSearchUser");
            List<User> listSearchUserManager = userDAO.searchAllUserByUserName(txtSearchUserManager);
            String userRoleID = request.getParameter("userRoleID");
            List<dto.UserRole> listUserRole = userDAO.getAllUserRole();
            //List<User> listUserByRole = userDAO.getAllUserByUserRoleID(userRoleID);
            request.setAttribute("listUserRole", listUserRole);
            request.setAttribute("listUserByPage", listUserByStatus);
            request.setAttribute("listUserByPage", listSearchUserManager);
            request.setAttribute("listUserByPage", userList);
            request.setAttribute("listUserByPage", userList);
            request.getRequestDispatcher("/view/admin/userManager.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
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
