package com.yf.modules.exam.paper.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yf.modules.exam.paper.entity.PaperQu;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

/**
* <p>
* 试卷考题Mapper
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
public interface PaperQuMapper extends BaseMapper<PaperQu> {

    /**
     * 统计总分数
     * @param paperId
     * @return
     */
    BigDecimal sumTotalScore(@Param("paperId") String paperId);
}
