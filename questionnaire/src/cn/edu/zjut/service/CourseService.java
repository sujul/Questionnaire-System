package cn.edu.zjut.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.QuestionDAO;
import cn.edu.zjut.dao.CourseDAO;
import cn.edu.zjut.dao.ICourseDAO;
import cn.edu.zjut.dao.IQuestionDAO;
import cn.edu.zjut.po.Question;
import cn.edu.zjut.po.Choice;
import cn.edu.zjut.po.Course;

public class CourseService implements ICourseService{
    private Map<String, Object> request, session;
    private ICourseDAO courseDAO=null;
    private IQuestionDAO questionDAO=null;
    
    public void setCourseDAO(ICourseDAO courseDAO) {
        this.courseDAO = courseDAO;
    }

    public void setQuestionDAO(IQuestionDAO questionDAO) {
        this.questionDAO = questionDAO;
    }

    public boolean findCourse(Course course) {
        ActionContext ctx = ActionContext.getContext();
        session = (Map) ctx.getSession();
        request = (Map) ctx.get("request");
        String cname = course.getCname();
        String hql = "from Course where cname='" + cname + "'";
        List list = courseDAO.findByHql(hql);
//        courseDAO.getSession().close();
        if (list.isEmpty()) {
            request.put("tip", "查无此课！");
            return false;
        } else {
            course = (Course) list.get(0);
            request.put("course", course);
            return true;
        }
    }

    public boolean addQues(Course course, Question question) {
        ActionContext ctx = ActionContext.getContext();
        request = (Map) ctx.get("request");
        course = (Course) courseDAO.findById(course.getCourseId());
        String hql = "from Question where title='" + question.getTitle() + "' and type='" + question.getType() + "'";
        List list = questionDAO.findByHql(hql);
        if (!list.isEmpty()) {
            question = (Question) list.get(0);
        } else {
//            Choice choice=new Choice(0, "", "", "", "");
            if(question.getType()!='2')
                question.setChoice(null);
        }
        if(question.getType()=='2') {
            String hql2 = "from Choice where option1='" + question.getChoice().getOption1() + "' and option2='" + question.getChoice().getOption2()+ "' and option3='" + question.getChoice().getOption3()+ "' and option4='" + question.getChoice().getOption4() + "'";
            List list2 = questionDAO.findByHql2(hql2);
            if (!list2.isEmpty()) {
                question.setChoice((Choice)list2.get(0));
            }
        }
//        Question.getCourses().add(Course); // 注释 1
        course.getQuestions().add(question);
//        Transaction tran = null;
//        try {
//            tran = courseDAO.getSession().beginTransaction();
            courseDAO.update(course);
//            tran.commit();
            request.put("course", course);
            request.put("tip", "添加题目成功！ ");
            return true;
//        } catch (Exception e) {
//            if (tran != null)
//                tran.rollback();
//            return false;
//        } finally {
////            courseDAO.getSession().close();
////            questionDAO.getSession().close();
//        }
    }

    public boolean delQues(Course course, Question question) {
        ActionContext ctx = ActionContext.getContext();
        request = (Map) ctx.get("request");
        course = (Course) courseDAO.findById(course.getCourseId());
        question = (Question) courseDAO.findById2(question.getQuestionId());
        question.getCourses().remove(course); // 注释 1
        course.getQuestions().remove(question);
//        Transaction tran = null;
//        try {
//            tran = courseDAO.getSession().beginTransaction();
            courseDAO.update(course);
            // c_dao.update(Question);
//            tran.commit();
            request.put("course", course);
            request.put("tip", "删除题目成功！ ");
            return true;
//        } catch (Exception e) {
//            if (tran != null)
//                tran.rollback();
//            return false;
//        } finally {
////            courseDAO.getSession().close();
//        }
    }
}
