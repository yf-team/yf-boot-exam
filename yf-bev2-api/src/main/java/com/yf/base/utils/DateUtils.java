package com.yf.base.utils;

import lombok.extern.log4j.Log4j2;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 日期处理工具类
 * ClassName: DateUtils <br/>
 * date: 2018年12月13日 下午6:34:02 <br/>
 *
 * @author Bool
 */
@Log4j2
public class DateUtils {

    /**
     * calcExpDays:计算某个日期与当前日期相差的天数，如果计算的日期大于现在时间，将返回负数；否则返回正数 <br/>
     *
     * @param userCreateTime
     * @return
     * @author Bool
     * @since JDK 1.6
     */
    public static int calcExpDays(Date userCreateTime) {

        Calendar start = Calendar.getInstance();
        start.setTime(userCreateTime);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        long l = now.getTimeInMillis() - start.getTimeInMillis();
        return (int) (l / (1000 * 60 * 60 * 24));
    }


    /**
     * dateNow:获取当前时间的字符串格式，根据传入的格式化来展示. <br/>
     *
     * @param format 日期格式化
     * @return
     * @author Bool
     */
    public static String dateNow(String format) {
        SimpleDateFormat fmt = new SimpleDateFormat(format);
        Calendar c = new GregorianCalendar();
        return fmt.format(c.getTime());
    }

    /**
     * formatDate:格式化日期，返回指定的格式 <br/>
     *
     * @param time
     * @param format
     * @return
     * @author Bool
     */
    public static String formatDate(Date time, String format) {
        SimpleDateFormat fmt = new SimpleDateFormat(format);
        return fmt.format(time.getTime());
    }


    /**
     * parseDate:将字符串转换成日期，使用：yyyy-MM-dd HH:mm:ss 来格式化
     *
     * @param date
     * @return
     * @author Bool
     */
    public static Date parseDate(String date) {
        return parseDate(date, "yyyy-MM-dd HH:mm:ss");
    }


    /**
     * parseDate:将字符串转换成日期，使用指定格式化来格式化
     *
     * @param date
     * @param pattern
     * @return
     * @author Bool
     */
    public static Date parseDate(String date, String pattern) {

        if (pattern == null) {
            pattern = "yyyy-MM-dd HH:mm:ss";
        }

        SimpleDateFormat fmt = new SimpleDateFormat(pattern);

        try {

            return fmt.parse(date);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;

    }

    /**
     * 获取一天最后时刻，用于当日有效的数据
     *
     * @return
     */
    public static Date endTimeOfDay() {
        Calendar cl = Calendar.getInstance();
        cl.setTimeInMillis(System.currentTimeMillis());
        cl.set(Calendar.HOUR_OF_DAY, 23);
        cl.set(Calendar.MINUTE, 59);
        cl.set(Calendar.SECOND, 59);

        log.info(DateUtils.formatDate(cl.getTime(), "yyyy-MM-dd HH:mm:ss"));

        return cl.getTime();
    }


}
