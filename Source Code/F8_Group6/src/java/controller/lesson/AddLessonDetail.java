/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lesson;

import dao.LessonDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.UUID;

/**
 *
 * @author admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
                 maxFileSize = 1024 * 1024 * 500,    // 500MB
                 maxRequestSize = 1024 * 1024 * 500) // 500MB
public class AddLessonDetail extends HttpServlet {

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
            out.println("<title>Servlet AddLessonDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddLessonDetail at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("view/user/lesson/addLessonDetail.jsp").forward(request, response);
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
            String lessonDetailID = request.getParameter("LessonDetailID");
            String title = request.getParameter("Title");
            String note = request.getParameter("Note");
            String time = request.getParameter("Time");
            String lessonLessonID = request.getParameter("Lesson_LessonID");
            String dicussDicussID = request.getParameter("Dicuss_DicussID");

            Part videoPart = request.getPart("Video");
            // Lấy tên gốc của tệp video
            String originalFileName = videoPart.getSubmittedFileName();
            // Tạo tên tệp duy nhất để lưu trữ trên máy chủ
            String fileName = Paths.get(videoPart.getSubmittedFileName()).getFileName().toString();
            // Đường dẫn tới thư mục lưu trữ video trên máy chủ
            // Cấu hình multipart
            String uploadPath = getServletContext().getRealPath("/") + "assets/video/";
            // Kiểm tra nếu thư mục lưu trữ không tồn tại, thì tạo mới
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            // Tạo đường dẫn lưu trữ trên máy chủ
            String filePath = uploadPath + File.separator + fileName;
            // Lưu tệp video vào thư mục trên máy chủ
            videoPart.write(filePath);
            String vid = "assets/video/" + fileName;

            // Lưu thông tin video vào cơ sở dữ liệu
            LessonDAO dao = new LessonDAO();
            dao.addLessonDetail(lessonDetailID, title, vid, note, time, lessonLessonID, dicussDicussID);

            // Chuyển hướng về trang thành công
            request.setAttribute("messSuccess", "Add new Lesson Detail success");
            request.getRequestDispatcher("view/user/lesson/addLessonDetail.jsp").forward(request, response);
        } catch (Exception ex) {
            // Xử lý lỗi và chuyển hướng về trang lỗi
            request.setAttribute("mess", "Error: " + ex.getMessage());
            request.getRequestDispatcher("view/user/lesson/addLessonDetail.jsp").forward(request, response);
        }
    }

    // Phương thức hỗ trợ để lấy phần mở rộng của tên tệp
    private String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        return fileName.substring(dotIndex);
    }

}
