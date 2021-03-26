package com.sirius.domain.model.util;
import com.sirius.domain.model.db.UserDTO;
import com.sirius.exception.ResourceNotFoundException;
import java.util.Date;
import java.util.function.BooleanSupplier;

public class FriendlyUserDTO {
    private Integer id;

    private String username;

    private String firstName;

    private String lastName;

    private String email;

    private String gender;

    private Date registered;

    private Date lastLogin;

    private Boolean isOnline;

    private String picture;

    private String userType;

    private Boolean verified;

    public static FriendlyUserDTO cast(UserDTO user) {
        FriendlyUserDTO fUser = new FriendlyUserDTO();
        fUser.id = user.getId();
        fUser.username = user.getUsername();
        fUser.firstName = user.getFirstName();
        fUser.lastName = user.getLastName();
        fUser.email = user.getEmail();
        fUser.gender = user.getGender();
        fUser.registered = user.getRegistered();
        fUser.lastLogin = user.getLastLogin();
        fUser.isOnline = user.getIsOnline();
        fUser.picture = user.getPicture();
        fUser.userType = user.getUserType();
        fUser.verified = user.getVerified();
        return fUser;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getRegistered() {
        return registered;
    }

    public void setRegistered(Date registered) {
        this.registered = registered;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Boolean getIsOnline() {
        return isOnline;
    }

    public void setIsOnline(Boolean isOnline) { this.isOnline = isOnline; }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Boolean getVerified() {
        return verified;
    }

    public void setVerified(Boolean verified) {
        this.verified = verified;
    }

    public com.sirius.domain.model.db.UserDTO orElseThrow(ResourceNotFoundException exception) {
        throw exception;
    }
}


