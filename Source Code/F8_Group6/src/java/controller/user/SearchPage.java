/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.BlogDAO;
import dao.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SearchPage extends HttpServlet {

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
            out.println("<title>Servlet SearchPage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchPage at " + request.getContextPath() + "</h1>");
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
            String name = request.getParameter("name");
            String page = request.getParameter("page");
            int indexBlog = 1;
            if (request.getParameter("indexBlog") != null && !request.getParameter("indexBlog").equals("")) {
                indexBlog = Integer.parseInt(request.getParameter("indexBlog"));
            }
            int indexCourse = 1;
            if (request.getParameter("indexCourse") != null && !request.getParameter("indexCourse").equals("")) {
                indexCourse = Integer.parseInt(request.getParameter("indexCourse"));
            }
            int totalBlog = new BlogDAO().getBlogBySearch(name).size();
            int totalPageBlog = (totalBlog % 4 == 0) ? (totalBlog / 4) : ((totalBlog / 4) + 1);
            int totalCourse = new CourseDAO().getCourseBySearch(name).size();
            int totalPageCourse = (totalCourse % 4 == 0) ? (totalCourse / 4) : ((totalCourse / 4) + 1);
            if (indexBlog < totalPageBlog) {
                request.setAttribute("listBlog", new BlogDAO().getBlogBySearch(name).subList((indexBlog - 1) * 4, indexBlog * 4));
            } else if (indexBlog == totalPageBlog) {
                request.setAttribute("listBlog", new BlogDAO().getBlogBySearch(name).subList((indexBlog - 1) * 4, totalBlog));
            }

            if (indexCourse < totalPageCourse) {
                request.setAttribute("listCourse", new CourseDAO().getCourseBySearch(name).subList((indexCourse - 1) * 4, indexCourse * 4));
            } else if (indexCourse == totalPageCourse) {
                request.setAttribute("listCourse", new CourseDAO().getCourseBySearch(name).subList((indexCourse - 1) * 4, totalCourse));
            }
            request.setAttribute("tags", new BlogDAO().getListBlogTag());
            request.setAttribute("topics", new BlogDAO().getListBlogTopic());
            request.setAttribute("news", new BlogDAO().getNewListBlog());
            request.setAttribute("page", page);
            request.setAttribute("name", name);
            request.setAttribute("totalPageBlog", totalPageBlog);
            request.setAttribute("totalPageCourse", totalPageCourse);
            request.setAttribute("indexBlog", indexBlog);
            request.setAttribute("indexCourse", indexCourse);
            request.getRequestDispatcher("/view/common/searchpage.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
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
