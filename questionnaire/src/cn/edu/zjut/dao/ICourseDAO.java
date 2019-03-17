package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Query;

import cn.edu.zjut.po.Course;

public interface ICourseDAO {
    public List findByHql(String hql);
    public Object findById(int courseId);
    public Object findById2(int questionId);
    public void save(Course instance);
    
    public void update(Course instance);
}
