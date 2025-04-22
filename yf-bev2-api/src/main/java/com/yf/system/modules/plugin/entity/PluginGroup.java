package com.yf.system.modules.plugin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * <p>
 * 插件分组实体类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2022-09-05 10:05
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("pl_plugin_group")
public class PluginGroup extends Model<PluginGroup> {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 分组名称
     */
    private String title;

    /**
     * 独立排斥
     */
    private Boolean single;

}
