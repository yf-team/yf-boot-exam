package com.yf.modules.exam.paper.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 试卷数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Data
@Schema(description = "试卷")
public class PaperDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "ID")
    private String id;

    @Schema(description = "用户ID")
    private String userId;

    @Schema(description = "考试ID")
    private String examId;

    @Schema(description = "考试标题")
    private String title;

    @Schema(description = "考试时长")
    private Integer totalTime;

    @Schema(description = "用户时长")
    private Integer userTime;

    @Schema(description = "试卷总分")
    private BigDecimal totalScore;

    @Schema(description = "试卷及格分")
    private BigDecimal qualifyScore;

    @Schema(description = "用户总得分")
    private BigDecimal userScore;

    @Schema(description = "最后截止时间")
    private Date limitTime;

    @Schema(description = "实际交卷时间")
    private Date handTime;

    @Schema(description = "交卷状态,0未交卷,1已交卷,2强制交卷")
    private Integer handState;

    @Schema(description = "成绩是否合格")
    private Boolean passed;

    @Schema(description = "创建时间")
    private Date createTime;

    @Schema(description = "更新时间")
    private Date updateTime;

    @Schema(description = "创建人")
    private String createBy;

    @Schema(description = "修改人")
    private String updateBy;

}
