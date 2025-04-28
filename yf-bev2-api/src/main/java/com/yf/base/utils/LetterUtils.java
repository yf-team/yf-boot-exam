package com.yf.base.utils;

import com.yf.base.api.exception.ServiceException;

/**
 * 根据索引获取ABC
 *
 * @author bool
 */
public class LetterUtils {


    /**
     * 根据索引获得字母
     * @param index
     * @return
     */
    public static String getLetter(int index) {
        if (index < 0 || index >= 26) {
            return "";
        }
        return String.valueOf((char) ('A' + index));
    }

    /**
     * 产生部门编号
     * @param num
     * @return
     */
    public static String genDept(int num) {

        if (num > 2573) {
            throw new ServiceException("每级最大支持2573个部门！");
        }

        // 序列，0-99为A,100-199为B
        int index = num / 99;
        int left = num % 99;
        String tag = LetterUtils.getLetter(index);
        StringBuilder sb = new StringBuilder(tag);
        if (left < 10) {
            sb.append("0");
        }

        sb.append(left);
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(getLetter(0));
        System.out.println(genDept(1000));
    }
}
