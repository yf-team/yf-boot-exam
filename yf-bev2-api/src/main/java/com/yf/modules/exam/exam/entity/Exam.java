package com.yf.modules.exam.exam.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.util.Date;

/**
* <p>
* 课程实体类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:29
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("el_exam")
public class Exam extends Model<Exam> {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 考试名称
     */
    private String title;

    /**
     * 考试描述
     */
    private String content;

    /**
     * 1公开2部门3定员
     */
    @TableField("open_type")
    private Integer openType;

    /**
     * 考试状态
     */
    private Integer state;

    /**
     * 开始时间
     */
    @TableField("start_time")
    private Date startTime;

    /**
     * 结束时间
     */
    @TableField("end_time")
    private Date endTime;

    /**
     * 总分数
     */
    @TableField("total_score")
    private BigDecimal totalScore;

    /**
     * 总时长（分钟）
     */
    @TableField("total_time")
    private Integer totalTime;

    /**
     * 及格分数
     */
    @TableField("qualify_score")
    private BigDecimal qualifyScore;

    /**
     * 考试机会
     */
    private Integer chance;

    /**
     * 最低交卷分钟
     */
    @TableField("hand_min")
    private Integer handMin;

    /**
     * 允许迟到分钟
     */
    @TableField("late_max")
    private Integer lateMax;

    /**
     * 感谢文字
     */
    private String thanks;

    /**
     * 组卷题库ID
     */
    @TableField("repo_id")
    private String repoId;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private Date updateTime;

    /**
     * 创建人
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 修改人
     */
    @TableField(value = "update_by", fill = FieldFill.UPDATE)
    private String updateBy;
    
}
