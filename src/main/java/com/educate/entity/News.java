package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName t_news
 */
@TableName(value ="t_news")
@Data
public class News implements Serializable {
    /**
     * 新闻id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 新闻内容
     */
    private String context;

    /**
     * 发布时间
     */
    private Date createTime;
}