package com.yf.system.modules.dict.dto.ext;

import com.yf.system.modules.dict.dto.SysDicValueDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.util.List;

/**
* <p>
* 分类字典值数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2020-12-01 14:00
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(name="分类字典值", description="分类字典值")
public class DicValueTreeDTO extends SysDicValueDTO {

    @Serial
    private static final long serialVersionUID = 1L;

   @Schema(description = "子类列表")
    private List<DicValueTreeDTO> children;

}
