package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

/**
 * 学生-培训班关系类
 *
 * @TableName t_student_class
 */
@TableName(value = "t_student_class")
@Data
public class StudentClass implements Serializable {
    /**
     * 学生-培训班关系id
     */
    @TableId(type = IdType.ASSIGN_ID)
    @JsonSerialize(using = ToStringSerializer.class)
    private String id;

    /**
     * 学生姓名
     */
    @TableField(exist = false)
    private String studentName;

    /**
     * 课程名
     */
    @TableField(exist = false)
    private String courseName;

    /**
     * 培训师姓名
     */
    @TableField(exist = false)
    private String teacherName;

    /**
     * 学生-培训班的培训班id
     */
    private String classId;

    /**
     * 选课信息的学期
     */
    @TableField(exist = false)
    private Term term;

    /**
     * 学生-培训班的学生id
     */
    private String studentId;

    /**
     * 学生加入培训班的时间
     */
    private Date createTime;

    /**
     * 学生是否支付：0-未支付，1-已支付
     */
    private Integer isPaid;

    /**
     * 选课信息是否被管理员确认：0-未确认，1-已确认
     */
    private Integer isHandled;

    /**
     * 学生的实践成绩
     */
    private Double pScore;

    /**
     * 学生的理论成绩
     */
    private Double tScore;

    /**
     * 学生的总成绩
     */
    private Double score;

}