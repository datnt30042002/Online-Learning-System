/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.course;

import dao.CourseDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import dto.Course;
import dto.User;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AddCourse extends HttpServlet {

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
            out.println("<title>Servlet AddCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCourse at " + request.getContextPath() + "</h1>");
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
            String UserID = request.getParameter("User_UserID");
            
            UserDAO udao = new UserDAO();
            List<User> listUser = udao.getAllUser();
            request.setAttribute("listUser", listUser);
            
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserbyUserID(UserID);
            request.setAttribute("user", user);
            
            
            request.getRequestDispatcher("/view/user/course/addCourse.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddCourse.class.getName()).log(Level.SEVERE, null, ex);
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

        try {

            String CourseID = request.getParameter("CourseID");
            String Name = request.getParameter("Name");
            String Image = request.getParameter("Image");
            String CourseInfo = request.getParameter("CourseInfo");
            String Description = request.getParameter("Description");
            String Status = request.getParameter("Status");
            String User_UserID = request.getParameter("User_UserID");
            String Category_CategoryID = request.getParameter("Category_CategoryID");
            String FeeStatus = request.getParameter("FeeStatus");

            CourseDAO dao = new CourseDAO();
            Course c = dao.checkExistSID(CourseID);
            if (c == null) {
                try {
                    // add
                    dao.addCourse(CourseID, Name, Image, CourseInfo, Description, Status, User_UserID, Category_CategoryID, FeeStatus);
                    request.setAttribute("messSuccess", "Add new Course success");
                    request.getRequestDispatcher("/view/user/course/addCourse.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(AddCourse.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                // notifications
                request.setAttribute("mess", "Course ID already exist");
                request.getRequestDispatcher("/view/user/course/addCourse.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddCourse.class.getName()).log(Level.SEVERE, null, ex);
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
