package cn.edu.zjut.po;

import java.util.HashSet;
import java.util.Set;

public class Result {
    private int resultId;
    private int user_id;
    private Course course;
    private Question question;
    private String answer;

    public Result() {
        super();
    }

    public Result(int resultId, int user_id, Course course, Question question, String answer) {
        super();
        this.resultId = resultId;
        this.user_id = user_id;
        this.course = course;
        this.question = question;
        this.answer = answer;
    }

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int hashCode() {
        return resultId;
    }
}
