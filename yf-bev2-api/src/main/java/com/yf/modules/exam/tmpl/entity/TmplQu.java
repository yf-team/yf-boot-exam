package com.yf.modules.exam.tmpl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.io.Serial;
import java.math.BigDecimal;

/**
* <p>
* 试卷题目实体类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-15 10:41
*/
@Data
@TableName("el_tmpl_qu")
public class TmplQu extends Model<TmplQu> {

    @Serial
    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 模板ID
    */
    @TableField("tmpl_id")
    private String tmplId;
    
    /**
    * 题目ID
    */
    @TableField("qu_id")
    private String quId;
    
    /**
    * 题目类型
    */
    @TableField("qu_type")
    private String quType;
    
    /**
    * 分数
    */
    @TableField("qu_score")
    private BigDecimal quScore;
    
    /**
    * 排序
    */
    private Integer sort;
    
}
