/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author ADMIN
 */
public class MD5 {

    public String getMD5Password(String password) throws NoSuchAlgorithmException {
        // Tạo một đối tượng MessageDigest với thuật toán băm là "MD5"
        MessageDigest md = MessageDigest.getInstance("MD5");
        // Cập nhật giá trị băm với dữ liệu là mật khẩu (biến "password")
        md.update(password.getBytes());
        // Tính toán giá trị băm cuối cùng từ dữ liệu đã được cập nhật
        byte[] digest = md.digest();
        // Chuyển đổi giá trị băm từ dạng mảng byte thành chuỗi thập lục phân và chuyển thành chữ in hoa
        // Trả về chuỗi giá trị băm mật khẩu
        return DatatypeConverter
                .printHexBinary(digest).toUpperCase();
    }
    public static void main(String[] args) throws NoSuchAlgorithmException {
        System.out.println(new MD5().getMD5Password("1234567"));
    }
}
