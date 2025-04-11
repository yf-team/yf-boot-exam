package com.yf.modules.exam.repo.dto;

import com.yf.base.api.annon.Dict;
import com.yf.base.utils.HtmlUtils;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 问题题目数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Data
@Schema(description="问题题目")
public class RepoQuDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "ID")
    private String id;

    @Dict(dictTable = "el_repo", dicText = "title", dicCode = "id")
    @Schema(description = "所属题库")
    private String repoId;
    
    @Schema(description = "所属章节")
    private String chapterId;

    @Dict(dicCode = "qu_type")
    @Schema(description = "题目类型")
    private String quType;

    @Dict(dicCode = "qu_difficulty_level")
    @Schema(description = "难度等级")
    private String difficultyLevel;
    
    @Schema(description = "题目内容")
    private String content;
    
    @Schema(description = "整题解析")
    private String analysis;
    
    @Schema(description = "创建时间")
    private Date createTime;
    
    @Schema(description = "更新时间")
    private Date updateTime;

    @Dict(dictTable = "el_sys_user", dicText = "real_name", dicCode = "id")
    @Schema(description = "创建人")
    private String createBy;

    @Dict(dictTable = "el_sys_user", dicText = "real_name", dicCode = "id")
    @Schema(description = "修改人")
    private String updateBy;

    /**
     * 获取题干文本
     * @return
     */
    public String getContentText(){
        return HtmlUtils.splitAndFilterString(content, 200);
    }
    
}
