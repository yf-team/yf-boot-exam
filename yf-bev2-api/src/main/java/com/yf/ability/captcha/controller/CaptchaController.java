package com.yf.ability.captcha.controller;

import com.yf.ability.captcha.TransparentCaptcha;
import com.yf.ability.captcha.service.CaptchaService;
import com.yf.base.api.api.controller.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.util.UUID;


/**
 * <p>
 * 图形验证码生成
 * </p>
 *
 * @author 聪明笨狗
 * @since 2019-04-16 10:14
 */
@Log4j2
@Tag(name = "验证码生成类")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/common/captcha")
public class CaptchaController extends BaseController {

    private final CaptchaService captchaService;

    @RequestMapping(value = "/gen", method = RequestMethod.GET)
    @Operation(summary = "验证码图片")
    @Parameters({
            @Parameter(name = "key", description = "验证码ID,前端自行使用UUID生成，务必确保整个系统不重复",
                    example = "873d327b-00a1-441c-8509-fd51233654dc",
                    required = true)
    })
    public void captcha(HttpServletResponse response, @RequestParam("key") String key) throws Exception {

        // 设置请求头为输出图片类型
        response.setContentType("image/png");
        response.setHeader("Cache-Control", "no-store");

        TransparentCaptcha captcha = new TransparentCaptcha(130, 48, 4, 20);
        String code = captcha.getCode();
        BufferedImage image = (BufferedImage) captcha.createImage(code);
        ImageIO.write(image, "png", response.getOutputStream());

        // 存入REDIS
        captchaService.saveCaptcha(key, code.toLowerCase());

    }

    public static void main(String[] args) {
        log.info(UUID.randomUUID());
    }

}
