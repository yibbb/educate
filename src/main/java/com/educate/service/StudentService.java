package com.educate.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.educate.config.RedisData;
import com.educate.dao.StudentDao;
import com.educate.entity.Student;

import com.educate.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;


@Service
public class StudentService extends ServiceImpl<StudentDao, Student> {
    @Autowired
    private StudentDao studentDao;

    @Resource
    private RedisData redisData;

    /**
     * 学生登录校验
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
        LambdaQueryWrapper<Student> wrapper=new LambdaQueryWrapper<>();
        wrapper.eq(Student::getUsername,username);
        Student student=studentDao.selectOne(wrapper);
        if(student==null){
            throw new RuntimeException("用户名不存在");
        }
        if(!MD5Util.encode(password).equals(student.getPassword())){
            throw new RuntimeException("密码不正确");
        }
        return student.getId();
    }

    /**
     * 注册新学生，插入到Student表中
     * <p>
     * 注意必须要检查数据库中有没有用户名相同的学生记录，如果有是不能注册进去的，要抛异常
     *注册完成后存进redis中
     * @param username 用户输入的用户名
     * @param password 用户输入的密码
     * @return 没有问题返回ok，有任何问题抛出异常
     */
    @Transactional
    public String signUp(String username, String password) {
        if(this.SelectByStudentName(username)!=null){
            throw new RuntimeException("用户名已经被注册");
        }
        Student student=new Student();
        student.setUsername(username);
        student.setPassword(MD5Util.encode(password));
        studentDao.insert(student);
        redisData.getOpsForHash(Student.class).put(RedisData.studentKey, student.getId(), student);
        return "ok";
    }

    /**
     * 通过用户名来查找学生
     * @param username 用户名
     * @return
     */
    public Student SelectByStudentName(String username){
        LambdaQueryWrapper<Student> wrapper=new LambdaQueryWrapper<>();
        wrapper.eq(Student::getName,username);
        return studentDao.selectOne(wrapper);
    }
}
