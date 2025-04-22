package com.yf.system.modules.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 登录绑定数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2021-08-02 14:49
 */
@Data
@Schema(name = "登录绑定", description = "登录绑定")
public class SysUserBindDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "ID")
    private String id;

    @Schema(description = "用户ID")
    private String userId;

    @Schema(description = "登录类型")
    private String loginType;

    @Schema(description = "三方ID")
    private String openId;

    @Schema(description = "创建时间")
    private Date createTime;

    @Schema(description = "更新时间")
    private Date updateTime;

}
