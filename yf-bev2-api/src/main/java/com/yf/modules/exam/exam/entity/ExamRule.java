package com.yf.modules.exam.exam.entity;

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
 * 考试规则实体类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:29
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("el_exam_rule")
public class ExamRule extends Model<ExamRule> {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 考试ID
     */
    @TableField("exam_id")
    private String examId;

    /**
     * 题库ID
     */
    @TableField("repo_id")
    private String repoId;

    /**
     * 题型
     */
    @TableField("qu_type")
    private String quType;

    /**
     * 出题数量
     */
    @TableField("qu_count")
    private Integer quCount;

    /**
     * 每题分数
     */
    @TableField("qu_score")
    private BigDecimal quScore;

}
