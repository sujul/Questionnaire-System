package cn.edu.zjut.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.QuestionDAO;
import cn.edu.zjut.po.Course;

public interface IQuestionService {
    public boolean findQuestions(Course course);
}
