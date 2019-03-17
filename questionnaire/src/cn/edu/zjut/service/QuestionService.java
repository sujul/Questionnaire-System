package cn.edu.zjut.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.IQuestionDAO;
import cn.edu.zjut.dao.QuestionDAO;
import cn.edu.zjut.dao.UserDAO;
import cn.edu.zjut.po.Course;
import cn.edu.zjut.po.User;

public class QuestionService implements IQuestionService{
    private Map<String, Object> request, session;
    private IQuestionDAO questionDAO=null;

    public void setQuestionDAO(IQuestionDAO questionDAO) {
        this.questionDAO = questionDAO;
    }

    public boolean findQuestions(Course course) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
        int courseId = course.getCourseId();
        String hql = "from Course where courseId='" + courseId + "'";
        List list = questionDAO.findByHql(hql);
//        questionDAO.getSession().close();
        if (list.isEmpty())
            return false;
        else {
            course = (Course) list.get(0);
            request.put("cname", course.getCname());
            request.put("courseId", course.getCourseId());
            Set questions=course.getQuestions();
            request.put("questions", questions);
            return true;
        }
    }
}
