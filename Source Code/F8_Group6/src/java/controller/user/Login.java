/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import dto.User;
import utils.MD5;
import utils.Mailer;

/**
 *
 * @author ADMIN
 */
public class Login extends HttpServlet {

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
            out.println("<title>Servlet UserLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserLogin at " + request.getContextPath() + "</h1>");
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
        // Log out -> home
        if (request.getSession().getAttribute("admin") != null || request.getSession().getAttribute("customer") != null
                || request.getSession().getAttribute("sales") != null || request.getSession().getAttribute("expert") != null
                || request.getSession().getAttribute("marketing") != null) {
            request.getSession().removeAttribute("admin");
            request.getSession().removeAttribute("customer");
            request.getSession().removeAttribute("sales");
            request.getSession().removeAttribute("expert");
            request.getSession().removeAttribute("marketing");
            request.getSession().removeAttribute("User");
            request.getSession().removeAttribute("user_id");
            response.sendRedirect("home");
        } else {
            // Log in
            request.getRequestDispatcher("/view/user/login_register/login.jsp").forward(request, response);
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
        // Get bien tu front-end (login.jsp) day ve 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String defau_pass = ""; // Mật khẩu mặc định
        try {
            request.setAttribute("email", email);
            try {
                defau_pass = new MD5().getMD5Password(""); // Lấy giá trị băm MD5 của mật khẩu mặc định
                password = new MD5().getMD5Password(password); // Lấy giá trị băm MD5 của mật khẩu nhập vào
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
            // Kiểm tra nếu email hoặc mật khẩu là mật khẩu mặc định - ""
            if (email.equals(defau_pass)) {
                request.setAttribute("msgEmail", "Yêu cầu nhập email");
            }
            if (password.equals(defau_pass)) {
                request.setAttribute("msgPass", "Yêu cầu nhập mật khẩu");
            }
            // Kiểm tra nếu email hoặc mật khẩu là mật khẩu mặc định, chuyển hướng đến trang đăng nhập in ra message
            if (password.equals(defau_pass) || email.equals(defau_pass)) {
                request.getRequestDispatcher("/view/user/login_register/login.jsp").forward(request, response);
            } else {
                // Call UserDAO
                UserDAO ud = new UserDAO();
                User user = ud.getUser(email, password);
                // Kiểm tra nếu người dùng tồn tại
                if (user != null) {
                    if (user.getStatus() == 0) {
                        // Xử lý khi tài khoản chưa xác thực
                        User u = new UserDAO().getUserByEmail(email);
                        String code = String.valueOf(new Random().nextInt(10000));
                        // Gửi email xác thực tài khoản
                        boolean check = Mailer.send(email, "Yêu cầu xác thực tài khoản F8", "Mã xác thực là: " + code);
                        // Check gửi mail thành công hay chưa
                        if (check == true) {
                            // Nêu gửi mail thành công
                            // Cập nhật mã xác thực trong cơ sở dữ liệu
                            new UserDAO().updateCode(u.getUserID(), code);
                            //response.sendRedirect("verify?email=" + email + "&action=verify_login");
                            request.setAttribute("messageNonVerify", "Tài khoản của bạn chưa được kích hoạt! Hãy xác thực email để kích hoạt trước khi đăng nhập.");
                        } else {
                            // Nêu gửi mail không thành công 
                            request.setAttribute("messageNonVerifyFail", "Tài khoản của bạn chưa được kích hoạt! Hãy xác thực email để kích hoạt trước khi đăng nhập.");
                            request.setAttribute("messageSendFail", "Hãy kiểm tra lại kết nối mạng của bạn hoặc các vấn đề khác.");
                        }
                        request.getRequestDispatcher("/view/user/login_register/login.jsp").forward(request, response);
                    } else {
                        // Xử lý khi tài khoản đã xác thực
                        // Lưu thông tin người dùng vào session theo vai trò
                        switch (user.getUserRole_RoleID()) {
                            case 1:
                                request.getSession().setAttribute("admin", user);
                                break;
                            case 2:
                                request.getSession().setAttribute("customer", user);
                                break;
                            case 3:
                                request.getSession().setAttribute("sales", user);
                                break;
                            case 4:
                                request.getSession().setAttribute("expert", user);
                                break;
                            case 5:
                                request.getSession().setAttribute("marketing", user);
                                break;
                            default: {
                            }
                        }
                        request.getSession().setAttribute("user_id", user.getUserID());
                        // Chuyển hướng đến trang chủ
                        response.sendRedirect("home");
                    }

                } else {
                    // Xử lý khi email hoặc mật khẩu không chính xác
                    request.setAttribute("message", "Email hoặc mật khẩu không chính xác !");
                    request.getRequestDispatcher("/view/user/login_register/login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
