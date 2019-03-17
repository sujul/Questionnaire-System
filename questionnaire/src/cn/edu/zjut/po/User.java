package cn.edu.zjut.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class User implements Serializable {
    private int userId;
    private String username;
    private String password;
    private Boolean type;
    private Set courses = new HashSet(0);

    public User() {
    }

    public User(int userId, String username, String password, Boolean type, Set courses) {
        super();
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.type = type;
        this.courses = courses;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public Set getCourses() {
        return courses;
    }

    public void setCourses(Set courses) {
        this.courses = courses;
    }

    public int hashCode() {
        return userId;
    }
}
