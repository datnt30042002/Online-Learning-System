/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lesson;

import dao.LessonDAO;
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
public class SortLessonDetail extends HttpServlet {

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
            out.println("<title>Servlet SortLessonDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortLessonDetail at " + request.getContextPath() + "</h1>");
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
            LessonDAO dao = new LessonDAO();
            List<dto.LessonDetail> LessonDetailList = dao.sortLessonDetailByTime(sortOrder);

            String txtSearchLessonDetail = request.getParameter("txtSearchLessonDetail");
            List<dto.LessonDetail> listSearchLessonDetail = dao.searchAllLessonDetailByTitile(txtSearchLessonDetail);

            request.setAttribute("listLessonDetailByPage", listSearchLessonDetail);
            request.setAttribute("listLessonDetailByPage", LessonDetailList);
            request.getRequestDispatcher("view/user/lesson/lessonDetailManager.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SortLessonDetail.class.getName()).log(Level.SEVERE, null, ex);
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

            LessonDAO dao = new LessonDAO();
            List<dto.LessonDetail> lessonDetailList = dao.sortLessonDetailByTime(sortOrder);

            if ("Time".equals(sortBy)) {
                lessonDetailList = dao.sortLessonDetailByTime(sortOrder);
            } else if ("Title".equals(sortBy)) {
                lessonDetailList = dao.sortLessonDetailByTitle(sortOrder);
            } else if ("ID".equals(sortBy)) {
                lessonDetailList = dao.sortLessonDetailByLessonDetailID(sortOrder);
            }else {
                lessonDetailList = dao.sortLessonDetailByTime("asc");
            }

            String txtSearchLessonDetail = request.getParameter("txtSearchLessonDetail");
            List<dto.LessonDetail> listSearchLessonDetail = dao.searchAllLessonDetailByTitile(txtSearchLessonDetail);

            request.setAttribute("listLessonDetailByPage", lessonDetailList);
            request.setAttribute("listSearchLessonDetail", listSearchLessonDetail);
            request.getRequestDispatcher("view/user/lesson/lessonDetailManager.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SortLessonDetail.class.getName()).log(Level.SEVERE, null, ex);
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
