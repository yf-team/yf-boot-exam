package com.yf.plugins.upload.local.dto;


import com.yf.base.api.api.dto.BaseDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传请求类
 * @author
 * @date 2019-12-26 17:54
 */
@Data
@Schema(name="文件上传参数", description="文件上传参数")
public class UploadReqDTO extends BaseDTO {

   @Schema(description = "上传文件内容", required=true)
    private MultipartFile file;

}
