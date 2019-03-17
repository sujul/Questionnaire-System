package cn.edu.zjut.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.CourseDAO;
import cn.edu.zjut.dao.ICourseDAO;
import cn.edu.zjut.dao.IQuestionDAO;
import cn.edu.zjut.dao.IResultDAO;
import cn.edu.zjut.dao.IUserDAO;
import cn.edu.zjut.dao.QuestionDAO;
import cn.edu.zjut.dao.ResultDAO;
import cn.edu.zjut.dao.UserDAO;
import cn.edu.zjut.dao.ResultDAO;
import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.Question;
import cn.edu.zjut.po.Result;
import cn.edu.zjut.po.User;

public class ResultService implements IResultService{
    private Map<String, Object> request, session;
    private IResultDAO resultDAO=null;
    private IUserDAO userDAO=null;
    private IQuestionDAO questionDAO=null;
    private ICourseDAO courseDAO=null;
    public void setResultDAO(IResultDAO resultDAO) {
        this.resultDAO = resultDAO;
    }

    public void setUserDAO(IUserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void setQuestionDAO(IQuestionDAO questionDAO) {
        this.questionDAO = questionDAO;
    }

    public void setCourseDAO(ICourseDAO courseDAO) {
        this.courseDAO = courseDAO;
    }

    public boolean findResults() {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
        int user_id = (int) session.get("userId");
        String hql = "from Result where user_id=" + user_id + "";
        // String hql = "from Result where user_id=0";
        List list = resultDAO.findByHql(hql);
//        resultDAO.getSession().close();
        // if (list.isEmpty())
        // return false;
        // else {
        request.put("results", list);
        return true;
        // }
    }

    public boolean addResults(List answers, Course course) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
        String hql = "from Course where courseId='" + course.getCourseId() + "'";
        List list = courseDAO.findByHql(hql);
        course=(Course) list.get(0);
        int user_id = (int) session.get("userId");
        Set questions = (Set) session.get("questions");
        Iterator iterator = questions.iterator();
        List<Result> results = new ArrayList<Result>();
//        Transaction tran = null;
//        try {
//            tran = resultDAO.getSession().beginTransaction();
            for (Object object : answers) {
                Result result = new Result();
                result.setUser_id(user_id);
                result.setCourse(course);
                Question question = (Question) iterator.next();
                result.setQuestion(question);
                String answer = (String) object;
                if (question.getType() == '1') {
                    switch (answer) {
                    case "1": {
                        answer = "不满意";
                        break;
                    }
                    case "2": {
                        answer = "一般";
                        break;
                    }
                    case "3": {
                        answer = "中等";
                        break;
                    }
                    case "4": {
                        answer = "良好";
                        break;
                    }
                    case "5": {
                        answer = "满意";
                    }
                    }
                }
                result.setAnswer(answer);
                resultDAO.save(result);
            }
//            tran.commit();
            request.put("tip", "填写信息提交成功! ");
            return true;
//        } catch (Exception e) {
//            if (tran != null)
//                tran.rollback();
//            return false;
//        } finally {
////            resultDAO.getSession().close();
//        }
    }

    public boolean searchResults(User user, Course course) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
        String hql1 = "from User where username='" + user.getUsername() + "'";
        List list1 = userDAO.findByHql(hql1);
        user=(User) list1.get(0);
        String hql2 = "from Result where user_id=" + user.getUserId() + "";
        List list2 = resultDAO.findByHql(hql2);
//        userDAO.getSession().close();
//        resultDAO.getSession().close();
        // if (list.isEmpty())
        // request.put("tip", "失败! ");
        // return false;
        // else {
        request.put("cname", course.getCname());
        request.put("results", list2);
        return true;
        // }
    }
    public boolean countResults(Course course,Question question) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
        String sql = "select answer from result where cour_id=" + course.getCourseId() + " and ques_id=" + question.getQuestionId() + "";
        List list = resultDAO.findBySql(sql);
        String hql = "from Question where questionId=" + question.getQuestionId() + "";
        List list2= questionDAO.findByHql(hql);
//        resultDAO.getSession().close();
//        questionDAO.getSession().close();
//        String hql1 = "from User where userId='" + user.getUsername() + "'";
//        UserDAO dao1 = new UserDAO();
//        List list1 = dao1.findByHql(hql1);
//        user=(User) list1.get(0);
//        String hql2 = "from Result where user_id=" + user.getUserId() + "";
//        ResultDAO dao2 = new ResultDAO();
//        List list2 = dao2.findByHql(hql2);
//        dao1.getSession().close();
//        dao2.getSession().close();
        // if (list.isEmpty())
        // request.put("tip", "失败! ");
        // return false;
        // else {
        request.put("cname", course.getCname());
        request.put("answers", list);
        request.put("question", list2.get(0));
        return true;
        // }
    }
}
