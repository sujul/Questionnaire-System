package cn.edu.zjut.action;

import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.Question;
import cn.edu.zjut.service.CourseService;
import cn.edu.zjut.service.ICourseService;

public class CourseAction {
    private Course course;
    private Question question;
    private ICourseService courseService=null;

    public void setCourseService(ICourseService courseService) {
        this.courseService = courseService;
    }

    public String findCourse() {
        if (courseService.findCourse(course)) {
            return "success";
        } else {
            return "fail";
        }
    }

    public String addQues() {
        if (courseService.addQues(course, question))
            return "success";
        else
            return "fail";
    }

    public String delQues() {
        if (courseService.delQues(course, question))
            return "success";
        else
            return "fail";
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
}
