package cn.edu.zjut.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.po.Course;
import cn.edu.zjut.service.IQuestionService;
import cn.edu.zjut.service.QuestionService;
import cn.edu.zjut.service.UserService;

public class QuestionAction {
    private Course course;
    private IQuestionService questionService=null;
    
    public void setQuestionService(IQuestionService questionService) {
        this.questionService = questionService;
    }
    public String findQuestions() {
        if (questionService.findQuestions(course)) {
            return "success";
        }
        else {
            return "fail";
        }
    }
    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
}
