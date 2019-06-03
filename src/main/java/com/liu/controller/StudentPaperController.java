package com.liu.controller;

import com.liu.entity.paper.TPaper;
import com.liu.entity.question.TQuestion;
import com.liu.service.PaperService;
import com.liu.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/6/2 09:41
 * @Description:
 */
@Controller
public class StudentPaperController {
    @Autowired
    PaperService paperService;

    @Autowired
    QuestionService questionService;

    /*
     * @Author Administrator
     * @Description 进入做题页面//TODO
     * @Date 14:37 2019/6/2
     * @Param [paperId, model, session]
     * @return java.lang.String
     **/
    @RequestMapping("/toPaperDetail")
    public String toPaperDetail(Model model){
        List<TPaper> papers=paperService.find();
        model.addAttribute("papers",papers);
        return "student/students-exam";
    }
    @RequestMapping("/qryPaperDetail.action")
    public String qryPaperDetail(String id, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Map map = new HashMap();
        map.put("id", id);
        TPaper paper = paperService.getPaperDetail(map);
        String []ids = paper.getQuestionId().split(",");
        List<TQuestion> selList = new ArrayList<TQuestion>();
        List<TQuestion> inpList = new ArrayList<TQuestion>();
        List<TQuestion> desList = new ArrayList<TQuestion>();
        for(int i = 0;i<ids.length;i++){
            int li=Integer.parseInt(ids[i]);
            TQuestion question = questionService.findQuestionById(li);
            if(question.getTypeId()==1){//单选
                selList.add(question);
            }
            if(question.getTypeId()==2){//填空
                inpList.add(question);
            }
            if(question.getTypeId()==4){//简答题
                desList.add(question);
            }
        }

        if(selList.size()>0){
            model.addAttribute("selectQ", "单项选择题（每题5分）");
            model.addAttribute("selList", selList);
        }

        if(inpList.size()>0){
            model.addAttribute("inpQ", "多选题（每题5分）");
            model.addAttribute("inpList", inpList);
        }

        if(desList.size()>0){
            model.addAttribute("desQ", "简答题（每题5分）");
            model.addAttribute("desList", desList);
        }

        model.addAttribute("paper", paper);
        return "/student/paper-detail";
    }
}
