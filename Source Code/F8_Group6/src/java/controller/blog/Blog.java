/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dao.BlogDAO;
import dto.BlogTag;
import dto.BlogTopic;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import dto.User;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class Blog extends HttpServlet {

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
            throws ServletException, IOException, SQLException {

        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            BlogDAO dao = new BlogDAO();
            ArrayList<dto.Blog> blogA = dao.getAllBlogg();
            List<BlogTag> blogT = dao.getListBlogTag();
            List<BlogTopic> blogTp = dao.getListBlogTopic();

            request.setAttribute("bList", blogA);
            request.setAttribute("tList", blogT);
            request.setAttribute("tpList", blogTp);
            request.getRequestDispatcher("view/user/blog/newblog.jsp").forward(request, response);
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, ex);
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
        String uploadFolder = request.getServletContext().getRealPath("assets/images/blog");
        Path uploadPath = Paths.get(uploadFolder);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath); // nếu thư mục upload không tồn tại, tạo mới
        }

        Part imagePart = request.getPart("image"); // lấy phần tử 'image' từ yêu cầu
        String imageFilename = ""; // tên tệp tin ảnh
        if (imagePart != null && imagePart.getSize() > 0) {
            imageFilename = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString(); // lấy tên tệp tin mới
            imagePart.write(Paths.get(uploadPath.toString(), imageFilename).toString()); // lưu tệp tin vào thư mục upload
        }
        String action = request.getParameter("action");
        if (action != null && !action.isEmpty()) {
            String title = request.getParameter("title");
            String date = request.getParameter("date");
            String time = "2"; 
            String detail = request.getParameter("texttitle");
            String status = "";
            String tag = request.getParameter("tag");
            String topic = request.getParameter("topic");
            if (action.equals("save")) {
                status = "0";
            } else if (action.equals("publish")) {
                status = "1";
            }
            HttpSession session = request.getSession();
            User a = (User) session.getAttribute("expert");
            int uid = a.getUserID();

            BlogDAO dao = new BlogDAO();
            dao.insertBlog(title, imageFilename, date, time, detail, uid, status, topic, tag);
        }
        

        // Sau khi xử lý, chuyển hướng về trang JSP "newblog.jsp" để hiển thị lại dữ liệu
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần thiết
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
