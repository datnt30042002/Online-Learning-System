/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dao.BlogDAO;
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
public class BlogManager extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            BlogDAO dao = new BlogDAO();
            List<dto.Blog> list = dao.getListBlog();
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
            List<dto.Blog> paginatedList = list.subList(startIndex, endIndex);

            request.setAttribute("totalPage", totalPage);
            request.setAttribute("index", index);
            request.setAttribute("listBlog", paginatedList);
            request.getRequestDispatcher("/view/admin/blogManager.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BlogManager.class.getName()).log(Level.SEVERE, null, ex);
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
        String blogIdStr = request.getParameter("blogId");
        if (blogIdStr != null) {
            try {
                int blogId = Integer.parseInt(blogIdStr);
                BlogDAO dao = new BlogDAO();
                dao.updateBlogStatus(blogId);
                response.sendRedirect("blogmanager");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid blog ID");
            } catch (SQLException ex) {
                Logger.getLogger(BlogManager.class.getName()).log(Level.SEVERE, null, ex);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật trạng thái bài viết");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing blog ID");
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
