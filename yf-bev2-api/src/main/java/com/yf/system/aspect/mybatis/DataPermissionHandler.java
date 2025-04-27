package com.yf.system.aspect.mybatis;

import com.baomidou.mybatisplus.extension.plugins.handler.MultiDataPermissionHandler;
import com.yf.ability.shiro.dto.SysUserLoginDTO;
import com.yf.base.enums.DataScope;
import lombok.extern.log4j.Log4j2;
import net.sf.jsqlparser.expression.Alias;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.HexValue;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.operators.relational.EqualsTo;
import net.sf.jsqlparser.expression.operators.relational.LikeExpression;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.schema.Table;
import org.apache.shiro.SecurityUtils;

import java.util.List;


/**
 * 数据权限过滤器
 * @author van
 * @since 2024-05-23
 */
@Log4j2
public class DataPermissionHandler implements MultiDataPermissionHandler {

    /**
     * 默认别名
     */
    private static final String DEFAULT_ALIAS = "mtb";

    /**
     * 针对业务场景进行数据权限处理
     * Mapper查询ID::主要过滤的表
     */
    private static final String[] STATEMENTS = new String[]{
            ".RepoMapper.paging::el_repo",
            ".RepoQuMapper.paging::el_repo_qu",
            // 自带paging方法为selectList
            ".RepoQuMapper.selectList::el_repo_qu",
            ".ExamMapper.paging::el_exam",
            ".SysUserMapper.paging::el_sys_user",
    };

    @Override
    public Expression getSqlSegment(Table table, Expression where, String mappedStatementId) {

        String name = table.getName();
        if(this.require(name, mappedStatementId)){
            log.debug("+++++进入进行权限过滤:{} , where: {},mappedStatementId: {}", table, where, mappedStatementId);
            return this.parseWhere(table);
        }

        // 不需要过滤
        return null;
    }

    /**
     * 过滤条件，增加数据权限查询
     * @param table
     * @return
     */
    private Expression parseWhere(Table table) {

        SysUserLoginDTO user = this.currentUser();

        // 如果是学员已经做了业务逻辑处理，不需要处理数据权限
        if(user!=null && justStudent(user)){
            return null;
        }

        // 有别名用别名，无别名用表名，防止字段冲突报错
        Alias alias = table.getAlias();

        // 处理别名
        String aliasName;
        if (alias == null) {
            aliasName = DEFAULT_ALIAS;
            table.setAlias(new Alias(aliasName));
        } else {
            aliasName = alias.getName();
        }

        // 已登录
        if(user!=null) {

            // 自己的数据
            if (DataScope.SCOPE_SELF.equals(user.getDataScope())) {
                EqualsTo usesEqualsTo = new EqualsTo();
                usesEqualsTo.setLeftExpression(new Column(aliasName + ".create_by"));
                usesEqualsTo.setRightExpression(new StringValue(user.getId()));
                return usesEqualsTo;
            }

            // 自己部门的数据
            if (DataScope.SCOPE_DEPT.equals(user.getDataScope())) {
                EqualsTo usesEqualsTo = new EqualsTo();
                usesEqualsTo.setLeftExpression(new Column(aliasName + ".dept_code"));
                usesEqualsTo.setRightExpression(new StringValue(user.getDeptCode()));
                return usesEqualsTo;
            }

            // 自己部门及以下的数据
            if (DataScope.SCOPE_DEPT_DOWN.equals(user.getDataScope())) {
                LikeExpression likeExpression = new LikeExpression();
                likeExpression.setLeftExpression(new Column(aliasName + ".dept_code"));
                likeExpression.setRightExpression(new StringValue(user.getDeptCode() + "%"));
                return likeExpression;
            }

            // 全部数据，不限制
            if (DataScope.SCOPE_ALL.equals(user.getDataScope())) {
                return null;
            }
        }

        // 无权限，构建一个不存在的，不可使用1!=1或者1<>1之类的，会被驱动拦截报错
        return new HexValue(aliasName+".id='0'");
    }


    /**
     * 检验是否需要进行权限过滤
     * @param tableName
     * @param statementId
     * @return
     */
    private boolean require(String tableName, String statementId) {

        // 拼接与定义一致的数据格式
        String exp = statementId+"::"+tableName;

        log.info("++++++++++查询过滤：{}", exp);

        for (String name : STATEMENTS) {
            if (exp.endsWith(name)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取当前登录
     * @return
     */
    private SysUserLoginDTO currentUser() {
        try {
            return SecurityUtils.getSubject().getPrincipal() != null ? (SysUserLoginDTO) SecurityUtils.getSubject().getPrincipal() : null;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 判断是否只是学员用户
     * @param user
     * @return
     */
    private boolean justStudent(SysUserLoginDTO user) {

        List<String> roles = user.getRoles();

        return roles != null &&
                roles.size() == 1 &&
                "student".equals(roles.get(0));
    }
}
