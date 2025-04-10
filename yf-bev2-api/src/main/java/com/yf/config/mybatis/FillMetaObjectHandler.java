package com.yf.web.aspect.mybatis;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.yf.system.modules.user.UserUtils;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Objects;
import java.util.function.Supplier;

/**
 * 自动填充方法
 */
@Log4j2
@Component
public class FillMetaObjectHandler implements MetaObjectHandler {


    /**
     * 创建时间
     */
    private static final String CREATE_TIME = "createTime";
    /**
     * 更新时间
     */
    private static final String UPDATE_TIME = "updateTime";

    /**
     * 创建人
     */
    private static final String CREATE_BY = "createBy";

    /**
     * 修改人
     */
    private static final String UPDATE_BY = "updateBy";

    /**
     * 归属部门
     */
    private static final String DEPT_CODE = "deptCode";

    /**
     * 重写不管原值是否为null，都进行填充
     * @param metaObject
     * @param fieldName
     * @param fieldVal
     * @return
     */
    @Override
    public MetaObjectHandler strictFillStrategy(MetaObject metaObject, String fieldName, Supplier<?> fieldVal) {
        Object obj = fieldVal.get();
        if (Objects.nonNull(obj)) {
            metaObject.setValue(fieldName, obj);
        }
        return this;
    }

    @Override
    public void insertFill(MetaObject metaObject) {
        this.strictInsertFill(metaObject, CREATE_BY, String.class, userId());
        this.strictInsertFill(metaObject, CREATE_TIME, Date.class, new Date());
        this.strictInsertFill(metaObject, DEPT_CODE, String.class, UserUtils.departCode());
        this.strictInsertFill(metaObject, UPDATE_BY, String.class, userId());
        this.strictInsertFill(metaObject, UPDATE_TIME, Date.class, new Date());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.strictUpdateFill(metaObject, UPDATE_BY, String.class, userId());
        this.strictUpdateFill(metaObject, UPDATE_TIME, Date.class, new Date());
    }

    /**
     * 获得用户ID
     * @return
     */
    private String userId(){
        String userId = UserUtils.getUserId(false);
        if(userId == null){
            return "";
        }
        return userId;
    }
}
