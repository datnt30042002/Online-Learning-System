/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ADMIN
 */
public class Mailer {

    // Add libs: activation-jar1.1.1.jar, javax.mail.jar, mail.jar
    public static boolean send(String to, String sub,
            String msg) throws UnsupportedEncodingException {
        Properties props = new Properties(); // Cấu hình gửi mail
        String user = "tiendat288966@gmail.com";
        String pass = "hfqcaubtteeyrmef";
        /* 
           Thiết lập địa chỉ IP của máy chủ email mặc định. 
           Ví dụ: nếu bạn đang sử dụng máy chủ email của Gmail, bạn sẽ sử dụng smtp.gmail.com. 
           Thay đổi tùy thuộc vào dịch vụ email mà bạn sử dụng.
         */
        props.put("mail.smtp.host", "smtp.gmail.com");
        // Cổng dịch vụ SMTP (Simple Mail Transfer Protocol) để gửi email
        props.put("mail.smtp.port", "587");
        // Xác thực (authentication) khi gửi email
        props.put("mail.smtp.auth", "true");
        // Kết nối TLS (Transport Layer Security)
        props.put("mail.smtp.starttls.enable", "true");
        // Thiết lập phiên bản giao thức SSL (Secure Sockets Layer)
        props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        /* 
           Tạo một phiên (session) với các thuộc tính và Authenticator cho việc xác thực 
           Authenticator được sử dụng để cung cấp thông tin đăng nhập
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            /* 
               Tạo một đối tượng MimeMessage, chứa các MIME types và headers
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user, "F8"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");
            message.setText(msg, "UTF-8");
            message.setSubject(sub, "UTF-8");
            /* 
               Transport class được sử dụng để gửi message đến người nhận 
             */
            Transport.send(message);
            System.out.println("Gửi Email thành công");
        } catch (SendFailedException e) {
            // Lấy danh sách các địa chỉ không gửi được email
            Address[] invalidAddresses = e.getInvalidAddresses();

            if (invalidAddresses != null && invalidAddresses.length > 0) {
                for (Address address : invalidAddresses) {
                    System.out.println("Địa chỉ không hợp lệ hoặc không tồn tại: " + address.toString());
                }
            }
            return false;
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Lỗi: Mất kết nối mạng");
            return false;
        }
        return true;
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        send("a", "Verify", "152");
    }

}
