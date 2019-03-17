package cn.edu.zjut.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import cn.edu.zjut.po.User;
import cn.edu.zjut.po.User;

public class UserDAO extends BaseHibernateDAO implements IUserDAO{
    private Log log = LogFactory.getLog(UserDAO.class);
    
    public List findByHql(String hql) {
        log.debug("finding User instance by hql");
        try {
            String queryString = hql;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list();
        } catch (RuntimeException re) {
            log.error("find by hql failed", re);
            throw re;
        }
    }
    public Object findById(int UserId) {
        log.debug("finding User instance by UserId");
        try {
            String queryString = "from User where UserId="+UserId;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list().get(0);
        } catch (RuntimeException re) {
            log.error("find by UserId failed", re);
            throw re;
        }
    }
    public Object findById2(int courseId) {
        log.debug("finding Course instance by courseId");
        try {
            String queryString = "from Course where courseId="+courseId;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list().get(0);
        } catch (RuntimeException re) {
            log.error("find by courseId failed", re);
            throw re;
        }
    }
    
    public void save(User instance) {
        log.debug("saving User instance");
        try {
            getSession().save(instance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    public void update(User instance) {
        log.debug("updating User instance");
        try {
            getSession().update(instance);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }
    
    
    public void delete(User instance) {
        log.debug("deleting User instance");
        try {
            getSession().delete(instance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
}
