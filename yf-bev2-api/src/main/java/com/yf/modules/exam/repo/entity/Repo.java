package com.yf.mudules.exam.repo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import java.util.Date;

/**
* <p>
* 题库实体类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Data
@TableName("el_repo")
public class Repo extends Model<Repo> {

    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 题库名称
    */
    private String title;
    
    /**
    * 分类ID
    */
    @TableField("cat_id")
    private String catId;
    
    /**
    * 题库备注
    */
    private String remark;
    
    /**
    * 创建时间
    */
    @TableField("create_time")
    private Date createTime;
    
    /**
    * 更新时间
    */
    @TableField("update_time")
    private Date updateTime;
    
    /**
    * 创建人
    */
    @TableField("create_by")
    private String createBy;
    
    /**
    * 修改人
    */
    @TableField("update_by")
    private String updateBy;
    
}
