package cn.edu.zjut.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import cn.edu.zjut.po.Result;

public class ResultDAO extends BaseHibernateDAO implements IResultDAO{
    private Log log = LogFactory.getLog(ResultDAO.class);

    public List findByHql(String hql) {
        log.debug("finding Result instance by hql");
        try {
            String queryString = hql;
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list();
        } catch (RuntimeException re) {
            log.error("find by hql failed", re);
            throw re;
        }
    }
    public List findBySql(String sql) {
        log.debug("finding Result instance by sql");
        try {
            String queryString = sql;
            Query queryObject = getSession().createSQLQuery(queryString);
            return queryObject.list();
        } catch (RuntimeException re) {
            log.error("find by sql failed", re);
            throw re;
        }
    }
    public void save(Result instance) {
        log.debug("saving Result instance");
        try {
            getSession().save(instance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
}
