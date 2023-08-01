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

/**
 *
 * @author ADMIN
 */
public class LoginWithPhone extends HttpServlet {

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
            out.println("<title>Servlet LoginWithPhone</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginWithPhone at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/view/user/login_register/login_phone.jsp").forward(request, response);
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
        String phone = request.getParameter("phone");
        try {
            if (new UserDAO().getAllPhones().contains(phone)) {
                // Nếu số điện thoại tồn tại trong hệ thống
                request.setAttribute("success", "Success");

            } else if (phone.isEmpty()) {
                // Nếu số điện thoại trống
                request.setAttribute("failempty", "Vui lòng nhập số điện thoại.");
            } else if (!phone.matches("\\d{10}")) {
                // Nếu số điện thoại không đúng định dạng 10 chữ số
                request.setAttribute("failformat", "Số điện thoại không hợp lệ. Vui lòng kiểm tra và nhập lại.");
            } else {
                // Nếu số điện thoại không tồn tại trong hệ thống
                request.setAttribute("fail", "Số điện thoại không tồn tại trong hệ thống.");
            }
            request.setAttribute("phone", phone);
            // Chuyển hướng đến trang login_phone.jsp để hiển thị kết quả xác thực số điện thoại
            request.getRequestDispatcher("/view/user/login_register/login_phone.jsp").forward(request, response);
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
