package com.educate.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.educate.dao.AdminDao;
import com.educate.entity.Admin;
import com.educate.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class AdminService extends ServiceImpl<AdminDao, Admin> {
    @Autowired
    private AdminDao adminDao;

    /**
     * 检查管理员用户名密码
     * @param username 用户名
     * @param password 密码
     * @return
     */
    public String check(String username,String password) {
        if (username == null || username.trim().isEmpty()) {
            throw new RuntimeException("用户名不能为空");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new RuntimeException("用户名不能为空");
        }
        LambdaQueryWrapper<Admin> wrapper=new LambdaQueryWrapper<>();
        wrapper.eq(Admin::getUsername,username);
        Admin admin=adminDao.selectOne(wrapper);
        if(admin==null){
            throw new RuntimeException("用户名不存在");
        }
        if(!MD5Util.encode(password).equals(admin.getPassword())){
            throw new RuntimeException("密码不正确");
        }
        return admin.getId();
    }
}
