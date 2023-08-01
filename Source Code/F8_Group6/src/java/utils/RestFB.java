/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.User;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author ADMIN
 */
public class RestFB {
    
    // Use Libs: gson-2.8.2, httpclient-4.5.5, httpcore-4.4.9, commons-logging-1.2, fluent-hc-4.5.5, restfb-2.3.0
    // Get Token and UserInfo From Facebook
    public static String getToken(final String code) throws ClientProtocolException, IOException {
        // Tạo URL để yêu cầu mã truy cập từ Facebook
        String link = String.format(Constants.FACEBOOK_LINK_GET_TOKEN, Constants.FACEBOOK_APP_ID, Constants.FACEBOOK_APP_SECRET, Constants.FACEBOOK_REDIRECT_URL, code);
        // Gửi yêu cầu HTTP GET đến URL và nhận phản hồi
        String response = Request.Get(link).execute().returnContent().asString();
        // Phân tích phản hồi JSON thành một đối tượng JsonObject
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        // Trích xuất mã truy cập từ JsonObject
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        // In mã truy cập (tùy chọn)
        System.out.println(accessToken);
        // Trả về mã truy cập
        return accessToken;
    }

    public static User getUserInfo(String accessToken) {
        // Tạo một FacebookClient sử dụng mã truy cập
        FacebookClient facebookClient = new DefaultFacebookClient(accessToken, Constants.FACEBOOK_APP_SECRET, Version.LATEST);
        // Lấy và trả về thông tin người dùng từ Facebook
        return facebookClient.fetchObject("me", User.class);
    }
}
