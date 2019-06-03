package com.liu.service.impl;

import com.liu.entity.question.TQuestion;
import com.liu.mapper.QuestionMapper;
import com.liu.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/5/30 18:50
 * @Description:
 */
@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    QuestionMapper questionMapper;

    @Override
    @Transactional
    public void addQuestion(TQuestion question){
        try{
            questionMapper.createQuestion(question);
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public List<TQuestion> getQuestionList(){
        return questionMapper.getQuestionList();
    }

    @Override
    public void deletQuestion(int id){
        questionMapper.deleteQuestion(id);
    }

    @Override
    public TQuestion findQuestionById(int id){
        return questionMapper.findQuestionById(id);
    }

    @Override
    public void updateQuestion(TQuestion question){
        questionMapper.updateQuestion(question);
    }

    @Override
    public List<TQuestion> creatPaper(Map map){
        return questionMapper.createPaper(map);
    }
}
