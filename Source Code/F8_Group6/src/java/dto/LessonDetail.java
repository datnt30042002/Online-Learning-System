/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import lombok.Getter;
import lombok.Setter;
/**
 *
 * @author admin
 */
@Getter
@Setter
public class LessonDetail {

    private int LessonDetailID;
    private String Title;
    private String Video;
    private String Note;
    private String Time;
    private int Lesson_LessonID;
    private int Dicuss_DicussID;

    public LessonDetail(int LessonDetailID, String Title, String Video, String Note, String Time, int Lesson_LessonID, int Dicuss_DicussID) {
        this.LessonDetailID = LessonDetailID;
        this.Title = Title;
        this.Video = Video;
        this.Note = Note;
        this.Time = Time;
        this.Lesson_LessonID = Lesson_LessonID;
        this.Dicuss_DicussID = Dicuss_DicussID;
    }

    
    @Override
    public String toString() {
        return "LessonDetail{" + "LessonDetailID=" + LessonDetailID + ", Title=" + Title + ", Video=" + Video + ", Note=" + Note + ", Time=" + Time + ", Lesson_LessonID=" + Lesson_LessonID + ", Dicuss_DicussID=" + Dicuss_DicussID + '}';
    }
    
    
}
