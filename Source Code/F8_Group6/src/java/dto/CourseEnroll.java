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
public class CourseEnroll {

    //(`CourseEnrollID`, `Status`, ` string LessonCurrent`, `date EnrollDate`, `User_UserID`, `Course_CourseID`)
    private int CourseEnrollID;
    private int Status;
    private String LessonCurrent;
    private Date EnrollDate;
    private int User_UserID;
    private int Course_CourseID;

    public CourseEnroll() {
    }

    public CourseEnroll(int CourseEnrollID, int Status, String LessonCurrent, Date EnrollDate, int User_UserID, int Course_CourseID) {
        this.CourseEnrollID = CourseEnrollID;
        this.Status = Status;
        this.LessonCurrent = LessonCurrent;
        this.EnrollDate = EnrollDate;
        this.User_UserID = User_UserID;
        this.Course_CourseID = Course_CourseID;
    }

}
