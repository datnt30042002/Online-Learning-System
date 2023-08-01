/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.Date;
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
public class User {

    private int UserID;
    private String Email;
    private String Facebook;
    private String Github;
    private String Password;
    private String Phone;
    private String FullName;
    private String Image;
    private Date Dob;
    private String Address;
    private String GmailID;
    private String FacebookID;
    private String GithubID;
    private int Status;
    private int UserRole_RoleID;
    private String CodeVerify;
    private String Bio;
    private String BackgroundImage; 
    private UserRole userRole;
    

    public User(int UserID, String Email, String Facebook, String Password, String Phone, String FullName, String Image, Date Dob, String Address, String GmailID, String FacebookID, int Status, int UserRole_RoleID, String CodeVerify) {
        this.UserID = UserID;
        this.Email = Email;
        this.Facebook = Facebook;
        this.Password = Password;
        this.Phone = Phone;
        this.FullName = FullName;
        this.Image = Image;
        this.Dob = Dob;
        this.Address = Address;
        this.GmailID = GmailID;
        this.FacebookID = FacebookID;
        this.Status = Status;
        this.UserRole_RoleID = UserRole_RoleID;
        this.CodeVerify = CodeVerify;
    }

    public User(int UserID, String Email, String Facebook, String Github, String Password, String Phone, String FullName, String Image, Date Dob, String Address, String GmailID, String FacebookID, String GithubID, int Status, int UserRole_RoleID, String CodeVerify, String Bio, String BackgroundImage) {
        this.UserID = UserID;
        this.Email = Email;
        this.Facebook = Facebook;
        this.Github = Github;
        this.Password = Password;
        this.Phone = Phone;
        this.FullName = FullName;
        this.Image = Image;
        this.Dob = Dob;
        this.Address = Address;
        this.GmailID = GmailID;
        this.FacebookID = FacebookID;
        this.GithubID = GithubID;
        this.Status = Status;
        this.UserRole_RoleID = UserRole_RoleID;
        this.CodeVerify = CodeVerify;
        this.Bio = Bio;
        this.BackgroundImage = BackgroundImage;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", Email=" + Email + ", Facebook=" + Facebook + ", Github=" + Github + ", Password=" + Password + ", Phone=" + Phone + ", FullName=" + FullName + ", Image=" + Image + ", Dob=" + Dob + ", Address=" + Address + ", GmailID=" + GmailID + ", FacebookID=" + FacebookID + ", GithubID=" + GithubID + ", Status=" + Status + ", UserRole_RoleID=" + UserRole_RoleID + ", CodeVerify=" + CodeVerify + ", Bio=" + Bio + ", BackgroundImage=" + BackgroundImage + '}';
    }

    
    
}
