/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dao.BlogDAO;
import dao.CommentDAO;
import dto.User;
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
public class BlogView extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            request.setAttribute("tags", new BlogDAO().getListBlogTag());
            request.setAttribute("topics", new BlogDAO().getListBlogTopic());
            request.setAttribute("news", new BlogDAO().getNewListBlog());
            request.setAttribute("blog", new BlogDAO().getListBlogByID(id));
            User u = null;
            if (request.getSession().getAttribute("customer") != null) {
                u = (User) request.getSession().getAttribute("customer");
            } else if (request.getSession().getAttribute("sales") != null) {
                u = (User) request.getSession().getAttribute("sales");
            } else if (request.getSession().getAttribute("expert") != null) {
                u = (User) request.getSession().getAttribute("expert");
            } else if (request.getSession().getAttribute("marketing") != null) {
                u = (User) request.getSession().getAttribute("marketing");
            } else if (request.getSession().getAttribute("admin") != null) {
                u = (User) request.getSession().getAttribute("admin");
            }
            if (u != null) {
                request.setAttribute("list_save", new BlogDAO().getIDListSaveBlog(u.getUserID()));
                request.setAttribute("list_like", new BlogDAO().getIDListLike(u.getUserID()));
            }
            if (request.getParameter("toast") != null) {
                request.setAttribute("toastMessage", request.getParameter("toast"));
            }
            request.getSession().setAttribute("list_comment", new CommentDAO().getAllCommentOfBlog(id));
            request.getSession().setAttribute("id_blog", id);
            request.setAttribute("total", new BlogDAO().getTotalLikeOfBlog(id));
            request.getRequestDispatcher("./view/user/blog/blogview.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
