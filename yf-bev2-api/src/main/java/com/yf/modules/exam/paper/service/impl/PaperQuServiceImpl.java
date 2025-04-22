package com.yf.modules.exam.paper.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.base.api.exception.ServiceException;
import com.yf.base.utils.AbcTags;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.DecimalUtils;
import com.yf.modules.exam.paper.dto.response.PaperQuCardItemRespDTO;
import com.yf.modules.exam.paper.dto.response.PaperQuCardRespDTO;
import com.yf.modules.exam.paper.dto.response.PaperQuDetailDTO;
import com.yf.modules.exam.paper.dto.response.PaperQuFillRespDTO;
import com.yf.modules.exam.paper.dto.request.PaperQuFillReqDTO;
import com.yf.modules.exam.paper.entity.PaperQu;
import com.yf.modules.exam.paper.entity.PaperQuAnswer;
import com.yf.modules.exam.paper.mapper.PaperQuMapper;
import com.yf.modules.exam.paper.service.PaperQuAnswerService;
import com.yf.modules.exam.paper.service.PaperQuService;
import com.yf.modules.exam.repo.dto.RepoQuAnswerDTO;
import com.yf.modules.exam.repo.dto.request.RepoQuDetailDTO;
import com.yf.modules.exam.repo.service.RepoQuService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * <p>
 * 试卷考题业务实现类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@RequiredArgsConstructor
@Service
public class PaperQuServiceImpl extends ServiceImpl<PaperQuMapper, PaperQu> implements PaperQuService {

    private final PaperQuAnswerService paperQuAnswerService;
    private final RepoQuService repoQuService;


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveToPaper(String paperId, BigDecimal perScore, List<RepoQuDetailDTO> quList) {

        List<PaperQu> paperQuList = new ArrayList<>();
        List<PaperQuAnswer> answerList = new ArrayList<>();

        for (RepoQuDetailDTO dto : quList) {
            PaperQu entity = new PaperQu();
            entity.setPaperId(paperId);
            entity.setQuType(dto.getQuType());
            entity.setActualScore(DecimalUtils.zero());
            entity.setScore(perScore);
            entity.setQuId(dto.getId());
            entity.setAnswered(false);
            paperQuList.add(entity);

            List<RepoQuAnswerDTO> answers = dto.getAnswerList();

            int i = 0;
            for (RepoQuAnswerDTO answer : answers) {
                PaperQuAnswer ae = new PaperQuAnswer();
                ae.setPaperId(paperId);
                ae.setQuId(dto.getId());
                ae.setAnswerId(answer.getId());
                ae.setChecked(false);
                ae.setIsRight(answer.getIsRight());
                ae.setAbc(AbcTags.get(i));
                ae.setSort(i);
                answerList.add(ae);
                i++;
            }
        }

        // 保存题目
        saveBatch(paperQuList);

        // 保存选项
        paperQuAnswerService.saveBatch(answerList);

    }

    @Override
    public List<PaperQuCardRespDTO> listQuCard(String paperId) {


        //查找全部题目
        QueryWrapper<PaperQu> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .select(PaperQu::getQuId, PaperQu::getQuType, PaperQu::getAnswered, PaperQu::getMark)
                .eq(PaperQu::getPaperId, paperId)
                .orderByAsc(PaperQu::getScore);
        List<PaperQu> paperQuList = this.list(wrapper);

        // 使用程序转换成题型分组Map
        Map<String, List<PaperQuCardItemRespDTO>> map = new HashMap<>();
        for (PaperQu paperQu : paperQuList) {
            String key = paperQu.getQuType();

            // 复制属性
            PaperQuCardItemRespDTO item = new PaperQuCardItemRespDTO();
            BeanMapper.copy(paperQu, item);

            if (map.containsKey(key)) {
                map.get(key).add(item);
            } else {
                List<PaperQuCardItemRespDTO> list = new ArrayList<>();
                list.add(item);
                map.put(key, list);
            }
        }

        // 转换为列表并返回
        List<PaperQuCardRespDTO> dtoList = new ArrayList<>();
        for (Map.Entry<String, List<PaperQuCardItemRespDTO>> entry : map.entrySet()) {
            PaperQuCardRespDTO dto = new PaperQuCardRespDTO();
            dto.setQuType(entry.getKey());
            dto.setItemList(entry.getValue());
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public PaperQuDetailDTO detailForAnswer(String paperId, String quId) {
        return baseMapper.detailForAnswer(paperId, quId);
    }

    @Override
    public PaperQuFillRespDTO fillAnswer(PaperQuFillReqDTO reqDTO) {

        // 参数
        String paperId = reqDTO.getPaperId();
        String quId = reqDTO.getQuId();
        List<String> checkedItems = reqDTO.getCheckedItems();

        //查找全部题目
        QueryWrapper<PaperQu> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .select(PaperQu::getId, PaperQu::getQuId, PaperQu::getQuType, PaperQu::getScore)
                .eq(PaperQu::getPaperId, paperId)
                .eq(PaperQu::getQuId, quId);

        PaperQu paperQu = this.getOne(wrapper, false);
        if (paperQu == null) {
            throw new ServiceException("答题错误，题目不存在！");
        }

        // 标准答案列表
        List<PaperQuAnswer> answerList = paperQuAnswerService.listForAnswer(paperId, quId);
        List<String> rightList = new ArrayList<>();

        // 正确列表
        for (PaperQuAnswer answer : answerList) {
            if (answer.getIsRight() != null && answer.getIsRight()) {
                rightList.add(answer.getAnswerId());
            }

            // 是否勾选
            answer.setChecked(checkedItems.contains(answer.getAnswerId()));
        }

        // 判断是否正确
        boolean isRight = areListsEqualIgnoreOrder(rightList, checkedItems);

        // 进行保存操作
        paperQuAnswerService.updateBatchById(answerList);

        // 更新结果
        paperQu.setIsRight(isRight);
        paperQu.setActualScore(isRight ? paperQu.getScore() : BigDecimal.ZERO);
        paperQu.setAnswered(CollectionUtils.isNotEmpty(checkedItems));
        this.updateById(paperQu);


        PaperQuFillRespDTO respDTO = new PaperQuFillRespDTO();
        respDTO.setFilled(paperQu.getAnswered());
        return respDTO;
    }

    @Override
    public BigDecimal sumTotalScore(String paperId) {
        return baseMapper.sumTotalScore(paperId);
    }

    /**
     * 两个List比较
     *
     * @param list1
     * @param list2
     * @return
     */
    private static boolean areListsEqualIgnoreOrder(List<String> list1, List<String> list2) {

        // 快速校验
        if (Objects.equals(list1, list2)) {
            return true;
        }  // 包括都为null的情况
        if (list1 == null || list2 == null) {
            return false;
        }
        if (list1.size() != list2.size()) {
            return false;
        }

        // 直接转换为 HashSet 比较
        return new HashSet<>(list1).equals(new HashSet<>(list2));
    }
}
