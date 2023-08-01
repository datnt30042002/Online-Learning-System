/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import dto.Blog;
import dto.BlogTag;
import dto.BlogTopic;
import utils.DBContext;

/**
 *
 * @author ADMIN
 */
public class BlogDAO extends DBContext {

    public BlogDAO() {
        super();
    }

    public ArrayList<Blog> getAllBlogg() {
        ArrayList<Blog> AllBlogg = new ArrayList<>();
        String sql = "SELECT * FROM blog";
        try ( Statement statement = connection.createStatement();  ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getDate(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getBoolean(9),
                        rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getString(14),
                        rs.getString(15), rs.getInt(16), rs.getInt(17));
                AllBlogg.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return AllBlogg;
    }

    public ArrayList<Blog> getBlogFromStatus(int status, int uid) {
        ArrayList<Blog> blogS = new ArrayList<>();
        String sql = "SELECT * FROM blog WHERE BlogStatus = ? and User_UserID = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, status);
            ps.setInt(2, uid);
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getInt(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
                    blogS.add(blog);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogS;
    }

    public void insertBlog(String title, String image, String date, String time, String detail, int uid, String status, String blogtopicid, String blogtagid) {
        String query = "INSERT INTO f8db.blog (BlogTitle, BlogImage, PostDate, TimeToRead, BlogDetail, User_UserID, BlogStatus, BlogTopic_BlogTopicID, BlogTag_BlogTagID)\n"
                + "VALUES (?,?,now(),?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, image);
            ps.setString(3, time);
            ps.setString(4, detail);
            ps.setInt(5, uid);
            ps.setString(6, status);
            ps.setString(7, blogtopicid);
            ps.setString(8, blogtagid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
    }

    public Blog getBlogFromBlogID(int blogID) {
        Blog blogid = null;
        try {
            String sql = "SELECT * FROM f8db.blog WHERE BlogID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, blogID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getDate(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getBoolean(9),
                        rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getString(14),
                        rs.getString(15), rs.getInt(16), rs.getInt(17));

            }
        } catch (SQLException e) {
        }
        return blogid;
    }

    public void updateBlog(String title, String image, String date, String time, String detail, String status, int blogid) {
        String query = "UPDATE f8db.blog set BlogTitle=?, BlogImage=?, PostDate=?, TimeToRead=?, BlogDetail=? , BlogStatus=? WHERE BlogID =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, image);
            ps.setString(3, date);
            ps.setString(4, time);
            ps.setString(5, detail);
            ps.setString(6, status);
            ps.setInt(7, blogid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
    }

    public void updateBlogStatus(int blogId) throws SQLException {
        String sql = "UPDATE f8db.blog SET BlogStatus = 3 WHERE BlogID = ?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, blogId);
            statement.executeUpdate();
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    public void delBlog(int id) {
        String sql = "delete from blog where BlogID=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
        }
    }

    // DAT DAO 
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Blog> getListBlog() throws SQLException {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.*, u.FullName, bt.BlogTagName, bc.BlogTopicName, u.Image \n"
                    + "FROM blog b, blogtag bt, blogtopic bc, user u WHERE bt.BlogTagID = b.BlogTag_BlogTagID "
                    + "AND bc.BlogTopicID = b.BlogTopic_BlogTopicID AND b.User_UserID = u.UserID AND BlogStatus = 1 "
                    + "ORDER BY b.PostDate DESC";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getInt(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
                        rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));

                list.add(blog);
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
        return list;
    }

    public List<Blog> getNewListBlog() throws SQLException {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.*, u.FullName, bt.BlogTagName, bc.BlogTopicName, u.Image \n"
                    + "FROM blog b, blogtag bt, blogtopic bc, user u \n"
                    + "WHERE bt.BlogTagID = b.BlogTag_BlogTagID AND bc.BlogTopicID = b.BlogTopic_BlogTopicID\n"
                    + "AND b.User_UserID = u.UserID AND BlogStatus = 1 ORDER BY b.PostDate DESC LIMIT 5";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getInt(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
                        rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));

                list.add(blog);
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
        return list;
    }

    public List<BlogTag> getListBlogTag() throws SQLException {
        List<BlogTag> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM blogtag";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new BlogTag(rs.getInt(1), rs.getString(2)));
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
        return list;
    }

    public List<BlogTopic> getListBlogTopic() throws SQLException {
        List<BlogTopic> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM blogtopic";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new BlogTopic(rs.getInt(1), rs.getString(2)));
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
        return list;
    }

    public Blog getListBlogByID(int id) throws SQLException {
        try {
            String sql = "SELECT b.*,u.FullName,bt.BlogTagName,bc.BlogTopicName, u.Image \n"
                    + "FROM blog b, blogtag bt, blogtopic bc, user u \n"
                    + "WHERE bt.BlogTagID = b.BlogTag_BlogTagID AND bc.BlogTopicID = b.BlogTopic_BlogTopicID\n"
                    + "AND b.User_UserID = u.UserID AND b.BlogID = ?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getInt(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
                        rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
                return blog;
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
        return null;
    }

    public List<Blog> getListByTag(int parseInt) throws SQLException {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.*,u.FullName,bt.BlogTagName,bc.BlogTopicName, u.Image \n"
                    + "FROM blog b, blogtag bt, blogtopic bc, user u \n"
                    + "WHERE bt.BlogTagID = b.BlogTag_BlogTagID AND bc.BlogTopicID = b.BlogTopic_BlogTopicID\n"
                    + "AND b.User_UserID = u.UserID AND bt.BlogTagID = ? AND BlogStatus = 1";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parseInt);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getInt(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
                        rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));

                list.add(blog);
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
        return list;
    }

    public List<Blog> getListByTopic(int parseInt) throws SQLException {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.*, u.FullName, bt.BlogTagName, bc.BlogTopicName, u.Image \n"
                    + "FROM blog b, blogtag bt, blogtopic bc, user u \n"
                    + "WHERE bt.BlogTagID = b.BlogTag_BlogTagID AND bc.BlogTopicID = b.BlogTopic_BlogTopicID\n"
                    + "AND b.User_UserID = u.UserID AND  bc.BlogTopicID = ? AND BlogStatus = 1";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parseInt);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getInt(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
                        rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));

                list.add(blog);
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
        return list;
    }

    public List<Blog> getListByTagAndTopic(int parseIntTopic, int parseIntTag) throws SQLException {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.*, u.FullName, bt.BlogTagName, bc.BlogTopicName, u.Image \n"
                    + "FROM blog b, blogtag bt, blogtopic bc, user u \n"
                    + "WHERE bt.BlogTagID = b.BlogTag_BlogTagID \n"
                    + "AND bc.BlogTopicID = b.BlogTopic_BlogTopicID AND b.User_UserID = u.UserID \n"
                    + "AND  bc.BlogTopicID = ? AND bt.BlogTagID = ? AND BlogStatus = 1";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parseIntTopic);
            ps.setInt(2, parseIntTag);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getInt(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
                        rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));

                list.add(blog);
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
        return list;
    }

    public List<Blog> getListSaveBlog(int parseInt) throws SQLException {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.*, u.FullName, bt.BlogTagName, bc.BlogTopicName, u.Image, s.save_day \n"
                    + "FROM f8db.blog b, f8db.blogtag bt, f8db.blogtopic bc, f8db.user u, f8db.saveblog s \n"
                    + "WHERE bt.BlogTagID = b.BlogTag_BlogTagID\n"
                    + "AND bc.BlogTopicID = b.BlogTopic_BlogTopicID AND b.User_UserID = u.UserID\n"
                    + "AND  s.Blog_BlogID = b.BlogID AND s.User_UserID = ?\n"
                    + "ORDER BY s.save_day DESC";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parseInt);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getInt(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
                        rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15));

                list.add(blog);
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
        return list;
    }

    public List<Integer> getIDListSaveBlog(int parseInt) throws SQLException {
        List<Integer> list = new ArrayList<>();
        try {
            String sql = "SELECT b.BlogID FROM f8db.blog b, f8db.blogtag bt, f8db.blogtopic bc, f8db.user u, f8db.saveblog s \n"
                    + "WHERE bt.BlogTagID = b.BlogTag_BlogTagID\n"
                    + "AND bc.BlogTopicID = b.BlogTopic_BlogTopicID AND b.User_UserID = u.UserID\n"
                    + "AND  s.Blog_BlogID = b.BlogID AND s.User_UserID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parseInt);
            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(rs.getInt(1));
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
        return list;
    }

    public static void main(String[] args) throws Exception {
        System.out.println(new BlogDAO().getBlogBySearch("v").subList(6, 7).get(0).getLikes());
    }

    public void insertSaveBlog(int userID, int id) throws SQLException {
        String sql = "INSERT INTO f8db.saveblog VALUES (?,?, now())";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
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

    public void deleteSaveBlog(int id, int userID) throws SQLException {
        String sql = "DELETE FROM f8db.saveblog b WHERE b.Blog_BlogID = ? AND b.User_UserID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, userID);
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

    public List<Integer> getIDListLike(int parseInt) throws SQLException {
        List<Integer> list = new ArrayList<>();
        try {
            String sql = "SELECT b.BlogID FROM f8db.blog b, f8db.blogtag bt, f8db.blogtopic bc, f8db.user u,f8db.savelike s \n"
                    + "WHERE bt.BlogTagID = b.BlogTag_BlogTagID\n"
                    + "AND bc.BlogTopicID = b.BlogTopic_BlogTopicID AND b.User_UserID = u.UserID\n"
                    + "AND  s.Blog_BlogID = b.BlogID AND s.User_UserID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parseInt);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
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
        return list;
    }

    public int getTotalLikeOfBlog(int parseInt) throws SQLException {

        try {
            String sql = "SELECT count(*) FROM f8db.savelike s WHERE s.Blog_BlogID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parseInt);
            rs = ps.executeQuery();
            while (rs.next()) {

                return rs.getInt(1);
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
        return 0;
    }

    public void insertLikeBlog(int id, int userID) throws SQLException {
        String sql = "INSERT INTO f8db.savelike VALUES (?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, userID);
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

    public void deleteLikeBlog(int id, int userID) throws SQLException {
        String sql = "DELETE FROM f8db.savelike b WHERE b.Blog_BlogID = ? AND b.User_UserID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, userID);
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

    public List<Blog> getBlogBySearch(String search) throws Exception {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "with t as(SELECT b.BlogID as BlogID, "
                    + "             b.BlogImage as BlogImage, "
                    + "             b.BlogTitle as BlogTitle, "
                    + "             COUNT(s.User_UserID) as numberLike\n"
                    + "             FROM blog b\n"
                    + "             LEFT JOIN savelike s ON s.Blog_BlogID = b.BlogID\n"
                    + "             where b.BlogStatus = 1\n"
                    + "             GROUP BY b.BlogID, b.BlogImage, b.BlogTitle)\n"
                    + " select t.BlogID, t.BlogImage, t.BlogTitle, t.numberLike, count(b.BlogCommentID) "
                    + "as numberComment from t left join blogcomment b on b.BlogID = t.BlogID "
                    + "where t.BlogTitle like ? group by t.BlogID,t.BlogImage,t.BlogTitle,t.numberLike;";
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
                list.add(blog);
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
}
