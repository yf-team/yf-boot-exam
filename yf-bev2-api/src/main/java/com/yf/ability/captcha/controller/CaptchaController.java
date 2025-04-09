package com.yf.ability.captcha.controller;

import com.wf.captcha.SpecCaptcha;
import com.yf.ability.captcha.service.CaptchaService;
import com.yf.base.api.api.controller.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;


/**
 * <p>
 * 图形验证码生成
 * </p>
 *
 * @author 聪明笨狗
 *
 * @since 2019-04-16 10:14
 */
@Log4j2
@Tag(name = "验证码生成类")
@RestController
@RequestMapping("/api/common/captcha")
public class CaptchaController extends BaseController {

    @Autowired
    private CaptchaService captchaService;


    @RequestMapping(value="/gen", method = RequestMethod.GET)
    @Operation(summary = "验证码图片")
    @Parameters({
            @Parameter(name = "key", description = "验证码ID,前端自行使用UUID生成，务必确保整个系统不重复",
                    example = "873d327b-00a1-441c-8509-fd51233654dc",
                    required = true)
    })
    public void captcha(HttpServletResponse response, @RequestParam("key") String key) throws Exception {

        // 设置请求头为输出图片类型
        response.setContentType("image/gif");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // 算术类型
        SpecCaptcha captcha = new SpecCaptcha(130, 48);
        // 几位数运算，默认是两位
        captcha.setLen(4);

        // 输出图片流
        ServletOutputStream os = null;
        try {
            os = response.getOutputStream();
            captcha.out(os);
        }finally {
            os.close();
        }

        // 存入REDIS
        captchaService.saveCaptcha(key, captcha.text().toLowerCase());

    }

    public static void main(String[] args) {
        log.info(UUID.randomUUID());
    }

}
