/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import dto.User;
import dto.UserRole;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

/**
 *
 * @author admin
 */
public class UpdateProfile extends HttpServlet {

    private UserDAO userDao = new UserDAO();

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
            out.println("<title>Servlet UpdateProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfile at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        try {
            String UserID = request.getParameter("UserID");
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserbyUserID(UserID);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/user/profile/updatePro.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
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
            //processRequest(request, response);
            String FullName = request.getParameter("Name");
            //String Image = request.getParameter("Image");
            String Bio = request.getParameter("Bio");
            //String BackGroundImage = request.getParameter("BackGroundImage");
            String UserID = request.getParameter("UserID");

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

            // Upload BackgroundImage
            Part backgroundPart = request.getPart("BackgroundImage");
            String originalBackgroundFileName = backgroundPart.getSubmittedFileName();
            String fileBackgroundName = Paths.get(originalBackgroundFileName).getFileName().toString();
            String uploadBackgroundPath = getServletContext().getRealPath("/") + "assets/images/userProfile/";
            File uploadBackgroundDir = new File(uploadBackgroundPath);
            if (!uploadBackgroundDir.exists()) {
                uploadBackgroundDir.mkdir();
            }
            String fileBackgroundPath = uploadBackgroundPath + File.separator + fileBackgroundName;
            backgroundPart.write(fileBackgroundPath);
            String backgroundImage = "assets/images/userProfile/" + fileBackgroundName;

            UserDAO userDAO = new UserDAO();
            userDAO.UpdateLogin(FullName, Avatar, Bio, backgroundImage, UserID);
            User u = userDao.getUserbyUserID(UserID);
            switch (u.getUserRole_RoleID()) {
                case 1:
                    request.getSession().setAttribute("admin", u);
                    break;
                case 2:
                    request.getSession().setAttribute("customer", u);
                    break;
                case 3:
                    request.getSession().setAttribute("sales", u);
                    break;
                case 4:
                    request.getSession().setAttribute("expert", u);
                    break;
                case 5:
                    request.getSession().setAttribute("marketing", u);
                    break;
                default: {
                }
            }
            request.setAttribute("messSuccess", "Update Profile success");
            response.sendRedirect("updateProfile?UserID=" + UserID + "&messSuccess=Update+Profile+success");
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /*
    (String Email, String Facebook, String Github, String Password, String Phone, String FullName,
String Image, String Dob, String Address, String GmailID, String FacebookID, String GithubID, String Status, String UserRole_RoleID, String CodeVerify, String UserID)
     */
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
