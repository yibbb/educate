package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.UUID;

import lombok.Data;

/**
 * 学生实体类
 *
 * @TableName t_student
 */
@TableName(value = "t_student")
@Data
public class Student implements Serializable {
    /**
     * 学生id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 学生用户名
     */
        private String username;

    /**
     * 学生密码
     */
    private String password;

    /**
     * 学生真实姓名
     */
    private String name;

    /**
     * 学生手机号
     */
    private String phone;

    /**
     * 学生邮箱
     */
    private String email;

}