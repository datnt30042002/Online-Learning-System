/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.course;

import dao.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trank
 */
public class UpdateProgramTraining extends HttpServlet {

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
            out.println("<title>Servlet UpdateProgramTraining</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProgramTraining at " + request.getContextPath() + "</h1>");
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
            int CateID = 0 ;
            CourseDAO dao = new CourseDAO();
            try {
                CateID = Integer.parseInt(request.getParameter("CateID"));
            } catch (NumberFormatException e){
            }
            dao.getCateByID(CateID);
            request.setAttribute("CateID", CateID);
            request.getRequestDispatcher("view/user/course/updateProgram.jsp").forward(request, response);
        } catch (SQLException ex){
            Logger.getLogger(UpdateProgramTraining.class.getName()).log(Level.SEVERE, null, ex);
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
         String uploadFolder = request.getServletContext().getRealPath("assets/images/course");
        Path uploadPath = Paths.get(uploadFolder);
        if (!Files.exists(uploadPath)) {
            Files.createDirectory(uploadPath); // neu chua ton tai foder postimg thi tao
        }
        Part imagePart = request.getPart("Image"); // tra ve doi tuong file 'image'
        String imageFilename = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString(); // lay ra ten cua file moi chon
        if (!imageFilename.isEmpty()) {
            imagePart.write(Paths.get(uploadPath.toString(), imageFilename).toString()); //save to foder 
        }
        CourseDAO dao = new CourseDAO();
        String Name = request.getParameter("Name");
        String Description = request.getParameter("Description");
        String ID = request.getParameter("CateID");
     
        try {           
            dao.updateCategory(ID, Name, imageFilename, Description);
        } catch (SQLException ex) {
            Logger.getLogger(AddProgramTraining.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("view/user/course/addProgram.jsp").forward(request, response);
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
