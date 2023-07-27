/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

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
public class Category {

    private int CategoryID;
    private String Name;
    private String CategoryImage;
    private String Description;
    private String Status;

    @Override
    public String toString() {
        return "Category{" + "CategoryID=" + CategoryID + ", Name=" + Name + ", CategoryImage=" + CategoryImage + ", Description=" + Description + ", Status=" + Status + '}';
    }

}
