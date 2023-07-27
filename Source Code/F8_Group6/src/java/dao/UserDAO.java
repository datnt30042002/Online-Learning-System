/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import dto.GitHubDTO;
import dto.User;
import dto.UserRole;
import utils.DBContext;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public User getUser(String email, String password) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user join f8db.userrole "
                    + "WHERE user.UserRole_RoleID = userrole.RoleID "
                    + "AND Email LIKE ? AND Password LIKE ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18), new UserRole(rs.getInt(19), rs.getString(20)));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public User getUserByEmail(String email) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user JOIN f8db.userrole "
                    + "WHERE user.UserRole_RoleID = userrole.RoleID "
                    + "AND Email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18), new UserRole(rs.getInt(19), rs.getString(20)));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

    public User getUserByFB(String facebook) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user JOIN f8db.userrole "
                    + "WHERE user.UserRole_RoleID = userrole.RoleID "
                    + "AND Facebook = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, facebook);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18), new UserRole(rs.getInt(19), rs.getString(20)));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

    public GitHubDTO checkGitExist(GitHubDTO userName) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user WHERE Github = ? AND GithubID = ? ";
            ps = connection.prepareStatement(sql);
            ps.setString(2, userName.getId());
            ps.setString(1, userName.getName());
            rs = ps.executeQuery();
            while (rs.next()) {
                return new GitHubDTO(rs.getString(4), rs.getString(13));
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

    public User getUserByGithub(String Github) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user JOIN f8db.userrole "
                    + "WHERE user.UserRole_RoleID = userrole.RoleID "
                    + "AND Github = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, Github);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18), new UserRole(rs.getInt(19), rs.getString(20)));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

    public int insertSocialUser(User u) throws SQLException {
        int kt = 0;
        try {
            String sql = "INSERT INTO f8db.user ( Email, Facebook, Github, Password, Phone, FullName, Image, Dob, Address, \n"
                    + " GmailID, FacebookID, GithubID, Status, UserRole_RoleID, CodeVerify, Bio, BackgroundImage ) \n"
                    + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n"
                    + " 1, 2, ?, ?, ?)";
            ps = connection.prepareStatement(sql);
            ps.setString(1, u.getEmail());
            ps.setString(2, u.getFacebook());
            ps.setString(3, u.getGithub());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getFullName());
            ps.setString(7, u.getImage());
            ps.setString(8, u.getDob().toString());
            ps.setString(9, u.getAddress());
            ps.setString(10, u.getGmailID());
            ps.setString(11, u.getFacebookID());
            ps.setString(12, u.getGithubID());
            ps.setString(13, u.getCodeVerify());
            ps.setString(14, u.getBio());
            ps.setString(15, u.getBackgroundImage());
            kt = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
        return kt;
    }

    public int UpdateUserAfterLoginGG(User u) throws SQLException {
        int k = 0;
        try {
            String sql = "UPDATE f8db.user SET Image = ?, GmailID = ?, Status = ? WHERE UserId = " + u.getUserID();
            ps = connection.prepareStatement(sql);
            ps.setString(1, u.getImage());
            ps.setString(2, u.getGmailID());
            ps.setInt(3, u.getStatus());
            k = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
        return k;
    }

    public int UpdateUserAfterLoginFB(User u) throws SQLException {
        int k = 0;
        try {
            String sql = "UPDATE f8db.user SET Facebook = ?, FacebookID = ?, Status = ? WHERE UserId = " + u.getUserID();
            ps = connection.prepareStatement(sql);
            ps.setString(1, u.getFacebook());
            ps.setString(2, u.getFacebookID());
            ps.setInt(3, u.getStatus());
            k = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
        return k;
    }

    public void insertUser(String email, String password, String fullname, String defaultImg) throws SQLException {
        try {
            String sql = "INSERT INTO f8db.user ( Email, Password, FullName, \n"
                    + " Status, UserRole_RoleID, Image ) \n"
                    + "VALUES ( ?, ?, ?, \n"
                    + " 0, 2, ?)";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, defaultImg);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void insertUserByPhone(String phone, String password, String fullname, String defaultImg) throws SQLException {
        try {
            String sql = "INSERT INTO f8db.user ( Phone, Password, FullName, \n"
                    + " Status, UserRole_RoleID, Image ) \n"
                    + "VALUES ( ?, ?, ?, \n"
                    + " 1, 2, ?)";
            ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, defaultImg);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public User checkUser(String email) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user JOIN f8db.userrole "
                    + "WHERE user.UserRole_RoleID = userrole.RoleID "
                    + "AND Email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18), new UserRole(rs.getInt(19), rs.getString(20)));
                return user;
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

    public void UpdateUserStatus(int userid, String status) throws SQLException {
        String sql = "UPDATE f8db.user SET Status = ? WHERE UserID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(2, userid);
            ps.setString(1, status);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void updateCode(int userid, String code) throws SQLException {
        String sql = "UPDATE f8db.user SET CodeVerify = ? WHERE UserID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(2, userid);
            ps.setString(1, code);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public String getCode(int userid) throws SQLException {
        String sql = "SELECT CodeVerify FROM f8db.user WHERE UserID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
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
        return null;
    }

    public void updatePass(String email, String pass) throws SQLException {
        String sql = "UPDATE f8db.user SET Password = ? WHERE Email LIKE ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(2, email);
            ps.setString(1, pass);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }

    public User getUserByFbID(String id) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user WHERE FacebookID = ? ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18), new UserRole(rs.getInt(19), rs.getString(20)));
                return user;
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

//    public static void main(String[] args) throws SQLException {
//        System.out.println(new UserDAO().getUserByPhone("0865474685").getFullName());
//    }

    // kienbv - 27/06/2023
    public User getUser(int UserID) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user JOIN f8db.userrole "
                    + "WHERE user.UserRole_RoleID = userrole.RoleID "
                    + "AND UserID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18), new UserRole(rs.getInt(19), rs.getString(20)));
                return user;
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
        return null;
    }

    // kienbv - 27/06/2023
    public User getUserbyUserID(String UserID) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM f8db.user join f8db.userrole "
                    + "where user.UserRole_RoleID = userrole.RoleID "
                    + "and UserID = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, UserID);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),rs.getString(17),rs.getString(18),
                        new UserRole(rs.getInt(19), rs.getString(20)));
                return user;
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
        return null;
    }
    
    // kienbv - 27/06/2023
    public void UpdateUserPro(String Email,
            String Facebook,
            String Github,
            String Password,
            String Phone,
            String FullName,
            String Image,
            String Dob,
            String Address,
            String GmailID,
            String FacebookID,
            String GithubID,
            String Status,
            String UserRole_RoleID,
            String CodeVerify,
            String UserID) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE f8db.user \n"
                    + "SET Email = ?, \n"
                    + "Facebook = ?, \n"
                    + "Github = ?, \n"
                    + "Password = ?, \n"
                    + "Phone = ?, \n"
                    + "FullName = ?, \n"
                    + "Image = ?, \n"
                    + "Dob = ?, \n"
                    + "Address = ?, \n"
                    + "GmailID = ?, \n"
                    + "FacebookID = ?, \n"
                    + "GithubID = ?, \n"
                    + "UserRole_RoleID = ?, \n"
                    + "CodeVerify = ? \n"
                    + "WHERE UserID = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, Email);
            ps.setString(2, Facebook);
            ps.setString(3, Github);
            ps.setString(4, Password);
            ps.setString(5, Phone);
            ps.setString(6, FullName);
            ps.setString(7, Image);
            ps.setString(8, Dob);
            ps.setString(9, Address);
            ps.setString(10, GmailID);
            ps.setString(11, FacebookID);
            ps.setString(12, GithubID);
            ps.setString(13, Status);
            ps.setString(14, UserRole_RoleID);
            ps.setString(15, CodeVerify);
            ps.setString(16, UserID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    // kienbv - 27/06/2023
    public void UpdateLogin(
            String FullName,
            String Image,
            String Bio,
            String BackGroundImage,
            String UserID) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE f8db.user SET FullName = ?, \n"
                    + "                    Image = ?, \n"
                    + "                    Bio = ?, \n"
                    + "                    BackgroundImage = ?\n"
                    + "                    WHERE UserID = ? ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, FullName);
            ps.setString(2, Image);
            ps.setString(3, Bio);
            ps.setString(4, BackGroundImage);
            ps.setString(5, UserID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    // kienbv - 27/06/2023
    public void UpdateUserDetail(
            String Email,
            String Phone,
            String FullName, 
            String Image, 
            String Status,
            String UserRole, 
            String UserID) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE f8db.user SET Email = ?, Phone = ?, FullName = ?, Image = ?, Status = ?, UserRole_RoleID = ? WHERE UserID = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, Email);
            ps.setString(2, Phone);
            ps.setString(3, FullName);
            ps.setString(4, Image);
            ps.setString(5, Status);
            ps.setString(6, UserRole);
            ps.setString(7, UserID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    // he161471
//    public int UpdateUserProfile(User u) throws SQLException {
//        PreparedStatement ps = null;
//        int k = 0;
//        try {
//            String sql = "update f8db.user set Phone=?,FullName=? where UserID = " + u.getUserID();
//            ps = connection.prepareStatement(sql);
//            ps.setString(1, u.getPhone());
//            ps.setString(2, u.getFullName());
//            ps.setInt(3, u.getUserID());
//            k = ps.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            if (ps != null) {
//                ps.close();
//            }
//        }
//        return k;
//    }
    
    // kienbv - 27/06/2023
    public void deleteUserByUserID(String UserID) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "DELETE FROM f8db.user where UserID =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, UserID);
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
    
    public User getUserByPhone(String phone) throws SQLException {
        try {
            String sql = "SELECT * FROM f8db.user JOIN f8db.userrole WHERE user.UserRole_RoleID = userrole.RoleID AND Phone = ? ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18), new UserRole(rs.getInt(19), rs.getString(20)));
                return user;
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

    // kienbv - 27/06/2023
    public int UpdateUserProfile(User u) throws SQLException {
        int k = 0;
        try {
            String sql = "update f8db.user set Phone=?,FullName=? where UserID = " + u.getUserID();
            ps = connection.prepareStatement(sql);
            ps.setString(1, u.getPhone());
            ps.setString(2, u.getFullName());
            ps.setInt(3, u.getUserID());
            k = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
        return k;
    }

    public List<String> getAllPhones() throws SQLException {
        List<String> list = new ArrayList<>();
        String sql = "SELECT Phone FROM f8db.user WHERE Phone is not null AND Phone != ''";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
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
    
    // kienbv - 27/06/2023
    public List<User> getAllUser() throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.user";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18)));
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
    
    // kienbv - 27/06/2023
    public void UpdatePass(
            String Password,
            String UserID) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE f8db.user SET Password = ? WHERE UserID = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, Password);
            ps.setString(2, UserID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    // kienbv - 27/06/2023
    public void UpdateUserInforByAdmin(
            String Image,
            String FullName,
            String Email,
            String Phone,
            String UserRole_RoleID,
            String Status,
            String UserID) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE f8db.user SET Email = ?, Phone = ?, FullName = ?, Image = ?, Status = ?, UserRole_RoleID = ? WHERE UserID = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, Image);
            ps.setString(2, FullName);
            ps.setString(3, Email);
            ps.setString(4, Phone);
            ps.setString(5, UserRole_RoleID);
            ps.setString(6, Status);
            ps.setString(7, UserID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }

    // kienbv - 27/06/2023
    public List<UserRole> getAllUserRole() throws SQLException {
        List<UserRole> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.userrole";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new UserRole(rs.getInt(1), rs.getString(2)));
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

    // kienbv - 27/06/2023
    public List<User> getAllUserByUserRoleID(String UserRoleID) throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.user where user.UserRole_RoleID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, UserRoleID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18)));
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

    // kienbv - 27/06/2023
    public List<User> getAllUserByStatus(String Status) throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.user where user.Status = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, Status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18)));
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

    // kienbv - 27/06/2023
    public List<User> searchAllUserByUserName(String txtSearch) throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.user where FullName like ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18)));
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

    // kienbv - 27/06/2023
    public List<User> sortUsersByFullName(String sortOrder) throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.user ORDER BY FullName";
        if ("desc".equals(sortOrder)) { // desc hien thi va select tren jsp 
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18)));
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

    // kienbv - 27/06/2023
    public List<User> sortUsersByUserID(String sortOrder) throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.user ORDER BY UserID";
        if ("desc".equals(sortOrder)) { // desc hien thi va select tren jsp 
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18)));
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

    // kienbv - 27/06/2023
    public List<User> sortUsersByUserRole(String sortOrder) throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.user ORDER BY UserRole_RoleID";
        if ("desc".equals(sortOrder)) { // desc hien thi va select tren jsp 
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18)));
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

    // kienbv - 27/06/2023
    public List<User> sortUsersByUserStatus(String sortOrder) throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM f8db.user ORDER BY Status";
        if ("desc".equals(sortOrder)) { // desc hien thi va select tren jsp 
            sql += " DESC";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getInt(14), rs.getInt(15), rs.getString(16),
                        rs.getString(17), rs.getString(18)));
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
    
    // kienbv - 27/06/2023
    public static void main(String[] args) throws SQLException {
        UserDAO dao = new UserDAO();
        List<User> list = dao.getAllUser();
        for (User o : list) {
            System.out.println(o);
        }
    }
}
