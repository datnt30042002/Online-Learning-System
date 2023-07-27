/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.course;

import dao.CourseDAO;
import dto.Category;
import dto.Course;
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
public class SortCourse extends HttpServlet {

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
            out.println("<title>Servlet SortCourse</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortCourse at " + request.getContextPath() + "</h1>");
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
            CourseDAO dao = new CourseDAO();
            String sortBy = request.getParameter("sortBy");
            String sortOrder = request.getParameter("sortOrder");
            List<Course> sortCourseList = dao.sortCourseBySTT(sortOrder);
            
            String txtSearchCourse = request.getParameter("txtSearchCourse");
            List<Course> listSearchCourse = dao.searchAllCourseByName(txtSearchCourse);
            
            List<Category> listCategories = dao.getAllCategory();
            
            request.setAttribute("listCategories", listCategories);
            request.setAttribute("CourselistByPage", listSearchCourse);
            request.setAttribute("CourselistByPage", sortCourseList);
        } catch (SQLException ex) {
            Logger.getLogger(SortCourse.class.getName()).log(Level.SEVERE, null, ex);
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
            String sortBy = request.getParameter("sortBy");
            String sortOrder = request.getParameter("sortOrder");

            CourseDAO dao = new CourseDAO();
            List<Course> sortCourseList = dao.sortCourseBySTT(sortOrder);

            if ("ID".equals(sortBy)) {
                sortCourseList = dao.sortCourseBySTT(sortOrder);
            } else if ("Name".equals(sortBy)) {
                sortCourseList = dao.sortCourseByName(sortOrder);
            } else {
                sortCourseList = dao.sortCourseBySTT("asc");
            }

            String txtSearchCourse = request.getParameter("txtSearchCourse");
            List<Course> listSearchCourse = dao.searchAllCourseByName(txtSearchCourse);
            
            List<Category> listCategories = dao.getAllCategory();

            request.setAttribute("listCategories", listCategories);
            request.setAttribute("CourselistByPage", listSearchCourse);
            request.setAttribute("CourselistByPage", sortCourseList);
            request.getRequestDispatcher("/view/user/course/courseManager.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SortCourse.class.getName()).log(Level.SEVERE, null, ex);
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
