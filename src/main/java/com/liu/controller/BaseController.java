package com.liu.controller;

import com.liu.entity.user.User;
import com.liu.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/5/28 18:48
 * @Description:
 */
@Controller
public class BaseController {
    protected Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
    @Autowired
    UserService userService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String main(Model model){
        return "/index.jsp";
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest req){

        String errorClassName = (String)req.getAttribute("shiroLoginFailure");

        if(UnknownAccountException.class.getName().equals(errorClassName)) {
            req.setAttribute("error", "用户名/密码错误");
        } else if(IncorrectCredentialsException.class.getName().equals(errorClassName)) {
            req.setAttribute("error", "用户名/密码错误");
        } else if(errorClassName != null) {
            req.setAttribute("error", "未知错误：" + errorClassName);
        }
        return "login";
    }

    @RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
    public String unauthorized(){
        return "unauthorized";
    }

    /**
     * @Author liuh
     * @Description //TODO
     * @Date 19:16 2019/5/28
     * @param password
     * @param username
     * @return java.lang.String
     **/
    @RequestMapping(value = "/login.do")
    public String userlogin(String username,String password){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        try{
            subject.login(token);
        }catch (UnknownAccountException uae){
            resultMap.put("massage","账号不存在");
            return "massage";
        }catch (LockedAccountException lae){
            resultMap.put("massage","账号已锁定");
            return "massage";
        }catch (AuthenticationException ae){
            resultMap.put("err","登录失败");
            return "massage";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/teacher/teacherTest")
    public String teacher(){
        return "teacher/teacherTest";
    }

    @RequestMapping(value = "/toMyPage")
    public String toMyPage(){
        String loginName = (String) SecurityUtils.getSubject().getPrincipal();
        User user=userService.findByUsername(loginName);
        if ("1".equals(user.getStatus())){
            return "student/students-exam";
        } else if("2".equals(user.getStatus())){
            return "redirect:/teacher/toPaperList";
        }
        else {
            return "admin/questionAdd";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(){
        return "index";
    }
}
