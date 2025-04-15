package com.yf.modules.exam.exam.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
* <p>
* 考试数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:29
*/
@Data
@Schema(description="课程")
public class ExamDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "ID")
    private String id;

    @Schema(description = "考试名称")
    private String title;

    @Schema(description = "考试描述")
    private String content;

    @Schema(description = "1公开2部门3定员")
    private Integer openType;

    @Schema(description = "考试状态")
    private Integer state;

    @Schema(description = "开始时间")
    private Date startTime;

    @Schema(description = "结束时间")
    private Date endTime;

    @Schema(description = "总分数")
    private BigDecimal totalScore;

    @Schema(description = "总时长（分钟）")
    private Integer totalTime;

    @Schema(description = "及格分数")
    private BigDecimal qualifyScore;

    @Schema(description = "考试机会")
    private Integer chance;

    @Schema(description = "最低交卷分钟")
    private Integer handMin;

    @Schema(description = "允许迟到分钟")
    private Integer lateMax;

    @Schema(description = "感谢文字")
    private String thanks;

    @Schema(description = "组卷题库ID")
    private String repoId;

    @Schema(description = "创建时间")
    private Date createTime;

    @Schema(description = "更新时间")
    private Date updateTime;

    @Schema(description = "创建人")
    private String createBy;

    @Schema(description = "修改人")
    private String updateBy;
    
}
