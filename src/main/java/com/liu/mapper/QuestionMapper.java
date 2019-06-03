package com.liu.mapper;

import com.liu.entity.question.TQuestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/5/29 21:01
 * @Description:
 */
public interface QuestionMapper {
    public void createQuestion(TQuestion question);
    public void deleteQuestion(int questionId);
    TQuestion findQuestionById(int questionId);
    List<TQuestion> getQuestionListByIdListNew(
            @Param("array") List<Integer> idList);
    List<TQuestion> getQuestionList();
    List<TQuestion> getQuestionListByTypeId(int TypeId);

    List<TQuestion> createPaper(Map map);

    void updateQuestion(TQuestion question);
}
