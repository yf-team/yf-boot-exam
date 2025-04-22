package com.yf.modules.exam.paper.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.io.Serial;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 试卷实体类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Data
@TableName("el_paper")
public class Paper extends Model<Paper> {

    @Serial
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
     * 考试标题
     */
    private String title;

    /**
     * 考试时长
     */
    @TableField("total_time")
    private Integer totalTime;

    /**
     * 用户时长
     */
    @TableField("user_time")
    private Integer userTime;

    /**
     * 试卷总分
     */
    @TableField("total_score")
    private BigDecimal totalScore;

    /**
     * 试卷及格分
     */
    @TableField("qualify_score")
    private BigDecimal qualifyScore;

    /**
     * 用户总得分
     */
    @TableField("user_score")
    private BigDecimal userScore;

    /**
     * 最后截止时间
     */
    @TableField("limit_time")
    private Date limitTime;

    /**
     * 实际交卷时间
     */
    @TableField("hand_time")
    private Date handTime;

    /**
     * 交卷状态,0未交卷,1已交卷,2强制交卷
     */
    @TableField("hand_state")
    private Integer handState;

    /**
     * 成绩是否合格
     */
    private Boolean passed;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private Date updateTime;

    /**
     * 创建人
     */
    @TableField("create_by")
    private String createBy;

    /**
     * 修改人
     */
    @TableField("update_by")
    private String updateBy;

}
