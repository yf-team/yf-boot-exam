package com.yf.modules.exam.exam.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.util.Date;

/**
* <p>
* 课程实体类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:29
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("el_exam")
public class Exam extends Model<Exam> {

    @Serial
    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 考试名称
    */
    private String title;
    
    /**
    * 考试描述
    */
    private String content;
    
    /**
    * 1公开2部门3定员
    */
    @TableField("open_type")
    private Integer openType;
    
    /**
    * 口令密码
    */
    private String password;
    
    /**
    * 考试状态
    */
    private Integer state;
    
    /**
    * 开始时间
    */
    @TableField("start_time")
    private Date startTime;
    
    /**
    * 结束时间
    */
    @TableField("end_time")
    private Date endTime;
    
    /**
    * 总分数
    */
    @TableField("total_score")
    private BigDecimal totalScore;
    
    /**
    * 总时长（分钟）
    */
    @TableField("total_time")
    private Integer totalTime;
    
    /**
    * 及格分数
    */
    @TableField("qualify_score")
    private BigDecimal qualifyScore;
    
    /**
    * 考试机会
    */
    private Integer chance;
    
    /**
    * 最低交卷分钟
    */
    @TableField("hand_min")
    private Integer handMin;
    
    /**
    * 允许迟到分钟
    */
    @TableField("late_max")
    private Integer lateMax;
    
    /**
    * 感谢文字
    */
    private String thanks;
    
    /**
    * 结果类型,1感谢文字,2感谢文字+成绩,3试卷明细
    */
    @TableField("result_type")
    private Integer resultType;
    
    /**
    * 显示时机：1立即显示,2考试结束后显示,3阅卷后显示
    */
    @TableField("result_oppty")
    private Integer resultOppty;
    
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
