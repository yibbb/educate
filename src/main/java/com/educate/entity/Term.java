package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 学期实体类
 *
 * @TableName t_term
 */
@TableName(value = "t_term")
@Data
public class Term implements Serializable {

    public static final String SPRING = "春";
    public static final String SUMMER = "夏";
    public static final String FALL = "秋";


    /**
     * 学期id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 学期年份
     */
    private Integer year;

    /**
     * 学期季节
     */
    private String season;

    /**
     * 该学期是否结课 0-未结课，1-已结课
     */
    private Integer ended;

    /**
     * 该学期是否结束选课 0-未结束，1-已结束
     */
    private Integer closed;

    /**
     * 重写toString，显示年份季节
     *
     * @return
     */
    @Override
    public String toString() {
        return year + "年" + season + "季";
    }


}