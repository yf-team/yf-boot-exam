package com.yf.base.api.exception;

//import com.mysql.cj.jdbc.exceptions.MysqlDataTruncation;

import com.yf.base.api.api.ApiRest;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLDataException;
import java.text.MessageFormat;
import java.util.regex.Matcher;

import static java.util.regex.Pattern.compile;

/**
 * 统一异常处理类
 * @author bool
 * @date 2019-06-21 19:27
 */
@Log4j2
@RestControllerAdvice
public class ServiceExceptionHandler {

    /**
     * 应用到所有@RequestMapping注解方法，在其执行之前初始化数据绑定器
     * @param binder
     */
    @InitBinder
    public void initWebBinder(WebDataBinder binder){

    }

    /**
     * 把值绑定到Model中，使全局@RequestMapping可以获取到该值
     * @param model
     */
    @ModelAttribute
    public void addAttribute(Model model) {

    }

    /**
     * 捕获ServiceException
     * @param e
     * @return
     */
    @ExceptionHandler({ServiceException.class})
    @ResponseStatus(HttpStatus.OK)
    public ApiRest<?> serviceExceptionHandler(ServiceException e) {
        log.error(e);
        return new ApiRest(e);
    }


    /**
     * Shiro异常
     * @param e
     * @return
     */
    @ExceptionHandler({AuthorizationException.class})
    @ResponseStatus(HttpStatus.OK)
    public ApiRest<?> shiroExceptionHandler(AuthorizationException e) {
        log.error(e);
        ApiRest rest = new ApiRest();
        rest.setMsg("您无权执行此操作，请联系管理员！");
        rest.setCode(-1);
        return rest;
    }


    /**
     * 处理数据校验返回
     * @param e
     * @return
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.OK)
    public ApiRest<?> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        log.error(e);
        ApiRest apiRest = new ApiRest();
        apiRest.setCode(1);
        apiRest.setMsg(e.getBindingResult().getFieldError().getDefaultMessage());
        return apiRest;
    }


    /**
     * 处理数据校验返回
     * @param e
     * @return
     */
    @ExceptionHandler(SQLDataException.class)
    @ResponseStatus(HttpStatus.OK)
    public ApiRest<?> handleMysqlDataTruncation(SQLDataException e) {


        log.error(e);

        ApiRest apiRest = new ApiRest();
        apiRest.setCode(1);
        String msg = e.getMessage();

        // 长度超限提示优化
        Matcher m = compile("Data too long for column '(.*?)' at row").matcher(msg);
        while (m.find()){
            msg = MessageFormat.format("字段`{0}`超出长度限制！", m.group(1));
        }

        apiRest.setMsg(msg);
        return apiRest;
    }


    /**
     * 处理数据校验返回
     * @param e
     * @return
     */
    @ExceptionHandler(NoSuchBeanDefinitionException.class)
    @ResponseStatus(HttpStatus.OK)
    public ApiRest<?> handleNoSuchBeanDefinitionException(NoSuchBeanDefinitionException e) {
        log.error(e);
        ApiRest apiRest = new ApiRest();
        apiRest.setCode(1);
        apiRest.setMsg(e.getMessage());
        return apiRest;
    }

}
