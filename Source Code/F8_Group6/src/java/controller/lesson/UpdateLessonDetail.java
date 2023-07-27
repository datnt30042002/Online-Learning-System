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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
                 maxFileSize = 1024 * 1024 * 500,    // 500MB
                 maxRequestSize = 1024 * 1024 * 500) // 500MB
public class UpdateLessonDetail extends HttpServlet {

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
            out.println("<title>Servlet UpdateLessonDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateLessonDetail at " + request.getContextPath() + "</h1>");
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
            LessonDAO dao = new LessonDAO();
            
            String LessonDetailID = request.getParameter("LessonDetailID");
            dto.LessonDetail lessonDetail = dao.getLessonDetailByID(LessonDetailID);
            request.setAttribute("lessonDetail", lessonDetail);
            
            request.getRequestDispatcher("view/user/lesson/updateLessonDetail.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateLessonDetail.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            String LessonDetailID = request.getParameter("LessonDetailID");
            String Title = request.getParameter("Title");
            //String Video = request.getParameter("Video");
            String Time = request.getParameter("Time");
            String Note = request.getParameter("Note");
            String Lesson_LessonID = request.getParameter("Lesson_LessonID");
            String Dicuss_DicussID = request.getParameter("Dicuss_DicussID");
            
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
            
            LessonDAO dao = new LessonDAO();
            dao.updateLessonDetail(Title, vid, Note, Time, Lesson_LessonID, Dicuss_DicussID, LessonDetailID);
            request.setAttribute("messSuccess", "Update LessonDetail success");
            response.sendRedirect("updateLessonDetail?LessonDetailID=" + LessonDetailID + "&messSuccess=Update+LessonDetail+success");
        } catch (SQLException ex) {
            Logger.getLogger(UpdateLessonDetail.class.getName()).log(Level.SEVERE, null, ex);
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
