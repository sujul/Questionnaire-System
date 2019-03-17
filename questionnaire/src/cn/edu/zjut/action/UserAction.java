package cn.edu.zjut.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.User;
import cn.edu.zjut.service.IUserService;
import cn.edu.zjut.service.UserService;

public class UserAction {
    private User user;
    private Course course;
    private IUserService userService = null;

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public String login() {
        return userService.login(user);
    }

    public String findUser() {
        if (userService.findUser(user)) {
            return "success";
        } else {
            return "fail";
        }
    }
    public String addCour() {
        if (userService.addCour(user, course))
            return "success";
        else
            return "fail";
    }
    
    public String delCour() {
        if (userService.delCour(user, course))
            return "success";
        else
            return "fail";
    }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

}
