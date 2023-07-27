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
public class BlogList extends HttpServlet {

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
        try {
            List<dto.Blog> list = new BlogDAO().getListBlog();
            int index = 1;
            boolean searchByTag = false;
            boolean searchByTopic = false;

            if (request.getParameter("index") != null && !request.getParameter("index").trim().equalsIgnoreCase("")) {
                index = Integer.parseInt(request.getParameter("index"));
            }
            if (request.getParameter("tag") != null && !request.getParameter("tag").trim().equalsIgnoreCase("")) {
                // Tìm kiếm theo tag
                list = new BlogDAO().getListByTag(Integer.parseInt(request.getParameter("tag")));
                searchByTag = true;
            }
            if (request.getParameter("topic") != null && !request.getParameter("topic").trim().equalsIgnoreCase("")) {
                // Tìm kiếm theo topic
                if (searchByTag) {
                    // Nếu đã tìm kiếm theo tag, tìm kiếm cả tag và topic
                    list = new BlogDAO().getListByTagAndTopic(Integer.parseInt(request.getParameter("topic")), Integer.parseInt(request.getParameter("tag")));
                } else {
                    // Nếu chưa tìm kiếm theo tag, chỉ tìm kiếm theo topic
                    list = new BlogDAO().getListByTopic(Integer.parseInt(request.getParameter("topic")));
                }
                searchByTopic = true;
            }

            // Xu ly phan trang
            int totalPage = list.size() % 5 == 0 ? (list.size() / 5) : ((list.size() / 5) + 1);
            if (list.size() > 0) {
                if (index == totalPage) {
                    list = list.subList((index - 1) * 5, list.size());
                } else {
                    list = list.subList((index - 1) * 5, index * 5);
                }
            }

            // Check user 
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
            }
            if(request.getParameter("toast") != null){
                request.setAttribute("toastMessage", request.getParameter("toast"));
            }
            request.setAttribute("tags", new BlogDAO().getListBlogTag());
            request.setAttribute("topics", new BlogDAO().getListBlogTopic());
            request.setAttribute("news", new BlogDAO().getNewListBlog());
            request.setAttribute("list", list);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("index", index);
            request.setAttribute("tag", request.getParameter("tag"));
            request.setAttribute("topic", request.getParameter("topic"));
            request.getRequestDispatcher("view/user/blog/bloglist.jsp").forward(request, response);
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
