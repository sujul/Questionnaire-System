package cn.edu.zjut.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import cn.edu.zjut.po.Question;

public class QuestionDAO extends BaseHibernateDAO implements IQuestionDAO{
    private Log log = LogFactory.getLog(QuestionDAO.class);

    public List findByHql(String hql) {
        log.debug("finding Question instance by hql");
        try {
            String queryString = hql;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list();
        } catch (RuntimeException re) {
            log.error("find by hql failed", re);
            throw re;
        }
    }
    public List findByHql2(String hql) {
        log.debug("finding Choice instance by hql");
        try {
            String queryString = hql;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list();
        } catch (RuntimeException re) {
            log.error("find by hql failed", re);
            throw re;
        }
    }
    public Object findById(int QuestionId) {
        log.debug("finding Question instance by QuestionId");
        try {
            String queryString = "from Question where QuestionId="+QuestionId;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list().get(0);
        } catch (RuntimeException re) {
            log.error("find by QuestionId failed", re);
            throw re;
        }
    }
    public Object findById2(int addressId) {
        log.debug("finding Address instance by addressId");
        try {
            String queryString = "from Address where addressId="+addressId;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list().get(0);
        } catch (RuntimeException re) {
            log.error("find by addressId failed", re);
            throw re;
        }
    }

    public void update(Question instance) {
        log.debug("updating Question instance");
        try {
            getSession().update(instance);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }
    
    
    public void delete(Question instance) {
        log.debug("deleting Question instance");
        try {
            getSession().delete(instance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
}
