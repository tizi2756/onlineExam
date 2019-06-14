package com.liu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: liuh
 * @Date: 2019/5/28 18:48
 * @Description: 基本处理
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

    /*
     * @Author liuh
     * @Description 用户登录//TODO
     * @Date 20:07 2019/6/11
     * @Param [req]
     * @return java.lang.String
     **/
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

    /*
     * @Author liuh
     * @Description 判断用户身份，返回相应页面//TODO
     * @Date 20:08 2019/6/11
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/toMyPage")
    public String toMyPage(){
        String loginName = (String) SecurityUtils.getSubject().getPrincipal();
        User user=userService.findByUsername(loginName);
        if ("3".equals(user.getStatus())){
            return "/admin/toquestionAdd";
        } else if("2".equals(user.getStatus())){
            return "redirect:/teacher/toPaperList";
        }
        else {
            return "redirect:/toPaperDetail";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(){
        return "index";
    }

    /*
     * @Author liuh
     * @Description 前往用户列表//TODO
     * @Date 20:09 2019/6/11
     * @Param [pageNo, model]
     * @return java.lang.String
     **/
    @RequestMapping("/admin/toUserList")
    public String toUserList(@RequestParam(defaultValue = "1",required = true,value = "pageNo")Integer pageNo,Model model){
        Integer pageSize=10;
        PageHelper.startPage(pageNo,pageSize);
        List<User> users=userService.getAllUserList();
        PageInfo<User> pageInfo=new PageInfo<>(users);
        model.addAttribute("users",users);
        return "admin/userList";
    }

    /**
     * @Author Administrator
     * @Description //TODO
     * @Date 20:03 2019/6/11
     * @param id
     * @return java.lang.String
     **/
    @RequestMapping("/admin/deletUser")
    public String deletUser(String id){
        if (id!=null){
            userService.deleteUser(Long.valueOf(id));
        }
        return "redirect:/admin/toUserList";
    }
}
