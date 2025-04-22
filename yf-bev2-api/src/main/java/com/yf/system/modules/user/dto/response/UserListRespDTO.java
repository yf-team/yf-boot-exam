package com.yf.system.modules.user.dto.response;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author bool
 */
@Data
@Schema(name = "用户列表响应类", description = "用户列表响应类")
public class UserListRespDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    private String id;

    @Schema(description = "用户名")
    private String userName;

    @Schema(description = "头像")
    private String avatar;

    @Schema(description = "真实姓名")
    private String realName;

    @Dict(dictTable = "el_sys_depart", dicCode = "dept_code", dicText = "dept_name")
    @Schema(description = "部门编码")
    private String deptCode;

    @Dict(dicCode = "user_state")
    @Schema(description = "状态")
    private Integer state;

    @Schema(description = "身份证号码")
    private String idCard;

    @Schema(description = "手机号")
    private String mobile;

    @Schema(description = "邮箱")
    private String email;

    @Schema(description = "创建时间")
    private Date createTime;

    @Schema(description = "更新时间")
    private Date updateTime;

    @Schema(description = "角色名称列表")
    private String roleNames;
}
