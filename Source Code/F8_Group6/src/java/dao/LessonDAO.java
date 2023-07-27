/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Lesson;
import dto.LessonDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author admin
 */
public class LessonDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<LessonDetail> getAllLessonDetail() throws SQLException {
        List<LessonDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.lessondetail";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LessonDetail(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7)));
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

    public LessonDetail getLessonDetailByID(String LessonDetailID) throws SQLException {
        String sql = "select * from f8db.lessondetail where LessonDetailID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, LessonDetailID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new LessonDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
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
        return null;
    }

    // update 
    public void updateLessonDetail(String Title, String Video, String Note, String Time, String Lesson_LessonID, String Dicuss_DicussID, String LessonDetailID) throws SQLException {
        String sql = "UPDATE f8db.lessondetail SET Title = ?, Video = ?, Note = ?, Time = ?, Lesson_LessonID = ?, Dicuss_DicussID = ? WHERE LessonDetailID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, Title);
            ps.setString(2, Video);
            ps.setString(3, Note);
            ps.setString(4, Time);
            ps.setString(5, Lesson_LessonID);
            ps.setString(6, Dicuss_DicussID);
            ps.setString(7, LessonDetailID);
            ps.executeUpdate();
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
    }

    public LessonDetail addLessonDetail(String LessonDetailID, String Title, String Video, String Note, String Time, String Lesson_LessonID, String Dicuss_DicussID) throws SQLException {
        String sql = "INSERT INTO f8db.lessondetail (LessonDetailID, Title, Video, Note, Time, Lesson_LessonID, Dicuss_DicussID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, LessonDetailID);
            ps.setString(2, Title);
            ps.setString(3, Video);
            ps.setString(4, Note);
            ps.setString(5, Time);
            ps.setString(6, Lesson_LessonID);
            ps.setString(7, Dicuss_DicussID);
            ps.executeUpdate();
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
        return null;
    }

    public void deleteLessonDetail(String LessonDetailID) throws SQLException {
        String sql = "delete from f8db.lessondetail where LessonDetailID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, LessonDetailID);
            ps.executeUpdate();
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
    }

    public List<LessonDetail> searchAllLessonDetailByTitile(String txtSearch) throws SQLException {
        List<dto.LessonDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.lessondetail where Title like ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LessonDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
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

    public List<LessonDetail> sortLessonDetailByTime(String sortOrder) throws SQLException {
        List<dto.LessonDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.lessondetail ORDER BY Time";
        if ("desc".equals(sortOrder)) { // desc hien thi va select tren jsp 
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LessonDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
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

    public List<LessonDetail> sortLessonDetailByTitle(String sortOrder) throws SQLException {
        List<dto.LessonDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.lessondetail ORDER BY Title";
        if ("desc".equals(sortOrder)) {
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LessonDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
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

    public List<LessonDetail> sortLessonDetailByLessonDetailID(String sortOrder) throws SQLException {
        List<dto.LessonDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.lessondetail ORDER BY LessonDetailID";
        if ("desc".equals(sortOrder)) {
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LessonDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
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

    public List<Lesson> getAllLesson() throws SQLException {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.lesson";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(rs.getInt(1), rs.getString(2), rs.getInt(3)));
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

    //
    public Lesson getLessonByLessonID(String LessonID) throws SQLException {
        String sql = "select * from f8db.lesson where LessonID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, LessonID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Lesson(rs.getInt(1), rs.getString(2), rs.getInt(3));
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
        return null;
    }

    public Lesson addLesson(String LessonID, String Name, String Course_CourseID) throws SQLException {
        String sql = "INSERT INTO f8db.lesson (LessonID, Name, Course_CourseID) VALUES (?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, LessonID);
            ps.setString(2, Name);
            ps.setString(3, Course_CourseID);
            ps.executeUpdate();
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
        return null;
    }

    public void updateLessonByLessonID(String Name, String Course_CourseID, String LessonID) throws SQLException {
        String sql = "UPDATE f8db.lesson SET Name = ? , Course_CourseID = ? WHERE LessonID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, Course_CourseID);
            ps.setString(3, LessonID);
            ps.executeUpdate();
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
    }

    public void deleteLessonByLessonID(String LessonID) throws SQLException {
        String sql = "delete from f8db.lesson where LessonID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, LessonID);
            ps.executeUpdate();
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
    }

    public List<Lesson> searchAllLessonByName(String txtSearch) throws SQLException {
        List<Lesson> list = new ArrayList<>();
        String sql = "select * from f8db.lesson where Name like ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(rs.getInt(1), rs.getString(2), rs.getInt(3)));
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

    public static void main(String[] args) throws SQLException {
        LessonDAO dao = new LessonDAO();
        List<LessonDetail> list = dao.getAllLessonDetail();
        for (LessonDetail o : list) {
            System.out.println(o);
        }
    }
}
