package com.yf.modules.exam.paper.entity;

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
* 试卷考题实体类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
@Data
@TableName("el_paper_qu")
public class PaperQu extends Model<PaperQu> {

    @Serial
    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 试卷ID
    */
    @TableField("paper_id")
    private String paperId;
    
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
    * 是否已答
    */
    private Boolean answered;
    
    /**
    * 是否标记
    */
    private Boolean mark;
    
    /**
    * 问题排序
    */
    private Integer sort;
    
    /**
    * 单题分分值
    */
    private BigDecimal score;
    
    /**
    * 实际得分(主观题)
    */
    @TableField("actual_score")
    private BigDecimal actualScore;
    
    /**
    * 是否答对
    */
    @TableField("is_right")
    private Boolean isRight;
    
}
