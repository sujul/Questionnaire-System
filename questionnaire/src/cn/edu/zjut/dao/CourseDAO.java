package cn.edu.zjut.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.User;

public class CourseDAO extends BaseHibernateDAO implements ICourseDAO{
    private Log log = LogFactory.getLog(CourseDAO.class);

    public List findByHql(String hql) {
        log.debug("finding Course instance by hql");
        try {
            String queryString = hql;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list();
        } catch (RuntimeException re) {
            log.error("find by hql failed", re);
            throw re;
        }
    }
    public Object findById(int courseId) {
        log.debug("finding course instance by courseId");
        try {
            String queryString = "from Course where courseId="+courseId;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list().get(0);
        } catch (RuntimeException re) {
            log.error("find by courseId failed", re);
            throw re;
        }
    }
    public Object findById2(int questionId) {
        log.debug("finding question instance by questionId");
        try {
            String queryString = "from Question where questionId="+questionId;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list().get(0);
        } catch (RuntimeException re) {
            log.error("find by questionId failed", re);
            throw re;
        }
    }
    public void save(Course instance) {
        log.debug("saving Course instance");
        try {
            getSession().save(instance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
    public void update(Course instance) {
        log.debug("updating Course instance");
        try {
            getSession().update(instance);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }
}
