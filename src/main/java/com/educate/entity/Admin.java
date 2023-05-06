package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 管理员实体类
 *
 * @TableName t_admin
 */
@TableName(value = "t_admin")
@Data
public class Admin implements Serializable {
    /**
     * 管理员id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 管理员用户名
     */
    private String username;

    /**
     * 管理员密码
     */
    private String password;
}