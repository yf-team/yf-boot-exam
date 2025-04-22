package com.yf.modules.exam.exam.dto.request;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.yf.base.utils.jackson.NumericBooleanDeserializer;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 考试记录查询请求类
 * </p>
 *
 * @author 沉醉寒风
 * @since 2025-04-17 14:59
 */
@Data
@Schema(name = "考试记录查询请求类", description = "前后端通用的")
public class ExamRecordListReqDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "考试名称")
    private String title;

    @JsonDeserialize(using = NumericBooleanDeserializer.class)
    @Schema(description = "是否通过")
    private Boolean passed;

    @Schema(description = "考生姓名")
    private String userName;

    @Schema(description = "考生ID")
    private String userId;

    @Schema(description = "最低分数")
    private BigDecimal scoreMin;

    @Schema(description = "最高分数")
    private BigDecimal scoreMax;

}
