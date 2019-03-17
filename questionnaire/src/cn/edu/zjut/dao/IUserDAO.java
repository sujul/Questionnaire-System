package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Query;

import cn.edu.zjut.po.User;

public interface IUserDAO {
    public List findByHql(String hql);

    public Object findById(int UserId);

    public Object findById2(int courseId);

    public void save(User instance);

    public void update(User instance);

    public void delete(User instance);
}
