package com.yf.base.utils;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.util.regex.Pattern.CASE_INSENSITIVE;
import static java.util.regex.Pattern.compile;

/**
 * HTML相关工具类
 *
 * @author bool
 */
public class HtmlUtils {

    private static final String HTML_IMG_REGEX = "<img\\s+(?:[^>]*?\\s+)?src=\"([^\"]*)\"";

    /**
     * 正则替换内容
     *
     * @param regx
     * @param input
     * @return
     */
    public static String replaceRegx(String regx, String input) {
        Pattern pattern = compile(regx, CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(input);
        return matcher.replaceAll("");
    }


    /**
     * 去除文本中的HTML标签，并返回指定长度的文字内容
     *
     * @param input  原始字符串
     * @param length 要截取的长度
     * @return 处理后的字符串（无HTML标签，且不超过指定长度，超出部分用"..."表示）
     */
    public static String splitAndFilterString(String input, int length) {
        // 空值检查
        if (StringUtils.isBlank(input) || length <= 0) {
            return "";
        }

        // 预编译正则表达式，提高效率
        final Pattern[] HTML_PATTERNS = {
                Pattern.compile("<script[^>]*?>[\\s\\S]*?</script>", Pattern.CASE_INSENSITIVE),
                Pattern.compile("<style[^>]*?>[\\s\\S]*?</style>", Pattern.CASE_INSENSITIVE),
                Pattern.compile("<[^>]+>", Pattern.CASE_INSENSITIVE)
        };

        // 去除两端空白
        String result = input.trim();

        // 移除HTML标签
        for (Pattern pattern : HTML_PATTERNS) {
            result = pattern.matcher(result).replaceAll("");
        }

        // 替换特殊HTML实体和空白
        result = result.replace("&nbsp;", "")
                .replaceAll("\\s+", "")
                .trim();

        // 处理长度
        if (result.length() > length) {
            result = result.substring(0, length) + "...";
        }

        return result;
    }


    /**
     * 获取第一个图片URL
     *
     * @param html
     * @return
     */
    public static String firstImage(String html) {
        Pattern pattern = Pattern.compile(HTML_IMG_REGEX);
        Matcher matcher = pattern.matcher(html);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return "";
    }

    /**
     * 移除第一个图片标签
     *
     * @param html
     * @return
     */
    public static String removeFirstImage(String html) {
        if (StringUtils.isBlank(html)) {
            return html;
        }
        return html.replaceFirst("<img[^>]+>", "");
    }

    /**
     * 提取HTML的全部
     *
     * @param html
     * @return
     */
    public static List<String> allImage(String html) {
        Pattern pattern = Pattern.compile(HTML_IMG_REGEX);
        Matcher matcher = pattern.matcher(html);
        List<String> list = new ArrayList<>();
        while (matcher.find()) {
            String img = matcher.group(1);
            list.add(img);
        }
        return list;
    }
}
