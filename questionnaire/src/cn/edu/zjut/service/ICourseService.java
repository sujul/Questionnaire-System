package cn.edu.zjut.service;

import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.CourseDAO;
import cn.edu.zjut.dao.QuestionDAO;
import cn.edu.zjut.po.Choice;
import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.Question;

public interface ICourseService {
    public boolean findCourse(Course course);

    public boolean addQues(Course course, Question question);

    public boolean delQues(Course course, Question question);
}
