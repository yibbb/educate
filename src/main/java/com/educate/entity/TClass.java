package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 培训班实体类
 *
 * @TableName t_class
 */
@TableName(value = "t_class")
@Data
public class TClass implements Serializable {
    /**
     * 培训班id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 课程id
     */
    private String courseId;

    /**
     * 课程名
     */
    @TableField(exist = false)
    private String courseName;

    /**
     * 课程学费
     */
    @TableField(exist = false)
    private Double courseCost;

    /**
     * 培训师id
     */
    private String teacherId;

    /**
     * 培训师名
     */
    @TableField(exist = false)
    private String teacherName;

    /**
     * 培训班所处的学期id
     */
    private Integer termId;

    /**
     * 培训班所处的学期
     */
    @TableField(exist = false)
    private Term term;


    /**
     * 培训班是否结课 0-未结课，1-已结课
     */
    private Integer ended;

    /**
     * 培训班是否关闭选课 0-未关闭，1-已关闭
     */
    private Integer closed;
}