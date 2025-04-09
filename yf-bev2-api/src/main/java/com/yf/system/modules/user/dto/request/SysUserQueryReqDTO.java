package com.yf.system.modules.user.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
* <p>
* 用户搜索请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-04-13 16:57
*/
@Data
@Schema(name="用户搜索请求类", description="用户搜索请求类")
public class SysUserQueryReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "角色ID", required=true)
    private List<String> roleIds;

   @Schema(description = "用户名", required=true)
    private String userName;

   @Schema(description = "机构编码", required=true)
    private String deptCode;

   @Schema(description = "排除列表", required=true)
    private List<String> excludes;

   @Schema(description = "状态", required=true)
    private Integer state;

   @Schema(description = "手机号码", required=true)
    private String mobile;

}
