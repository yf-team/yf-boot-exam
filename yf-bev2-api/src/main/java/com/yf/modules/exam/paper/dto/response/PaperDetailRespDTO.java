package com.yf.modules.exam.paper.dto.response;

import com.yf.modules.exam.paper.dto.PaperDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.util.List;

/**
 * 考试试卷详情
 *
 * @author 聪明笨狗
 * @since 2025-04-11 09:42
 */
@Data
@Schema(description = "考试试卷详情")
public class PaperDetailRespDTO extends PaperDTO {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "选项列表")
    private List<PaperQuDetailDTO> quList;

}
