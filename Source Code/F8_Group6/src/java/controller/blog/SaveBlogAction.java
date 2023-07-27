/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dao.BlogDAO;
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
public class SaveBlogAction extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SaveBlogAction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveBlogAction at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            // Get user from session
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
                String toast = "";
                String action = request.getParameter("action");
                int id = Integer.parseInt(request.getParameter("id"));
                String index = request.getParameter("index");
                String topic = request.getParameter("topic");
                String tag = request.getParameter("tag");
                String page = request.getParameter("page");

                if (action.equals("save")) {
                    toast = "Them vao muc da luu";
                    new BlogDAO().insertSaveBlog(u.getUserID(), id);  // Add SaveBlog
                } else {
                    toast = "Xoa khoi muc da luu";
                    new BlogDAO().deleteSaveBlog(id, u.getUserID());  // Remove SaveBlog
                }

                if (page.equals("blogview")) {
                    //  BlogView
                    response.sendRedirect("blogview?id=" + id + "&toast=" + toast);
                } else if (page.equals("bloglist")) { 
                    //  BlogList
                    response.sendRedirect("bloglist?index=" + index + "&tag=" + tag + "&topic=" + topic + "&toast=" + toast);
                } else { 
                    //  SaveBlog
                    response.sendRedirect("save-blog-list?index=" + index + "&toast=" + toast); 
                }
                
            } else {
                request.getRequestDispatcher("/view/user/login_register/login.jsp").forward(request, response);
            }
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
