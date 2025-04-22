package com.yf.modules.exam.repo.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.modules.exam.repo.dto.RepoQuAnswerDTO;
import com.yf.modules.exam.repo.entity.RepoQuAnswer;

import java.util.List;

/**
 * <p>
 * 候选答案业务接口类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-11 09:42
 */
public interface RepoQuAnswerService extends IService<RepoQuAnswer> {


    /**
     * 保存全部选项
     *
     * @param quId
     * @param dtoList
     */
    void saveAll(String quId, List<RepoQuAnswerDTO> dtoList);

    /**
     * 查找题目选项列表
     *
     * @param quId
     * @return
     */
    List<RepoQuAnswerDTO> listByQuId(String quId);
}
