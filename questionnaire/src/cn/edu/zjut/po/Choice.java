package cn.edu.zjut.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Choice implements Serializable {
    private int choiceId;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
//    private Set questions = new HashSet(0);

    public Choice() {
    }

//    public Choice(int choiceId, String option1, String option2, String option3, String option4, Set questions) {
//        super();
//        this.choiceId = choiceId;
//        this.option1 = option1;
//        this.option2 = option2;
//        this.option3 = option3;
//        this.option4 = option4;
//        this.questions = questions;
//    }

    public Choice(int choiceId, String option1, String option2, String option3, String option4) {
        super();
        this.choiceId = choiceId;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
    }

    public int getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(int choiceId) {
        this.choiceId = choiceId;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

//    public Set getQuestions() {
//        return questions;
//    }
//
//    public void setQuestions(Set questions) {
//        this.questions = questions;
//    }

    public int hashCode() {
        return choiceId;
    }
}
