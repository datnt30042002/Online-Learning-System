/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author admin
 */
@Getter
@Setter
public class Course {

    private int CourseID;
    private String Name;
    private String Image;
    private String CourseInfo;
    private String Description;
    private int Status;
    private int User_UserID;
    private int Category_CategoryID;
    private int FeeStatus;
    private String VideoIntro;

    public Course(String Name, String Image) {
        this.Name = Name;
        this.Image = Image;
    }
    
    public Course(int CourseID, String Name, String Image, String CourseInfo, String Description, int Status, int User_UserID, int Category_CategoryID, int FeeStatus) {
        this.CourseID = CourseID;
        this.Name = Name;
        this.Image = Image;
        this.CourseInfo = CourseInfo;
        this.Description = Description;
        this.Status = Status;
        this.User_UserID = User_UserID;
        this.Category_CategoryID = Category_CategoryID;
        this.FeeStatus = FeeStatus;
    }

    public Course(int CourseID, String Name, String Image, String CourseInfo, String Description, int Status, int User_UserID, int Category_CategoryID, int FeeStatus, String VideoIntro) {
        this.CourseID = CourseID;
        this.Name = Name;
        this.Image = Image;
        this.CourseInfo = CourseInfo;
        this.Description = Description;
        this.Status = Status;
        this.User_UserID = User_UserID;
        this.Category_CategoryID = Category_CategoryID;
        this.FeeStatus = FeeStatus;
        this.VideoIntro = VideoIntro;
    }

    @Override
    public String toString() {
        return "Course{" + "CourseID=" + CourseID + ", Name=" + Name + ", Image=" + Image + ", CourseInfo=" + CourseInfo + ", Description=" + Description + ", Status=" + Status + ", User_UserID=" + User_UserID + ", Category_CategoryID=" + Category_CategoryID + ", FeeStatus=" + FeeStatus + '}';
    }

    public Course(int id, String image, String title, String courseInfo) {
        this.CourseID = id;
        this.Image = image;
        this.Name = title;
        this.CourseInfo = courseInfo;
    }

}
