package com.liu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liu.entity.paper.TPaper;
import com.liu.entity.question.TQuestion;
import com.liu.service.PaperService;
import com.liu.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/5/31 21:55
 * @Description: 试卷处理
 */
@Controller
public class PaperController {
    @Autowired
    PaperService paperService;
    @Autowired
    QuestionService questionService;

    @RequestMapping("/teacher/toPaperList")
    public String toPaperList(@RequestParam(defaultValue = "1",required = true,value = "pageNo")Integer pageNo, Model model){
        Integer pageSize=10;
        PageHelper.startPage(pageNo,pageSize);
        List<TPaper> papers=paperService.find();
        PageInfo<TPaper> pageInfo=new PageInfo<>(papers);

        model.addAttribute("papers",papers);
        return "teacher/paper-list";
    }

    @RequestMapping(value = "/teacher/toAddPaper")
    public String toAddPaper(){
        return "/teacher/paper-add";
    }

    /**
     * @Author Administrator
     * @Description 随机生成试卷//TODO
     * @Date 12:17 2019/6/1
     * @return java.lang.String
     **/
    @RequestMapping("/teacher/AddPaper")
    public String addPaper(@RequestParam int selectNum, @RequestParam int multipleNum,
                           @RequestParam int descNum, TPaper paper, Model model, HttpSession session){
        Map map=new HashMap();
        List<TQuestion> selectList = null;
        List<TQuestion> multipleList = null;
        List<TQuestion> descList = null;
        List<TQuestion> paperList = new ArrayList<TQuestion>();
        if(selectNum>0){//选择题
            map.put("num", selectNum);
            map.put("typeId", 1);
            selectList = questionService.creatPaper(map);
            paperList.addAll(selectList);
        }
        if(multipleNum>0){//判断题
            map.put("num", multipleNum);
            map.put("typeId", 4);
            multipleList = questionService.creatPaper(map);
            paperList.addAll(multipleList);
        }
        if(descNum > 0 ){//描述题
            map.put("num", descNum);
            map.put("typeId", 5);
            descList = questionService.creatPaper(map);
            paperList.addAll(descList);
        }
        String quesId = "";
        for(TQuestion ques : paperList){
            quesId+=ques.getId()+",";
        }
        if(!quesId.isEmpty()){
            quesId = removeLast(quesId);
        }
        paper.setQuestionId(quesId);
        paper.setPaperstate("0");
        paperService.insert(paper);
        return "redirect:/teacher/toPaperList";
    }

    /**
     * 去掉最后一个逗号
     * @param str
     * @return
     */
    public String removeLast(String str){
        //判断最后一个字符是否为逗号，若是截取
        String newStr = str.substring(str.length() -1, str.length());
        if(",".equals(newStr)){
            newStr = str.substring(0, str.length()-1);
        }else{
            newStr = str;
        }
        return newStr;
    }
}
