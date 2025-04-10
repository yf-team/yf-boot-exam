package com.yf.ability.captcha;

import cn.hutool.captcha.CircleCaptcha;
import cn.hutool.captcha.generator.RandomGenerator;
import cn.hutool.core.img.GraphicsUtil;
import cn.hutool.core.img.ImgUtil;
import cn.hutool.core.util.RandomUtil;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.concurrent.ThreadLocalRandom;

/**
 * 改写验证码，实现透明效果
 * @author 18365
 * @since 2025-04-10
 */
public class TransparentCaptcha extends CircleCaptcha {

    public TransparentCaptcha(int width, int height, int codeCount, int interfereCount) {
        super(width, height, codeCount, interfereCount);
        // 使用随机字符生成器
        this.generator = new RandomGenerator("0123456789", codeCount);
    }

    @Override
    public Image createImage(String code) {
        // 创建透明背景图片
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = image.createGraphics();

        // 设置透明背景
        g.setComposite(AlphaComposite.Clear);
        g.fillRect(0, 0, width, height);
        g.setComposite(AlphaComposite.Src);

        // 绘制干扰元素
        drawInterfere(g);

        // 绘制验证码
        drawString(g, code);

        g.dispose();
        return image;
    }

    private void drawInterfere(Graphics2D g) {
        ThreadLocalRandom random = RandomUtil.getRandom();

        for(int i = 0; i < this.interfereCount; ++i) {
            g.setColor(ImgUtil.randomColor(random));
            g.drawOval(random.nextInt(this.width), random.nextInt(this.height), random.nextInt(this.height >> 1), random.nextInt(this.height >> 1));
        }
    }


    private void drawString(Graphics2D g, String code) {
        if (null != this.textAlpha) {
            g.setComposite(this.textAlpha);
        }

        GraphicsUtil.drawStringColourful(g, code, this.font, this.width, this.height);
    }
}

