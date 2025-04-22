package com.yf.base.utils.passwd;


import com.yf.base.utils.file.MD5Util;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.RandomStringUtils;

/**
 * 通用的密码处理类，用于生成密码和校验密码
 * ClassName: PassGenerator <br/>
 * date: 2017年12月13日 下午7:13:03 <br/>
 *
 * @author Bool
 */
@Log4j2
public class PassHandler {

    /**
     * checkPass:校验密码是否一致
     *
     * @param inputPass 用户传入的密码
     * @param salt      数据库保存的密码随机码
     * @param pass      数据库保存的密码MD5
     * @return
     * @author Bool
     */
    public static boolean checkPass(String inputPass, String salt, String pass) {
        String pwdMd5 = MD5Util.MD5(inputPass);
        return MD5Util.MD5(pwdMd5 + salt).equals(pass);
    }


    /**
     * buildPassword:用于用户注册时产生一个密码
     *
     * @param inputPass 输入的密码
     * @return PassInfo 返回一个密码对象，记得保存
     * @author Bool
     */
    public static PassInfo buildPassword(String inputPass) {

        //产生一个6位数的随机码
        String salt = RandomStringUtils.randomAlphabetic(6);
        //加密后的密码
        String encryptPassword = MD5Util.MD5(MD5Util.MD5(inputPass) + salt);
        //返回对象
        return new PassInfo(salt, encryptPassword);
    }


    public static void main(String[] args) {
        PassInfo pa = buildPassword("4RK#nxUp1yu981Rx");
        log.info("UPDATE sys_user SET `password`='" + pa.getPassword() + "',salt='" + pa.getSalt() + "',data_flag=0 WHERE user_name='admin';");

        PassInfo ps = buildPassword("RzQ#zSb*MFX89bCP");
        log.info("UPDATE sys_user SET `password`='" + ps.getPassword() + "',salt='" + ps.getSalt() + "',data_flag=0 WHERE user_name='student';");
    }
}
