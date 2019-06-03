package com.liu.entity.user;

import java.io.Serializable;

/**
 * @Auther: Administrator
 * @Date: 2019/5/25 17:15
 * @Description:
 */
public class User implements Serializable {
    private int id;
    private String username;
    private String password;
    private String salt;
    private String emily;
    private int status;

    private Boolean locked=Boolean.FALSE;

    public User(int id, String username, String password, String salt, String emily, int status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.salt = salt;
        this.emily = emily;
        this.status = status;
    }

    public User(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public String getCredentialsSalt() {
        return username + salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getEmily() {
        return emily;
    }

    public void setEmily(String emily) {
        this.emily = emily;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", locked=" + locked +
                '}';
    }
}

