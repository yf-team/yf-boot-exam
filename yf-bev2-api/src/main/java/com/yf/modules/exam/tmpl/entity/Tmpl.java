package com.yf.modules.exam.tmpl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;

/**
* <p>
* 试卷实体类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-15 10:41
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("el_tmpl")
public class Tmpl extends Model<Tmpl> {

    @Serial
    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 试卷标题
    */
    private String title;
    
    /**
    * 试卷分类
    */
    @TableField("cat_id")
    private String catId;
    
    /**
    * 组卷方式
    */
    @TableField("join_type")
    private String joinType;
    
    /**
    * 题目数量
    */
    @TableField("qu_count")
    private Integer quCount;
    
    /**
    * 总分数
    */
    @TableField("total_score")
    private BigDecimal totalScore;
    
}
