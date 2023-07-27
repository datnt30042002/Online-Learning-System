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
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SaveBlogList extends HttpServlet {

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
            out.println("<title>Servlet SaveBlogList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveBlogList at " + request.getContextPath() + "</h1>");
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
                List<dto.Blog> list = new BlogDAO().getListSaveBlog(u.getUserID());
                int index = 1;
                if (request.getParameter("index") != null && !request.getParameter("index").trim().equalsIgnoreCase("")) {
                    index = Integer.parseInt(request.getParameter("index"));
                }
                // Xu ly phan trang
                int totalPage = list.size() % 5 == 0 ? (list.size() / 5) : ((list.size() / 5) + 1);
                
                if (index > totalPage) {
                    index--;
                }
                
                if (list.size() > 0) {
                    if (index == totalPage) {
                        list = list.subList((index - 1) * 5, list.size());
                    } else {
                        list = list.subList((index - 1) * 5, index * 5);
                    }
                }
                if (request.getParameter("toast") != null) {
                    request.setAttribute("toastMessage", request.getParameter("toast"));
                }
                request.setAttribute("tags", new BlogDAO().getListBlogTag());
                request.setAttribute("topics", new BlogDAO().getListBlogTopic());
                request.setAttribute("news", new BlogDAO().getNewListBlog());
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("index", index);
                request.setAttribute("list_save", new BlogDAO().getIDListSaveBlog(u.getUserID()));
                request.setAttribute("list", list);
                request.getRequestDispatcher("view/user/blog/saveblog.jsp").forward(request, response);
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
