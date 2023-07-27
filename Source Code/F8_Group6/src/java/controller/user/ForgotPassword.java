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
import java.util.Random;
import dto.User;
import utils.Mailer;

/**
 *
 * @author ADMIN
 */
public class ForgotPassword extends HttpServlet {

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
            out.println("<title>Servlet ForgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/view/user/login_register/forgotpass.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        try {
            request.setAttribute("email", email);
            // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không
            User u = new UserDAO().getUserByEmail(email);
            if (u == null) {
                // Nếu email không tồn tại, hiển thị thông báo lỗi và chuyển hướng lại trang quên mật khẩu
                request.setAttribute("error", "Email của bạn không tồn tại trong hệ thống !");
                request.getRequestDispatcher("/view/user/login_register/forgotpass.jsp").forward(request, response);
            } else {
                // Nếu email tồn tại, gửi email khôi phục mật khẩu 
                boolean check = Mailer.send(email, "Yêu cầu khôi phục mật khẩu F8", "Hãy truy cập đường dẫn sau để thay đổi mật khẩu mới: " + "http://localhost:9999/F8_Group6/reset-pass?email=" + email);
                if (check == true) {
                    request.setAttribute("message", "Liên kết đặt lại mật khẩu đã được gửi đến địa chỉ email : " + email);
                } else {
                    request.setAttribute("messageError", "Hãy kiểm tra lại kết nối mạng của bạn hoặc các vấn đề khác.");
                }
                request.getRequestDispatcher("/view/user/login_register/forgotpass.jsp").forward(request, response);
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
