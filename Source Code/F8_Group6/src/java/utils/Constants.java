/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author ADMIN
 */
public class Constants {

    // Google
    // Config and receive ID and Secret Google
    public static String GOOGLE_CLIENT_ID = "474696467188-912h3an6csb4sen30chpstfou05t4o77.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    // Config URI redirect after Google authenticate
    public static String GOOGLE_REDIRECT_URI = "http://localhost:9999/F8_Group6/loginwithgoogle";
    // URL to request an access token from Google after the user has been authenticated.
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    // URL to get user information from Google's API using an access token.
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    
    // Facebook
    // Config and receive ID and Secret Facebook
    public static String FACEBOOK_APP_ID = "846580123743218";
    public static String FACEBOOK_APP_SECRET = "431767c2d772d41045a8a42999b95d00";
    // Config URI redirect after Facebook authenticate
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:9999/F8_Group6/login-facebook";
    // URL to request an access token from Facebook after the user has been authenticated.
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
    
    // Github
    // Config and receive ID and Secret Github
    public static String GIT_CLIENT_ID = "a7e824d060494fe9b9d4";
    public static String GIT_CLIENT_SECRET = "09607b21b207ff4a7fa998e35cd7b2dff73e718d";
    // Config URI redirect after Github authenticate
    public static String GIT_REDIRECT_URI = "http://localhost:9999/F8_Group6/login-github";
    // URL to request an access token from Facebook after the user has been authenticated.
    public static String GIT_LINK_GET_TOKEN = "https://github.com/login/oauth/access_token?";
    // URL to get user information from Github's API.
    public static String GIT_LINK_GET_USER_INFO = "https://api.github.com/user";
}
