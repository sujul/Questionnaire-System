package cn.edu.zjut.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.QuestionDAO;
import cn.edu.zjut.dao.ResultDAO;
import cn.edu.zjut.dao.UserDAO;
import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.Question;
import cn.edu.zjut.po.Result;
import cn.edu.zjut.po.User;

public interface IResultService {
    public boolean findResults();

    public boolean addResults(List answers, Course course);

    public boolean searchResults(User user, Course course);

    public boolean countResults(Course course, Question question);
}
