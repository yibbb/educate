package com.educate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 听课证实体类
 *
 * @TableName t_evidence
 */
@TableName(value = "t_evidence")
@Data
public class Evidence implements Serializable {
    /**
     * 听课证的id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 选课信息的id
     */
    private String studentClassId;

    /**
     * 是否丢失 0-未丢失，1-丢失
     */
    private Integer isLose;

    /**
     * 是否有效
     */
    private Integer isValid;
}