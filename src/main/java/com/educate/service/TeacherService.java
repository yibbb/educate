package com.educate.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.educate.dao.TeacherDao;
import com.educate.entity.Admin;
import com.educate.entity.Teacher;
import com.educate.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class TeacherService extends ServiceImpl<TeacherDao, Teacher> {
    @Autowired
    private TeacherDao teacherDao;

    /**
     * 老师登录校验
     * @param username 用户名
     * @param password 密码
     * @return
     */
    public String check(String username,String password){
        if (username == null || username.trim().isEmpty()) {
            throw new RuntimeException("用户名不能为空");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new RuntimeException("用户名不能为空");
        }
        LambdaQueryWrapper<Teacher> wrapper=new LambdaQueryWrapper<>();
        wrapper.eq(Teacher::getUsername,username);
        Teacher teacher=teacherDao.selectOne(wrapper);
        if(teacher==null){
            throw new RuntimeException("用户名不存在");
        }
        if(!MD5Util.encode(password).equals(teacher.getPassword())){
            throw new RuntimeException("密码不正确");
        }
        return teacher.getId();
    }

    /**
     * 获取老师姓名的和id映射
     *
     * @return
     */
    public Map<String,Teacher> getTeacherMap(){
        List<Teacher> teachers=teacherDao.selectList(null);
        ConcurrentHashMap<String,Teacher> map=new ConcurrentHashMap<>();
        teachers.forEach(teacher -> map.put(teacher.getId(),teacher));
        return map;
    }
}
