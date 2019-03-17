package cn.edu.zjut.action;

import java.util.List;

import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.Question;
import cn.edu.zjut.po.Result;
import cn.edu.zjut.po.User;
import cn.edu.zjut.service.IResultService;
import cn.edu.zjut.service.ResultService;

public class ResultAction {
    private List<String> answers;
    private Course course;
    private User user;
    private Question question;
    private IResultService resultService=null;

    public void setResultService(IResultService resultService) {
        this.resultService = resultService;
    }

    public String findResults() {
        if (resultService.findResults()) {
            return "success";
        } else {
            return "fail";
        }
    }

    public String addResults() {
        if (resultService.addResults(answers, course)) {
            return "success";
        } else {
            return "fail";
        }
    }

    public String searchResults() {
        if (resultService.searchResults(user,course)) {
            return "success";
        } else {
            return "fail";
        }
    }
    public String countResults() {
        if (resultService.countResults(course,question)) {
            return "success";
        } else {
            return "fail";
        }
    }
    public List<String> getAnswers() {
        return answers;
    }

    public void setAnswers(List<String> answers) {
        this.answers = answers;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

}
