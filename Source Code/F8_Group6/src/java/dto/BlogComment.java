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
 * @author ADMIN
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BlogComment {

    private int BlogCommmentID;
    private int BlogID;
    private int UserID;
    private int level;
    private int origin_comment_id;
    private int reply_to_user;
    private String content;
    private String publish;
    private String reply_to;
    private String user_comment;
    private String user_image;
    private int numberLike;
}
