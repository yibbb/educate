package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 培训师实体类
 *
 * @TableName t_teacher
 */
@TableName(value = "t_teacher")
@Data
public class Teacher implements Serializable {
    /**
     * 培训师id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 培训师用户名
     */
    private String username;

    /**
     * 培训师密码
     */
    private String password;

    /**
     * 培训师真实姓名
     */
    private String name;

    /**
     * 培训师手机号码
     */
    private String phone;

    /**
     * 培训师邮箱
     */
    private String email;
}