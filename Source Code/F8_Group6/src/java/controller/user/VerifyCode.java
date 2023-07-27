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
import dto.User;

/**
 *
 * @author ADMIN
 */
public class VerifyCode extends HttpServlet {

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
            out.println("<title>Servlet VerifyCode</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyCode at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        request.setAttribute("email", email);
        String action = request.getParameter("action");
        request.setAttribute("action", action);
        request.getRequestDispatcher("/view/user/login_register/verify_by_email.jsp").forward(request, response);
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
        String code = request.getParameter("code");
        String action = request.getParameter("action");
        try {
            User u = new UserDAO().getUserByEmail(email);
            String getCode = new UserDAO().getCode(u.getUserID());
            request.setAttribute("action", action);
            request.setAttribute("email", email);
            if (action.equals("verify_forgot")) {
                // Xác thực cho trường hợp quên mật khẩu
                if (getCode.equalsIgnoreCase(code)) {
                    // Nếu code khớp, chuyển hướng đến trang đặt lại mật khẩu
                    request.setAttribute("messageSuccessForgot", "Mã xác thực hợp lệ !");
                    request.getRequestDispatcher("/view/user/login_register/verify_by_email.jsp").forward(request, response);
                    //response.sendRedirect("reset-pass?email=" + email);
                } else {
                    // Nếu code không khớp, hiển thị thông báo lỗi và chuyển hướng lại trang xác thực email
                    request.setAttribute("message", "Mã xác thực không hợp lệ! Vui lòng kiểm tra lại.");
                    request.getRequestDispatcher("/view/user/login_register/verify_by_email.jsp").forward(request, response);
                }
            } else if (action.equals("verify_register")) {
                // Xác thực cho trường hợp đăng ký tài khoản
                if (getCode.equalsIgnoreCase(code)) {
                    // Nếu code khớp, xử lý lưu thông tin người dùng vào session theo vai trò và chuyển hướng đến trang chủ
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
                    // Cập nhật trạng thái thành tài khoàn kích hoạt sau khi xác thuc
                    new UserDAO().UpdateUserStatus(u.getUserID(), "1");
                    request.setAttribute("messageSuccessRegister", "Chúc mừng! Bạn đã kích hoạt tài khoản thành công.");
                    request.getRequestDispatcher("/view/user/login_register/verify_by_email.jsp").forward(request, response);
                } else {
                    // Nếu code không khớp, hiển thị thông báo lỗi và chuyển hướng lại trang xác thực email
                    request.setAttribute("message", "Mã xác thực không hợp lệ! Vui lòng kiểm tra lại.");
                    request.getRequestDispatcher("/view/user/login_register/verify_by_email.jsp").forward(request, response);
                }
            } else {
                // Xác thực cho trường hợp đăng nhập tài khoản
                if (getCode.equalsIgnoreCase(code)) {
                    // Nếu code khớp, xử lý lưu thông tin người dùng vào session theo vai trò và chuyển hướng đến trang chủ
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
                    // Cập nhật trạng thái thành tài khoàn kích hoạt sau khi xác thuc
                    new UserDAO().UpdateUserStatus(u.getUserID(), "1");
                    request.setAttribute("messageSuccessLogin", "Chúc mừng! Bạn đã kích hoạt tài khoản thành công.");
                    request.getRequestDispatcher("/view/user/login_register/verify_by_email.jsp").forward(request, response);
                } else {
                    // Nếu code không khớp, hiển thị thông báo lỗi và chuyển hướng lại trang xác thực email
                    request.setAttribute("message", "Mã xác thực không hợp lệ! Vui lòng kiểm tra lại.");
                    request.getRequestDispatcher("/view/user/login_register/verify_by_email.jsp").forward(request, response);
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
