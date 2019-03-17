package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Query;

import cn.edu.zjut.po.Result;

public interface IResultDAO {
    public List findByHql(String hql);
    public List findBySql(String sql);
    public void save(Result instance);
}
