package com.yf.base.api.api.dto;

import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 分页查询类
 * @param <T>
 * @author bool
 */
@Schema(name="分页参数", description="分页参数")
@Data
public class PagingReqDTO<T> {


   @Schema(description = "当前页码", required = true, example = "1")
    private Integer current;

   @Schema(description = "每页数量", required = true, example = "10")
    private Integer size;

   @Schema(description = "查询参数")
    private T params;

   @Schema(description = "排序方式")
    private List<OrderItem> orders;

    @JsonIgnore
   @Schema(description = "当前用户的ID")
    private String userId;

    /**
     * 转换成MyBatis的简单分页对象
     * @return
     */
    public Page toPage(){
        Page page = new Page();
        page.setCurrent(this.current);
        page.setSize(this.size);
        page.setOrders(orders);
        return page;
    }


}
