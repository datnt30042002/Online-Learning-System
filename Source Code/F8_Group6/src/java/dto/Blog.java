/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author admin
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Blog {

    private int BlogID;
    private String BlogTitle;
    private String BlogImage;
    private String BlogDetail;
    private Date PostDate;
    private int UserID;
    private String UserName;
    private String Image;
    private boolean BlogStatus;
    private int TimeToRead;
    private int BlogTopicID;
    private String BlogTopicName;
    private int BlogTagID;
    private String BlogTagName;
    private String save_day;
    private int likes;
    private int comments;

    @Override
    public String toString() {
        return "Blog{" + "BlogID=" + BlogID + ", UserID=" + UserID + ", BlogTitle=" + BlogTitle + ", BlogImage=" + BlogImage + ", BlogDescription=" + BlogDetail + ", PostDate=" + PostDate + ", BlogStatus=" + BlogStatus + ", TimeToRead=" + TimeToRead + '}';
    }
    
    // Hien
    public Blog(int BlogID, String BlogTitle, String BlogImage, String BlogDetail, Date PostDate, int UserID, boolean BlogStatus, int TimeToRead, int BlogTopicID, int BlogTagID) {
        this.BlogID = BlogID;
        this.BlogTitle = BlogTitle;
        this.BlogImage = BlogImage;
        this.BlogDetail = BlogDetail;
        this.PostDate = PostDate;
        this.UserID = UserID;
        this.BlogStatus = BlogStatus;
        this.TimeToRead = TimeToRead;
        this.BlogTopicID = BlogTopicID;
        this.BlogTagID = BlogTagID;
    }

    public Blog(int BlogID, String BlogTitle, String BlogImage, String BlogDetail, java.sql.Date PostDate, int UserID, boolean BlogStatus, int TimeToRead, int BlogTopicID, int BlogTagID, String UserName, String BlogTagName, String BlogTopicName, String Image) {
        this.BlogID = BlogID;
        this.BlogTitle = BlogTitle;
        this.BlogImage = BlogImage;
        this.BlogDetail = BlogDetail;
        this.PostDate = PostDate;
        this.UserID = UserID;
        this.UserName = UserName;
        this.BlogStatus = BlogStatus;
        this.TimeToRead = TimeToRead;
        this.BlogTopicID = BlogTopicID;
        this.BlogTopicName = BlogTopicName;
        this.BlogTagID = BlogTagID;
        this.BlogTagName = BlogTagName;
        this.Image = Image;
    }

    public Blog(int BlogID, String BlogTitle, String BlogImage, String BlogDetail, java.sql.Date PostDate, int UserID, boolean BlogStatus, int TimeToRead, int BlogTopicID, int BlogTagID, String UserName, String BlogTagName, String BlogTopicName, String Image, String save_day) {
        this.BlogID = BlogID;
        this.BlogTitle = BlogTitle;
        this.BlogImage = BlogImage;
        this.BlogDetail = BlogDetail;
        this.PostDate = PostDate;
        this.UserID = UserID;
        this.UserName = UserName;
        this.BlogStatus = BlogStatus;
        this.TimeToRead = TimeToRead;
        this.BlogTopicID = BlogTopicID;
        this.BlogTopicName = BlogTopicName;
        this.BlogTagID = BlogTagID;
        this.BlogTagName = BlogTagName;
        this.Image = Image;
        this.save_day = save_day;
    }

    public Blog(int id, String image, String title, int likes, int comments) {
        this.BlogID = id;
        this.BlogImage = image;
        this.BlogTitle = title;
        this.likes = likes;
        this.comments = comments;
    }
}
