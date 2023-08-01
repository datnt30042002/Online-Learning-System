/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.UserDAO;
import dto.User;
import jakarta.servlet.ServletException;
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
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class UserDetail extends HttpServlet {

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
            out.println("<title>Servlet UserDetail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetail at " + request.getContextPath() + "</h1>");
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
            String UserID = request.getParameter("UserID");
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserbyUserID(UserID);

            List<dto.UserRole> listUserRole = userDAO.getAllUserRole();

            request.setAttribute("listUserRole", listUserRole);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/admin/userDetail.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserDetail.class.getName()).log(Level.SEVERE, null, ex);
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
            String userID = request.getParameter("UserID");
            //String image = request.getParameter("Image");
            String fullName = request.getParameter("FullName");
            String email = request.getParameter("Email");
            String phoneNumber = request.getParameter("PhoneNumber");
            String userRole = request.getParameter("UserRole");
            String status = request.getParameter("Status");
            
            // Upload Avatar
            Part AvatarPart = request.getPart("Image");
            String originalAvatarFileName = AvatarPart.getSubmittedFileName();// Lấy tên gốc của tệp video
            String fileAvatarName = Paths.get(AvatarPart.getSubmittedFileName()).getFileName().toString();// Tạo tên tệp duy nhất để lưu trữ trên máy chủ
            String uploadAvatarPath = getServletContext().getRealPath("/") + "assets/images/userProfile/";// Đường dẫn tới thư mục lưu trữ video trên máy chủ
            File uploadDir = new File(uploadAvatarPath);// Kiểm tra nếu thư mục lưu trữ không tồn tại, thì tạo mới
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String fileAvatarPath = uploadAvatarPath + File.separator + fileAvatarName;// Tạo đường dẫn lưu trữ trên máy chủ
            AvatarPart.write(fileAvatarPath);// Lưu tệp video vào thư mục trên máy chủ
            String Avatar = "assets/images/userProfile/" + fileAvatarName;
            
            
            UserDAO userDAO = new UserDAO();
            userDAO.UpdateUserDetail(email, phoneNumber, fullName, Avatar, status, userRole, userID);
            request.setAttribute("messSuccess", "Update Profile success");
            response.sendRedirect("userDetail?UserID=" + userID + "&messSuccess=Update+Profile+success");
        } catch (SQLException ex) {
            Logger.getLogger(UserDetail.class.getName()).log(Level.SEVERE, null, ex);
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
