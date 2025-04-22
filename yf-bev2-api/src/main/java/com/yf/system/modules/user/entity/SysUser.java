package com.yf.system.modules.user.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.util.Date;

/**
 * <p>
 * 管理用户实体类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-04-13 16:57
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("el_sys_user")
public class SysUser extends Model<SysUser> {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 用户名
     */
    @TableField("user_name")
    private String userName;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 真实姓名
     */
    @TableField("real_name")
    private String realName;

    /**
     * 密码
     */
    private String password;

    /**
     * 密码盐
     */
    private String salt;

    /**
     * 状态
     */
    private Integer state;

    /**
     * 身份证号码
     */
    @TableField("id_card")
    private String idCard;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 部门编码
     */
    @TableField("dept_code")
    private String deptCode;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 创建人
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private Date updateTime;

    /**
     * 修改人
     */
    @TableField(value = "update_by", fill = FieldFill.UPDATE)
    private String updateBy;

}
