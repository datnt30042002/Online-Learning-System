/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.Version;
import com.restfb.types.User;
import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import dto.UserRole;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import utils.Constants;
import utils.MD5;

/**
 *
 * @author ADMIN
 */
public class LoginWithFacebook extends HttpServlet {

    public static UserDAO uDAO = new UserDAO();
    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet LoginWithFacebook</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginWithFacebook at " + request.getContextPath() + "</h1>");
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
        // // Use Libs: restfb-2.3.0
        try {
            // Lấy authorization code từ Facebook sau khi người dùng đăng nhập thành công FB
            String code = request.getParameter("code");
            String appId = Constants.FACEBOOK_APP_ID;
            String appSecret = Constants.FACEBOOK_APP_SECRET;
            String redirectUri = Constants.FACEBOOK_REDIRECT_URL;
            if (code == null || code.isEmpty()) {
                // Nếu không có authorization code hoặc authorization code trống, chuyển hướng người dùng đến trang Facebook Login
                String facebookLoginUrl = "https://www.facebook.com/v17.0/dialog/oauth"
                        + "?client_id=" + appId
                        + "&redirect_uri=" + redirectUri
                        + "&scope=email";

                response.sendRedirect(facebookLoginUrl);
            } else {
                // Lấy AccessToken từ Facebook bằng authorization code
                // Yêu cầu API tới Facebook với phiên bản API mới nhất 
                FacebookClient client = new DefaultFacebookClient(Version.LATEST);
                // Lấy AccessToken từ Facebook để gửi các yêu cầu API khác 
                FacebookClient.AccessToken accessToken = client.obtainUserAccessToken(appId, appSecret, redirectUri, code);
                // Kiểm tra xem AccessToken đã được lấy thành công hay chưa
                if (accessToken != null) {
                    // Lấy thông tin người dùng từ Facebook bằng AccessToken
                    FacebookClient userClient = new DefaultFacebookClient(accessToken.getAccessToken(), Version.LATEST);
                    User userEmail = userClient.fetchObject("me", User.class, Parameter.with("fields", "email"));
                    User userId = userClient.fetchObject("me", User.class, Parameter.with("fields", "id"));
                    User userName = userClient.fetchObject("me", User.class, Parameter.with("fields", "name"));
                    // Trích xuất thông tin của người dùng từ kết quả lấy được
                    String email = userEmail.getEmail();
                    String id = userId.getId();
                    String name = userName.getName();

                    // Kiểm tra xem người dùng đã tồn tại trong cơ sở dữ liệu hay chưa
                    if (uDAO.getUserByEmail(email) != null) {
                        // Nếu người dùng đã tồn tại trong cơ sở dữ liệu, lưu thông tin người dùng vào session
                        request.getSession().setAttribute("customer", uDAO.getUserByEmail(email));
                        request.getSession().setAttribute("user_id", uDAO.getUserByEmail(email).getUserID());
                        dto.User uFB = uDAO.getUserByEmail(email);
                        if (uFB.getFacebookID() == null) {
                            // Nếu chưa lưu Facebook ID cho người dùng, cập nhật thông tin người dùng với Facebook ID
                            dto.User userUpdate = new dto.User(uFB.getUserID(), email, email,
                                    "", "", "", "", "", Date.valueOf(LocalDate.now()), "", "",
                                    id, "", 1, 2, "", "", "", new UserRole(2, ""));
                            new UserDAO().UpdateUserAfterLoginFB(userUpdate);
                        }
                    } else {
                        // Nếu người dùng chưa tồn tại trong cơ sở dữ liệu, tạo tài khoản mới và lưu thông tin người dùng vào session
                        String defaultPass = "";
                        String defaultImg = "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";
                        dto.User user = new dto.User(0, email, email, null,
                                new MD5().getMD5Password(defaultPass), null, name, defaultImg,
                                Date.valueOf(LocalDate.now()), null, null, id, null, 1, 2, null, null, null, new UserRole(2, ""));
                        uDAO.insertSocialUser(user);
                        user = uDAO.getUserByEmail(email);
                        request.getSession().setAttribute("customer", user);
                        request.getSession().setAttribute("user_id", user.getUserID());
                    }
                } else {

                }
                // Chuyển hướng đến trang chủ
                response.sendRedirect("home");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginWithFacebook.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginWithFacebook.class.getName()).log(Level.SEVERE, null, ex);
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
