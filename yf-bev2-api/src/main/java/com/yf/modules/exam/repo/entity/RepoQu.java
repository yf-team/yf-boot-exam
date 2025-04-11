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
* 问题题目实体类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Data
@TableName("el_repo_qu")
public class RepoQu extends Model<RepoQu> {

    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 所属题库
    */
    @TableField("repo_id")
    private String repoId;
    
    /**
    * 所属章节
    */
    @TableField("chapter_id")
    private String chapterId;
    
    /**
    * 题目类型
    */
    @TableField("qu_type")
    private String quType;
    
    /**
    * 难度等级
    */
    @TableField("difficulty_level")
    private String difficultyLevel;
    
    /**
    * 题目内容
    */
    private String content;
    
    /**
    * 整题解析
    */
    private String analysis;
    
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
