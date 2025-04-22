package com.yf.modules.exam.exam.dto.response;

import com.yf.modules.exam.exam.dto.ExamDTO;
import com.yf.modules.exam.exam.dto.ExamRuleDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.util.List;

/**
 * <p>
 * 考试数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:29
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "考试详情类")
public class ExamDetailDTO extends ExamDTO {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "组卷规则列表")
    private List<ExamRuleDTO> ruleList;


}
