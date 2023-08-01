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
public class SortUser extends HttpServlet {

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
            out.println("<title>Servlet SortUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortUser at " + request.getContextPath() + "</h1>");
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
        try {
            String sortBy = request.getParameter("sortBy");
            String sortOrder = request.getParameter("sortOrder");
            UserDAO userDAO = new UserDAO();
            List<User> userList = userDAO.sortUsersByFullName(sortOrder);

            String txtSearchUserManager = request.getParameter("txtSearchUser");
            List<User> listSearchUserManager = userDAO.searchAllUserByUserName(txtSearchUserManager);
            String userRoleID = request.getParameter("userRoleID");
            List<dto.UserRole> listUserRole = userDAO.getAllUserRole();
            List<User> listUserByRole = userDAO.getAllUserByUserRoleID(userRoleID);
            request.setAttribute("listUserRole", listUserRole);
            request.setAttribute("listUserByPage", listUserByRole);
            request.setAttribute("listUserByPage", listSearchUserManager);
            request.setAttribute("listUserByPage", userList);
            request.getRequestDispatcher("/view/admin/userManager.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SortUser.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String sortBy = request.getParameter("sortBy");
            String sortOrder = request.getParameter("sortOrder");

            UserDAO userDAO = new UserDAO();
            List<User> userList = userDAO.sortUsersByFullName(sortOrder);

            if ("FullName".equals(sortBy)) {
                try {
                    userList = userDAO.sortUsersByFullName(sortOrder);
                } catch (SQLException ex) {
                    Logger.getLogger(SortUser.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if ("UserID".equals(sortBy)) {
                try {
                    userList = userDAO.sortUsersByUserID(sortOrder);
                } catch (SQLException ex) {
                    Logger.getLogger(SortUser.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if ("UserRole".equals(sortBy)) {
                try {
                    userList = userDAO.sortUsersByUserRole(sortOrder);
                } catch (SQLException ex) {
                    Logger.getLogger(SortUser.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if ("UserStatus".equals(sortBy)) {
                try {
                    userList = userDAO.sortUsersByUserStatus(sortOrder);
                } catch (SQLException ex) {
                    Logger.getLogger(SortUser.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    userList = userDAO.sortUsersByUserID("asc");
                } catch (SQLException ex) {
                    Logger.getLogger(SortUser.class.getName()).log(Level.SEVERE, null, ex);
                }
            };

            String txtSearchUserManager = request.getParameter("txtSearchUser");
            List<User> listSearchUserManager = userDAO.searchAllUserByUserName(txtSearchUserManager);
            String userRoleID = request.getParameter("userRoleID");
            List<dto.UserRole> listUserRole = userDAO.getAllUserRole();
            List<User> listUserByRole = userDAO.getAllUserByUserRoleID(userRoleID);
            request.setAttribute("listUserRole", listUserRole);
            request.setAttribute("listUserByPage", listUserByRole);
            request.setAttribute("listUserByPage", listSearchUserManager);
            request.setAttribute("listUserByPage", userList);
            request.getRequestDispatcher("/view/admin/userManager.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SortUser.class.getName()).log(Level.SEVERE, null, ex);
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
