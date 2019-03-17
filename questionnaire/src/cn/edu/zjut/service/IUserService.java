package cn.edu.zjut.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.User;

public interface IUserService {
    public String login(User user);

    public boolean findUser(User user);

    public boolean addCour(User user, Course course);

    public boolean delCour(User user, Course course);

    public boolean update(User users);

    public boolean delete(User users);
}
