package com.yf.modules.exam.repo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
* <p>
* 候选答案实体类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("el_repo_qu_answer")
public class RepoQuAnswer extends Model<RepoQuAnswer> {

    @Serial
    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 问题ID
    */
    @TableField("qu_id")
    private String quId;
    
    /**
    * 是否正确
    */
    @TableField("is_right")
    private Boolean isRight;
    
    /**
    * 答案内容
    */
    private String content;
    
    /**
    * 图片地址
    */
    private String image;
    
    /**
    * ABCD标签
    */
    private String tag;
    
}
