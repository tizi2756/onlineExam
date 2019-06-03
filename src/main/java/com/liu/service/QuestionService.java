package com.liu.service;

import com.liu.entity.question.TQuestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Auther: liuh
 * @Date: 2019/5/30 18:55
 * @Description:
 */
public interface QuestionService {
    void addQuestion(TQuestion question);
    List<TQuestion> getQuestionList();

    void deletQuestion(int id);

    TQuestion findQuestionById(int id);

    void updateQuestion(TQuestion question);

    List<TQuestion> creatPaper(Map map);
}
