/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import dto.GitHubDTO;
import dto.User;
import dto.UserRole;
import org.apache.http.client.ClientProtocolException;
import utils.Constants;
import utils.MD5;

/**
 *
 * @author ADMIN
 */
public class LoginWithGithub extends HttpServlet {

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
        // authorization code
        String code = request.getParameter("code");
        try {
            if (code == null || code.isEmpty()) {
                // Nếu mã truy cập (authorization code) không tồn tại hoặc rỗng, chuyển hướng đến trang đăng nhập
                request.getRequestDispatcher("login").forward(request, response);
            } else {
                // Lấy thông tin người dùng từ Github thông qua mã thông báo truy cập (access token) 
                GitHubDTO dto = getUserInfo(code); 
                if (new UserDAO().checkGitExist(dto) == null) {
                    // Nếu không tồn tại, tạo người dùng mới và đặt vào session
                    String defaultPass = "";
                    String defaultImg = "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";
                    try {
                        User user = new User(0, null, null, dto.getName(), new MD5().getMD5Password(defaultPass), 
                                null, dto.getName(), defaultImg, Date.valueOf(LocalDate.now()), null, null, null, 
                                dto.getId(), 1, 2, null, null, null, new UserRole(2, ""));
                        new UserDAO().insertSocialUser(user);
                        user = new UserDAO().getUserByGithub(dto.getName());
                        request.getSession().setAttribute("customer", user);
                        request.getSession().setAttribute("user_id", user.getUserID());
                    } catch (NoSuchAlgorithmException ex) {
                        Logger.getLogger(LoginWithGithub.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    // Nếu tồn tại, đặt người dùng vào session
                    request.getSession().setAttribute("customer", new UserDAO().getUserByGithub(dto.getName()));
                    request.getSession().setAttribute("user_id", new UserDAO().getUserByGithub(dto.getName()).getUserID());
                }
                response.sendRedirect("home");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy thông tin người dùng từ Github
    public GitHubDTO getUserInfo(String code) throws ClientProtocolException, IOException {
        // Gọi API để lấy mã truy cập   
        String tokenUrl = Constants.GIT_LINK_GET_TOKEN
                + "client_id=" + Constants.GIT_CLIENT_ID + "&client_secret=" + Constants.GIT_CLIENT_SECRET
                + "&code=" + code + "&redirect_uri=" + Constants.GIT_REDIRECT_URI;
        // Thiết lập các thuộc tính của kết nối method Post, kieu du liêu Json
        URL url = new URL(tokenUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Accept", "application/json");
        String name = "";
        String id = "";
        // Mã đọc dữ liệu từ kết nối thông qua method getInputStream() => dữ liệu đọc được từ API
        try ( InputStream in = conn.getInputStream();  InputStreamReader inputStreamReader = new InputStreamReader(in)) {
            // Chuyen ve duoi dang Object Json
            JsonParser parser = new JsonParser();
            JsonObject json = parser.parse(inputStreamReader).getAsJsonObject();  
            // Láy mã truy cập thông qua dữ liệu đọc được từ API
            String accessToken = json.get("access_token").getAsString();

            // Sử dụng mã truy cập để lấy thông tin người dùng
            String apiUrl = "https://api.github.com/user";
            // Tạo chuỗi Authorization header với giá trị là "Bearer" + accessToken
            String authorizationHeader = "Bearer " + accessToken;
            // Thiết lập kết nối đến URL apiUrl
            conn = (HttpURLConnection) new URL(apiUrl).openConnection();
            conn.setRequestMethod("GET");
            // Thiết lập tiêu đề Authorization trong yêu cầu HTTP với giá trị là authorizationHeader
            conn.setRequestProperty("Authorization", authorizationHeader);
            // Đọc dữ liệu từ kết nối và chuyển đổi thành đối tượng JsonObject
            try ( InputStream userIn = conn.getInputStream();  InputStreamReader userInputStreamReader = new InputStreamReader(userIn)) {
                JsonObject userJson = parser.parse(userInputStreamReader).getAsJsonObject();

                // Lấy thông tin người dùng từ userJson và xử lý
                id = userJson.get("id").getAsString();
                name = userJson.get("login").getAsString();

            }
        }
        return new GitHubDTO(id, name);
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
