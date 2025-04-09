package com.yf.system.modules.user.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author bool
 */
@Data
@Schema(name="用户角色批量操作请求类", description="用户角色批量操作请求类")
public class UserRoleReqDTO implements Serializable {

   @Schema(description = "用户列表")
    private List<String> userIds;

   @Schema(description = "角色列表")
    private List<String> roleIds;

   @Schema(description = "操作1增加，0移除")
    private Integer flag;
}
