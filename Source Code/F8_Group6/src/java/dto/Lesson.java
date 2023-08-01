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
public class Lesson {

    private int LessonID;
    private String Name;
    private int Course_CourseID;

    public Lesson(int LessonID, String Name, int Course_CourseID) {
        this.LessonID = LessonID;
        this.Name = Name;
        this.Course_CourseID = Course_CourseID;
    }

    @Override
    public String toString() {
        return "Lesson{" + "LessonID=" + LessonID + ", Name=" + Name + ", Course_CourseID=" + Course_CourseID + '}';
    }

}
