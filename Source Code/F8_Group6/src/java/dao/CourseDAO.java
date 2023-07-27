/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Category;
import dto.Course;
import dto.CourseEnroll;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import utils.DBContext;

/**
 *
 * @author admin
 */
public class CourseDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Course> getAllCourse() throws SQLException {
        List<Course> list = new ArrayList<>();
        String sql = "select * from f8db.course";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println("Loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;
    }

    public List<Course> getAllCourseByCategoryID(String CategoryID) throws SQLException {
        List<Course> list = new ArrayList<>();
        String sql = "select * from f8db.course where course.Category_CategoryID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, CategoryID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;
    }

    public Course checkExistSID(String id) throws SQLException {
        String sql = "select * from f8db.course where CourseID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
            System.out.println("loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return null;
    }

    public Course addCourse(String id, String name, String image, String info, String des, String status, String uid, String cid, String fee) throws SQLException {
        String sql = "insert into f8db.course(CourseID, Name, Image, CourseInfo, Description, Status, User_UserID, Category_CategoryID, FeeStatus)\n"
                + "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, image);
            ps.setString(4, info);
            ps.setString(5, des);
            ps.setString(6, status);
            ps.setString(7, uid);
            ps.setString(8, cid);
            ps.setString(9, fee);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return null;
    }

    public void deleteCourse(String id) throws SQLException {
        String sql = "delete from f8db.course where CourseID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    public Course getCourseByID(String id) throws SQLException {
        String sql = "select * from f8db.course where CourseID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
            System.out.println("loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }

        return null;
    }

    public Course getCourseByIDVideoIntro(String id) throws SQLException {
        String sql = "select * from f8db.course where CourseID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10));
            }
        } catch (Exception e) {
            System.out.println("loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }

        return null;
    }

    // update 
    public void updateCourse(String name, String image, String info, String des, String status, String uid, String cid, String id, String fee) throws SQLException {
        String sql = "update f8db.course set Name = ?,\n"
                + "               Image = ?,\n"
                + "               CourseInfo = ?,\n"
                + "                Description = ?,\n"
                + "               Status = ?,\n"
                + "               User_UserID = ?,\n"
                + "                Category_CategoryID = ?, \n"
                + "                FeeStatus = ?\n"
                + "                where CourseID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, info);
            ps.setString(4, des);
            ps.setString(5, status);
            ps.setString(6, uid);
            ps.setString(7, cid);
            ps.setString(8, fee);
            ps.setString(9, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    public List<Category> getAllCategory() throws SQLException {
        List<Category> list = new ArrayList<>();
        String sql = "select * from f8db.category";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println("Loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;
    }

    //select name from f8db.category where CategoryID = 1; 
    public Category getCategoryNameByID(String Category_CategoryID) throws SQLException {
        String sql = "SELECT * FROM f8db.category join f8db.course where category.CategoryID = course.Category_CategoryID and course.Category_CategoryID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, Category_CategoryID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }

        return null;
    }

    public void toggleCategoryStatus(int categoryId) {
        try {

            // Tạo câu lệnh SQL để truy vấn trạng thái hiện tại
            String query = "SELECT Status FROM f8db.category WHERE CategoryID = ?";

            // Chuẩn bị câu lệnh SQL
            ps = connection.prepareStatement(query);
            ps.setInt(1, categoryId);

            // Thực hiện truy vấn
            rs = ps.executeQuery();

            if (rs.next()) {
                int currentStatus = rs.getInt("Status");

                // Chuyển đổi trạng thái
                int newStatus = (currentStatus == 1) ? 0 : 1;

                // Tạo câu lệnh SQL để cập nhật trạng thái mới
                String updateSql = "UPDATE f8db.category SET Status = ? WHERE CategoryID = ?";

                // Chuẩn bị câu lệnh SQL
                ps = connection.prepareStatement(updateSql);
                ps.setInt(1, newStatus);
                ps.setInt(2, categoryId);

                // Thực thi câu lệnh SQL
                ps.executeUpdate();

                System.out.println("Trạng thái đã được chuyển đổi thành công.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ hoặc thông báo lỗi
        } finally {
            // Đóng kết nối và tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void updateCategory(String id, String name, String image, String des) throws SQLException {
        String sql = "update f8db.category set Name = ?,\n"
                + "               CategoryImage = ?,\n"
                + "               Description = ?\n"
                + "               where CategoryID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, des);
            ps.setString(4, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    public Category getCateByID(int id) throws SQLException {
        String sql = "select * from f8db.category where CategoryID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }
        } catch (Exception e) {
            System.out.println("loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }

        return null;
    }

    public Course addCategory(String name, String image, String des, String status) throws SQLException {
        String sql = "insert into f8db.category(Name, CategoryImage, Description, Status)\n"
                + "values( ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, des);
            ps.setString(4, status);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return null;
    }

    public List<Course> searchAllCourseByName(String txtSearch) throws SQLException {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.course where Name like ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;
    }

    public List<Course> sortCourseBySTT(String sortOrder) throws SQLException {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.course ORDER BY CourseID";
        if ("desc".equals(sortOrder)) { // desc hien thi va select tren jsp 
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;
    }

    public List<Course> sortCourseByName(String sortOrder) throws SQLException {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.course ORDER BY Name";
        if ("desc".equals(sortOrder)) { // desc hien thi va select tren jsp 
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;
    }

    public void banCourse(String id) throws SQLException {
        String sql = "delete from f8db.course where CourseID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    //SELECT category.Name FROM f8db.category join f8db.course where category.CategoryID = course.Category_CategoryID and category.CategoryID = 1;
    // test 
    public static void main(String[] args) throws SQLException {
        CourseDAO dao = new CourseDAO();
        List<Category> list = dao.getAllCategory();
        for (Category o : list) {
            System.out.println(o);
        }
    }
    // Hàm main test
//    public static void main(String[] args) {
//        // Tạo một đối tượng CategoryDAO
//        CourseDAO categoryDAO = new CourseDAO();
//
//        // Thực hiện kiểm tra phương thức getCategoryNameByID
//        try {
//            // Gọi phương thức và lưu kết quả vào biến category
//            Category category = categoryDAO.getCategoryNameByID("1");
//
//            // Kiểm tra kết quả
//            if (category != null) {
//                System.out.println("Category Name: " + category.getName());
//            } else {
//                System.out.println("Category not found.");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }

    public List<Course> getCourseBySearch(String search) throws Exception {
        List<Course> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM f8db.course c WHERE c.Name LIKE ? AND Status = 1";
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course(rs.getInt(1), rs.getString(3), rs.getString(2), rs.getString(4));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public List<Course> getAllCourseEnrollByUserID(String UserID) throws SQLException {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT f8db.course.Name, f8db.course.Image FROM f8db.course join f8db.courseenroll \n"
                + "on f8db.course.CourseID = f8db.courseenroll.Course_CourseID\n"
                + "where f8db.courseenroll.User_UserID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, UserID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;
    }

}
