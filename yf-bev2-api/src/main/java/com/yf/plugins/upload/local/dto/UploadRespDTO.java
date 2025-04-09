package com.yf.plugins.upload.local.dto;

import com.yf.base.api.api.dto.BaseDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 上传文件结果
 * @author bool
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(name="文件上传响应", description="文件上传响应")
@AllArgsConstructor
@NoArgsConstructor
public class UploadRespDTO extends BaseDTO {

   @Schema(description = "上传后的完整的URL地址")
    private String url;

}
