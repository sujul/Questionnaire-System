package cn.edu.zjut.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Course {
    private int courseId;
    private String cname;
    private Set users = new HashSet(0);
     private Set questions = new HashSet(0);

    public Course() {
    }

    

     public Course(int courseId, String cname, Set users, Set questions) {
     super();
     this.courseId = courseId;
     this.cname = cname;
     this.users = users;
     this.questions = questions;
     }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Set getUsers() {
        return users;
    }

    public void setUsers(Set users) {
        this.users = users;
    }

    public Set getQuestions() {
        return questions;
    }

    public void setQuestions(Set questions) {
        this.questions = questions;
    }

    public int hashCode() {
        return courseId;
    }
}
