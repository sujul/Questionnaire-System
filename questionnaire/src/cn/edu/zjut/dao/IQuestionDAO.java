package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Query;

import cn.edu.zjut.po.Question;

public interface IQuestionDAO {
    public List findByHql(String hql);

    public List findByHql2(String hql);

    public Object findById(int QuestionId);

    public Object findById2(int addressId);

    public void update(Question instance);

    public void delete(Question instance);
}
