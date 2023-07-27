/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BlogDAO;
import dao.CourseDAO;
import dao.UserDAO;
import dto.Category;
import dto.Course;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dto.User;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class Home extends HttpServlet {

    public static UserDAO UserDAO = new UserDAO();
    public static BlogDAO BlogDAO = new BlogDAO();

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
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
            request.setAttribute("StatusHome", 1);
            request.setAttribute("UserDAO", UserDAO);
            request.setAttribute("BlogDAO", BlogDAO);
            
            //Publsih Course to Home
            CourseDAO dao = new CourseDAO();
            List<Course> list = dao.getAllCourse();
            List<Category> listCategories = dao.getAllCategory();
            UserDAO udao = new UserDAO();
            List<User> listUser = udao.getAllUser();
            request.setAttribute("listUser", listUser);
            request.setAttribute("listCategories", listCategories);
            request.setAttribute("listCourse", list);
            
            //Set ROLE
            if (request.getSession().getAttribute("customer") != null) {
                User u = (User) request.getSession().getAttribute("customer");
                request.getSession().setAttribute("User", u);
            }
            if (request.getSession().getAttribute("admin") != null) {
                User u = (User) request.getSession().getAttribute("admin");
                request.getSession().setAttribute("User", u);
            }
            if (request.getSession().getAttribute("sales") != null) {
                User u = (User) request.getSession().getAttribute("sales");
                request.getSession().setAttribute("User", u);
            }
            if (request.getSession().getAttribute("expert") != null) {
                User u = (User) request.getSession().getAttribute("expert");
                request.getSession().setAttribute("User", u);
            }
            
            request.getRequestDispatcher("/view/home.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
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
