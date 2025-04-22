package com.yf.modules.exam.exam.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.math.BigDecimal;

/**
 * <p>
 * 考试记录实体类
 * </p>
 *
 * @author 沉醉寒风
 * @since 2025-04-17 14:59
 */
@Data
@TableName("el_exam_record")
public class ExamRecord extends Model<ExamRecord> {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 用户ID
     */
    @TableField("user_id")
    private String userId;

    /**
     * 考试ID
     */
    @TableField("exam_id")
    private String examId;

    /**
     * 结算的试卷ID
     */
    @TableField("paper_id")
    private String paperId;

    /**
     * 考试次数
     */
    @TableField("try_count")
    private Integer tryCount;

    /**
     * 最高分数
     */
    @TableField("max_score")
    private BigDecimal maxScore;

    /**
     * 最近分数
     */
    @TableField("last_score")
    private BigDecimal lastScore;

    /**
     * 是否通过
     */
    private Boolean passed;

}
