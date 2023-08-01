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
import dto.User;
import utils.MD5;
import utils.Mailer;

/**
 *
 * @author ADMIN
 */
public class Register extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        if (request.getSession().getAttribute("admin") != null || request.getSession().getAttribute("customer") != null
                || request.getSession().getAttribute("sales") != null || request.getSession().getAttribute("expert") != null
                || request.getSession().getAttribute("marketing") != null) {

            response.sendRedirect("home");
        } else {
            request.getRequestDispatcher("/view/user/login_register/register.jsp").forward(request, response);
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
        // Get bien tu front-end (register.jsp) day ve 
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            // Call UserDAO 
            UserDAO ud = new UserDAO();
            // Check Email khong nhap
            if (email.equals("")) {
                request.setAttribute("msgEmail", "Yêu cầu nhập email");
            } else {
                // Check Email existed
                if (ud.checkUser(email) != null) {
                    request.setAttribute("msgEmail", "Email này đã được đăng ký");
                    email = "";
                }
            }
            // Check Password khong nhap
            if (password.equals("")) {
                request.setAttribute("msgPass", "Yêu cầu nhập mật khẩu");
            } else {
                // Check Password length 
                if (password.contains(" ") || password.length() < 6) {
                    request.setAttribute("msgPass", "Yêu cầu mật khẩu lớn hơn 6 và không chứa khoảng trắng");
                    password = "";
                }
            }
            // Check Fullname khong nhap
            if (fullname.equals("")) {
                request.setAttribute("msgName", "Yêu cầu nhập họ và tên");
            }
            // Message loi existed => register.jsp in ra msg loi 
            if (email.equals("") || password.equals("") || fullname.equals("")) {
                request.getRequestDispatcher("/view/user/login_register/register.jsp").forward(request, response);
            } else {
                if (ud.checkUser(email) != null) {
                    request.setAttribute("msgHave", "Email này đã được đăng ký");
                    request.getRequestDispatcher("/view/user/login_register/register.jsp").forward(request, response);
                } else {
                    try {
                        // Thuc hien insert user vao DB 
                        String defaultImg = "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";
                        ud.insertUser(email, new MD5().getMD5Password(password), fullname, defaultImg);
                        // Get user => update code random for user => send mail verify
                        User u = ud.getUserByEmail(email);
                        String code = String.valueOf(new Random().nextInt(10000));
                        boolean check = Mailer.send(email, "Yêu cầu xác thực tài khoản F8", "Mã xác thực là: " + code);
                        // Check gửi mail thành công hay chưa
                        if (check == true) {
                            // Nêu gửi mail thành công
                            // Cập nhật mã xác thực trong cơ sở dữ liệu
                            ud.updateCode(u.getUserID(), code);
                            request.setAttribute("msgSuccess", "Bạn đã đăng ký thành công! Hãy kiểm tra email, lấy mã xác thực để kích hoạt tài khoản.");
                        } else {
                            // Nêu gửi mail không thành công 
                            request.setAttribute("msgSendFail", "Hãy kiểm tra lại kết nối mạng của bạn hoặc các vấn đề khác.");
                            request.setAttribute("msgSuccessSendFail", "Bạn đã đăng ký thành công! Hãy kiểm tra email, lấy mã xác thực để kích hoạt tài khoản.");
                        }

                    } catch (NoSuchAlgorithmException ex) {
                        Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("email", email);
                    //response.sendRedirect("verify?email=" + email + "&action=verify_register");
                    request.getRequestDispatcher("/view/user/login_register/register.jsp").forward(request, response);
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
