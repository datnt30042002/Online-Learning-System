/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.BlogDAO;
import dao.CourseDAO;
import dto.Blog;
import dto.Course;
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
public class SearchBlogAndCourse extends HttpServlet {

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
            out.println("<title>Servlet SearchBlogAndCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchBlogAndCourse at " + request.getContextPath() + "</h1>");
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
        // Lấy giá trị tham số "search" từ request để tìm kiếm trong cơ sở dữ liệu
        String search = request.getParameter("search");
        try {
            // Khởi tạo đối tượng Gson để chuyển đổi dữ liệu thành định dạng JSON
            Gson gson = new Gson();
            // Tìm các (blogs) có chứa từ khóa tìm kiếm trong cơ sở dữ liệu
            List<Blog> blogs = new BlogDAO().getBlogBySearch(search);
            // Tìm các (courses) có chứa từ khóa tìm kiếm trong cơ sở dữ liệu
            List<Course> courses = new CourseDAO().getCourseBySearch(search);
            // Khởi tạo đối tượng JsonArray để lưu trữ danh sách bài viết dưới dạng JSON
            JsonArray jsonBlogs = new JsonArray();       
            // Khởi tạo đối tượng JsonArray để lưu trữ danh sách khóa học dưới dạng JSON
            JsonArray jsonCourses = new JsonArray();
            // Khởi tạo đối tượng JsonObject để lưu trữ dữ liệu JSON chung của phản hồi
            JsonObject jsonData = new JsonObject();      
            
            // Duyệt qua danh sách bài viết và chuyển đổi thành dữ liệu JSON
            for (Blog b : blogs) {
                JsonObject jsonBlog = new JsonObject();
                jsonBlog.addProperty("id", b.getBlogID());
                jsonBlog.addProperty("title", b.getBlogTitle());
                jsonBlog.addProperty("image", b.getBlogImage());
                jsonBlogs.add(jsonBlog);
            }
            // Duyệt qua danh sách khóa học và chuyển đổi thành dữ liệu JSON
            for (Course c : courses) {
                JsonObject jsonCourse = new JsonObject();
                jsonCourse.addProperty("id", c.getCourseID());
                jsonCourse.addProperty("name", c.getName());
                jsonCourse.addProperty("image", c.getImage());
                jsonCourses.add(jsonCourse);
            }
            
            // Gắn danh sách bài viết và khóa học vào đối tượng jsonData
            jsonData.add("blogs", jsonBlogs);
            jsonData.add("courses", jsonCourses);
            // Cấu hình phản hồi với kiểu dữ liệu JSON và bộ mã hóa UTF-8
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            System.out.println(jsonData);
            // Ghi dữ liệu JSON vào response để trả về phía client
            response.getWriter().write(jsonData.toString());

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
