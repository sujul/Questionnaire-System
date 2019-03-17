package cn.edu.zjut.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Question implements Serializable {
    private int questionId;
    private String title;
    private char type;
    private Set courses = new HashSet(0);
    private Choice choice;

    public Question() {
    }

    public Question(int questionId, String title, char type, Set courses, Choice choice) {
        super();
        this.questionId = questionId;
        this.title = title;
        this.type = type;
        this.courses = courses;
        this.choice = choice;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public char getType() {
        return type;
    }

    public void setType(char type) {
        this.type = type;
    }

    public Set getCourses() {
        return courses;
    }

    public void setCourses(Set courses) {
        this.courses = courses;
    }

    public Choice getChoice() {
        return choice;
    }

    public void setChoice(Choice choice) {
        this.choice = choice;
    }

    public int hashCode() {
        return questionId;
    }
}
