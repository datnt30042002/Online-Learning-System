/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.BlogComment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import utils.DBContext;

/**
 *
 * @author ADMIN
 */
public class CommentDAO extends DBContext {

    public CommentDAO() {
        super();
    }

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<BlogComment> getAllCommentOfBlog(int blog_id) throws SQLException {
        ArrayList<BlogComment> AllComment = new ArrayList<>();
        String sql = "with t as(SELECT c.BlogCommentID as BlogCommentID,c.BlogID as BlogID,c.UserID as UserID,c.level as level,c.origin_comment_id as origin_comment_id,c.reply_to_user as reply_to_user,c.content as content,c.publish as publish, u1.FullName as reply_to, u2.FullName as comment, u2.image \n"
                + "                FROM f8db.blogcomment c, f8db.user u1, user u2 \n"
                + "               WHERE c.reply_to_user = u1.UserID AND c.UserID = u2.UserID \n"
                + "                AND c.BlogID = ? ORDER BY c.origin_comment_id DESC, level ASC)\n"
                + "                select * from t left join (select l.BlogComment_BlogCommentID as id,count(l.User_UserID) as numberLike from likecomment l group by l.BlogComment_BlogCommentID ) as k on k.id = t.BlogCommentID ORDER BY c.origin_comment_id DESC, level ASC;";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, blog_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                BlogComment b = new BlogComment(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(13));

                AllComment.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return AllComment;
    }

    public static void main(String[] args) throws SQLException {
        new CommentDAO().insertComment(2, 35, "Haha");
    }

    public int insertComment(int id, int userID, String comment) throws SQLException {
        int generatedId = -1;
        String sql = "INSERT INTO f8db.blogcomment VALUES (0, ?, ?, 1, null, ?, ?, now())";
        try {
            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);
            ps.setInt(2, userID);
            ps.setInt(3, userID);
            ps.setString(4, comment);
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
        return 0;
    }

    public void updateOrigin(int id) throws SQLException {
        String sql = "UPDATE f8db.blogcomment SET blogcomment.origin_comment_id = ? WHERE blogcomment.BlogCommentID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void insertReply(int id, int userID, String comment, int id_comment, int reply_to) throws SQLException {
        String sql = "INSERT INTO f8db.blogcomment VALUES (0, ?, ?, 2, ?, ?, ?, now())";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, userID);
            ps.setInt(3, id_comment);
            ps.setInt(4, reply_to);
            ps.setString(5, comment);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void deleteCommentOrigin(int id) throws SQLException {
        String sql = "DELETE FROM f8db.blogcomment c WHERE c.origin_comment_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void deleteLike(int id) throws SQLException {
        String sql = "DELETE FROM f8db.likecomment l WHERE l.BlogComment_BlogCommentID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void deleteCommentOriginReply(int id) throws SQLException {
        String sql = "DELETE FROM f8db.blogcomment c where c.BlogCommentID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void updateOrigin(int id, String content) throws SQLException {
        String sql = "UPDATE f8db.blogcomment SET f8db.blogcomment.content = ? WHERE f8db.blogcomment.BlogCommentID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(2, id);
            ps.setString(1, content);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }
    
    public void unlikeComment(int user_id, int comment_id) throws SQLException {
        String sql = "delete from likecomment where likecomment.User_UserID = ? and likecomment.BlogComment_BlogCommentID = ?;";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, comment_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void insertLikeComment(int user_id, int comment_id) throws SQLException {
        String sql = "insert likecomment values (?,?);";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, comment_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }
}
