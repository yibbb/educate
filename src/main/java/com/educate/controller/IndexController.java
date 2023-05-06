package com.educate.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.educate.dao.StudentDao;
import com.educate.entity.News;
import com.educate.entity.dto.UserInfo;
import com.educate.service.AdminService;
import com.educate.service.NewsService;
import com.educate.service.StudentService;
import com.educate.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;

    /**
     * 跳转首页视图
     * @param request 控制转发
     * @return 返回最新的10条新闻信息
     */
    @GetMapping({"/index"})
    public String index(HttpServletRequest request){
        LambdaQueryWrapper<News> wrapper=new LambdaQueryWrapper<>();
        wrapper.orderByDesc(News::getCreateTime).last("limit 10");
        request.setAttribute("newList",newsService.list(wrapper));
        return "index";
    }

    /**
     * 管理员登录接口，用于校验管理员的用户名和密码
     *
     * @param request  session中存入管理员的用户信息
     * @param username 用户名
     * @param password 密码
     * @return 没有问题返回ok，有任何问题返回异常信息
     */
    @ResponseBody
    @PostMapping("/adminLogin")
    public String adminLogin(HttpServletRequest request,
                             @RequestParam("username")String username,
                             @RequestParam("password")String password){
        try {
            String id=adminService.check(username,password);
            HttpSession session=request.getSession();
            //把管理员信息存入到session中
            session.setAttribute(UserInfo.ADMIN,adminService.getById(id));
        } catch (Exception e) {
            e.getMessage();
        }
        return "ok";
    }

    /**
     * 老师登录接口，用于校验管理员的用户名和密码
     *
     * @param request  session中存入老师的用户信息
     * @param username 用户名
     * @param password 密码
     * @return 没有问题返回ok，有任何问题返回异常信息
     */
    @ResponseBody
    @PostMapping("/teacherLogin")
    public String teacherLogin(HttpServletRequest request,
                             @RequestParam("username")String username,
                             @RequestParam("password")String password){
        try {
            String id=teacherService.check(username,password);
            HttpSession session=request.getSession();
            //把老师信息存入到session中
            session.setAttribute(UserInfo.TEACHER,teacherService.getById(id));
        } catch (Exception e) {
            e.getMessage();
        }
        return "ok";
    }

    /**
     * 学生登录接口，用于校验学生的用户名和密码
     *
     * @param request  session中存入学生的用户信息
     * @param username 用户名
     * @param password 密码
     * @return 没有问题返回ok，有任何问题返回异常信息
     */
    @PostMapping("/studentLogin")
    @ResponseBody
    public String studentLogin(HttpServletRequest request,
                               @RequestParam("username") String username,
                               @RequestParam("password") String password) {
        try {
            String id = studentService.check(username, password);
            HttpSession session=request.getSession();
            //把学生信息存入到session中
            session.setAttribute(UserInfo.STUDENT,studentService.getById(id));
            return "ok";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    /**
     * 学生的注册接口
     *
     * @param username 用户名
     * @param password 密码
     * @return 没有问题返回ok，有异常返回异常信息
     */
    @PostMapping("/studentSignUp")
    @ResponseBody
    public String studentSignUp(@RequestParam("username") String username,
                                @RequestParam("password") String password) {
        try {
            return studentService.signUp(username, password);
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    /**
     * 用户登出接口，清空session中的信息
     *
     * @param request
     * @return
     */
    @GetMapping("/loginOut")
    public String loginOut(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/index";
    }

}
