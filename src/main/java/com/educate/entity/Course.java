package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.math.BigDecimal;

import lombok.Data;

/**
 * 课程实体类
 *
 * @TableName t_course
 */
@TableName(value = "t_course")
@Data
public class Course implements Serializable {
    /**
     * 课程id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 课程名
     */
    private String name;

    /**
     * 课程学费
     */
    private Double cost;
}