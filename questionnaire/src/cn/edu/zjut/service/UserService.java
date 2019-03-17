package cn.edu.zjut.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.CourseDAO;
import cn.edu.zjut.dao.ICourseDAO;
import cn.edu.zjut.dao.IUserDAO;
import cn.edu.zjut.dao.UserDAO;
import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.Question;
import cn.edu.zjut.po.User;

public class UserService implements IUserService{
    private Map<String, Object> request, session;
    private IUserDAO userDAO=null;
    private ICourseDAO courseDAO=null;

    public void setUserDAO(IUserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void setCourseDAO(ICourseDAO courseDAO) {
        this.courseDAO = courseDAO;
    }

    public String login(User user) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
        String username = user.getUsername();
        String password = user.getPassword();
        String hql = "from User where username='" + username + "' and password='" + password + "'";
        List list = userDAO.findByHql(hql);
//        userDAO.getSession().close();
        if (list.isEmpty())
            return "fail";
        else {
            request.put("tip", "登录成功！ ");
            user = (User) list.get(0);
            session.put("userId", user.getUserId());
            session.put("user", user);
            if (user.getType()) {
                return "admin";
            } else {
                Iterator iterator = user.getCourses().iterator();
                Course course = (Course) iterator.next();
                request.put("cname", course.getCname());
                request.put("courseId", course.getCourseId());
                Set questions = course.getQuestions();
                request.put("questions", questions);
                return "user";
            }

        }
    }

    public boolean findUser(User user) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
        String username = user.getUsername();
        String hql = "from User where username='" + username + "'";
        List list = userDAO.findByHql(hql);
//        userDAO.getSession().close();
        if (list.isEmpty()) {
            request.put("tip", "查无此人！");
            return false;
        } else {
            user = (User) list.get(0);
            if (user.getType()) {
                request.put("tip", "这是管理员账号！");
                return false;
            } else {
                request.put("user", user);
                return true;
            }

        }
    }

    public boolean addCour(User user, Course course) {
        ActionContext ctx = ActionContext.getContext();
        request = (Map) ctx.get("request");
        user = (User) userDAO.findById(user.getUserId());
        String hql = "from Course where cname='" + course.getCname() + "'";
        List list = courseDAO.findByHql(hql);
        if (!list.isEmpty()) {
            course = (Course) list.get(0);
        } 
//        course.getUsers().add(user); // 注释 1
        user.getCourses().add(course);
//        Transaction tran = null;
//        try {
//            tran = userDAO.getSession().beginTransaction();
            userDAO.update(user);
//            tran.commit();
            request.put("user", user);
            request.put("tip", "添加课程成功！ ");
            return true;
//        } catch (Exception e) {
//            if (tran != null)
//                tran.rollback();
//            return false;
//        } finally {
////            userDAO.getSession().close();
////            courseDAO.getSession().close();
//        }
    }

    public boolean delCour(User user, Course course) {
        ActionContext ctx = ActionContext.getContext();
        request = (Map) ctx.get("request");
        user = (User) userDAO.findById(user.getUserId());
        course = (Course) userDAO.findById2(course.getCourseId());
        course.getUsers().remove(user); // 注释 1
        user.getCourses().remove(course);
//        Transaction tran = null;
//        try {
//            tran = userDAO.getSession().beginTransaction();
            userDAO.update(user);
            // u_dao.update(Course);
//            tran.commit();
            request.put("user", user);
            request.put("tip", "删除课程成功！ ");
            return true;
//        } catch (Exception e) {
//            if (tran != null)
//                tran.rollback();
//            return false;
//        } finally {
////            userDAO.getSession().close();
//        }
    }

    public boolean update(User users) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
//        Transaction tran = null;
//        try {
//            tran = userDAO.getSession().beginTransaction();
            userDAO.update(users);
//            tran.commit();
            session.remove("user");
            request.put("tip", "更新个人信息成功 ");
            return true;
//        } catch (Exception e) {
//            if (tran != null)
//                tran.rollback();
//            return false;
//        } finally {
////            userDAO.getSession().close();
//        }
    }

    public boolean delete(User users) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
//        Transaction tran = null;
//        try {
//            tran = userDAO.getSession().beginTransaction();
            userDAO.delete(users);
//            tran.commit();
            session.remove("user");
            request.put("tip", "删除个人信息成功， 请重新登录！ ");
            return true;
//        } catch (Exception e) {
//            if (tran != null)
//                tran.rollback();
//            return false;
//        } finally {
////            userDAO.getSession().close();
//        }
    }

}
