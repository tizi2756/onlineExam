package com.liu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liu.controller.Do.Message;
import com.liu.entity.question.TQuestion;
import com.liu.entity.question.TType;
import com.liu.entity.user.User;
import com.liu.service.QuestionService;
import com.liu.service.TypeService;
import com.mysql.fabric.xmlrpc.base.Data;
import org.apache.shiro.SecurityUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.http.HttpRequest;
import java.util.Date;
import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2019/5/30 18:16
 * @Description:
 */
@Controller
public class QuestionController {

    @Autowired
    QuestionService questionService;
    @Autowired
    TypeService typeService;

    @RequestMapping(value = "/admin/toquestionAdd", method = RequestMethod.GET)
    public String questionAddPage(){
        return "admin/questionAdd";
    }

    @RequestMapping(value = "/admin/questionAdd", method = RequestMethod.POST)
    public String addQuestion(TQuestion question, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String loginName = (String) SecurityUtils.getSubject().getPrincipal();
        Message message=new Message();
        question.setCreatTime(new Date());
        question.setCreator(loginName);
        try{
            questionService.addQuestion(question);
            request.setAttribute("message","添加成功");
        }catch (Exception e){
            request.setAttribute("message",e.getClass().getName());
//            message.setResult("error");
//            message.setMessageInfo(e.getClass().getName());
            e.printStackTrace();
        }
        return "admin/questionAdd";
    }
    @RequestMapping(value = "/admin/questionList", method = RequestMethod.GET)
    public String questionListPage(@RequestParam(defaultValue = "1",required = true,value = "pageNo")Integer pageNo, Model model){
        Integer pageSize=10;
        PageHelper.startPage(pageNo,pageSize);
        List<TQuestion> questionList=questionService.getQuestionList();
        PageInfo<TQuestion> pageInfo=new PageInfo<>(questionList);

        model.addAttribute("questionList",questionList);
        return "admin/questionList";

    }
    /**
     * 删除问题信息
     * @param id	问题编号，删除多个是，id用逗号分隔开
     * @param model
     * @return
     */
    @RequestMapping("/admin/deleteQuestion.action")
    public String deleteQuestion(String id, Model model){
        if(id != null){
//            String ids[] = id.split(",");
//            for(int i=0;i<ids.length;i++){
//                questionService.delete(Integer.parseInt(ids[i]));
//            }
            questionService.deletQuestion(Integer.parseInt(id));
        }
        return "/admin/questionList";
    }

    /**
     * 查看问题信息
     * @param id 问题编号
     * @return
     */
    @RequestMapping("/admin/toQryQuestion.action")
    public String toQryQuestion(int id, Model model, HttpSession session){
        TQuestion question = questionService.findQuestionById(id);
        TType type = typeService.getType(question.getTypeId());
        model.addAttribute("type",type.getName());
        model.addAttribute("question", question);
        return "/admin/question-qry.jsp";
    }

    /**
     * 跳转到更新题目信息页面
     * @param id
     * @return
     */
    @RequestMapping("/admin/toUpdQuestion.action")
    public String toUpdQuestion(int id, Model model, HttpSession session){
        TQuestion question = questionService.findQuestionById(id);
        TType type = typeService.getType(question.getTypeId());
        model.addAttribute("type",type.getName());
        model.addAttribute("question", question);
        return "/admin/question-updata.jsp";
    }

    /**
     * 更新题目信息
     * @param model
     * @param session
     * @return
     */

    @RequestMapping("/admin/updQuestion.action")
    public String updQuestion(@RequestBody TQuestion question, Model model, HttpSession session){
        questionService.updateQuestion(question);
        return "/admin/questionList";
    }

}
