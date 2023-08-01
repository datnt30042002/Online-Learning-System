/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.course;

import dao.CourseDAO;
import dto.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trank
 */
public class ProgramTrainingManager extends HttpServlet {

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
            out.println("<title>Servlet ProgramTrainingManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProgramTrainingManager at " + request.getContextPath() + "</h1>");
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
            List<Category> list = dao.getAllCategory();
            int index = 1;

            int totalPage = list.size() % 5 == 0 ? (list.size() / 5) : ((list.size() / 5) + 1);

            if (request.getParameter("page") != null) {
                index = Integer.parseInt(request.getParameter("page"));
            }

            if (index < 1) {
                index = 1;
            } else if (index > totalPage) {
                index = totalPage;
            }

            int startIndex = (index - 1) * 5;
            int endIndex = Math.min(startIndex + 5, list.size());
            List<Category> paginatedList = list.subList(startIndex, endIndex);

            request.setAttribute("totalPage", totalPage);
            request.setAttribute("index", index);
            request.setAttribute("listC", paginatedList);
            request.getRequestDispatcher("/view/admin/trainingManager.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProgramTrainingManager.class.getName()).log(Level.SEVERE, null, ex);
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
        String categoryIdStr = request.getParameter("categoryId");
        if (categoryIdStr != null) {
            try {
                int categoryId = Integer.parseInt(categoryIdStr);
                CourseDAO dao = new CourseDAO();
                dao.toggleCategoryStatus(categoryId);
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing category ID");
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
