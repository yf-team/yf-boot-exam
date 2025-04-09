package com.yf.ability.captcha.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 图形验证码校验请求类
 * @author bool
 * @date 2020-02-21 10:18
 */
@Data
@Schema(name="图形验证码校验请求类", description="图形验证码校验请求类")
public class CheckCaptchaReqDTO implements Serializable {

    /**
     * 验证码键
     */
   @Schema(description = "前端产生的验证码键")
    private String captchaKey;

    /**
     * 用户输入的验证码
     */
   @Schema(description = "用户输入的验证码")
    private String captchaValue;
}
