<template>
  <ContentWrap>
    <h2 class="text-center">{{ paperData.title }}</h2>
    <p class="text-center !text-[#666]">{{ paperData.createTime }}</p>

    <el-row :gutter="24" class="!mt-50px">
      <el-col :span="8" class="text-center"> 考生姓名：{{ paperData.userId_dictText }} </el-col>
      <el-col :span="8" class="text-center"> 考试用时：{{ paperData.userTime }}分钟 </el-col>
      <el-col :span="8" class="text-center"> 考试得分：{{ paperData.userScore }} </el-col>
    </el-row>

    <el-card class="!mt-20px">
      <div v-for="item in paperData.quList" :key="item.id" class="qu-content">
        <div class="flex pt-10px pb-10px">
          <div>{{ item.sort }}.</div>
          <div v-html="item.content" class="content-p"></div>
          <div class="score-text">（得分：{{ item.actualScore }}）</div>
        </div>

        <p v-if="item.image != null && item.image != ''">
          <el-image :src="item.image" class="!max-w-full" />
        </p>

        <div v-if="item.quType === 'radio' || item.quType === 'judge' || item.quType === 'multi'">
          <div
            v-for="an in item.answerList"
            :key="an.id"
            :class="['answer-item', { 'is-checked': an.checked, 'is-right': an.isRight }]"
          >
            <div class="answer-row">
              <span>{{ an.abc }}.{{ an.content }}</span>
              <span v-if="an.isRight" class="right-mark"
                ><el-icon><Check /></el-icon
              ></span>
            </div>
            <div v-if="an.image != null && an.image != ''" class="!clear-both">
              <el-image :src="an.image" class="!max-w-full" />
            </div>
          </div>

          <div class="flex justify-between">
            <div class="!text-[#689ef9]">
              <div v-if="!item.answered"> 我的回答：未答 </div>
              <div v-else>
                我的回答：<template v-for="an in item.answerList">
                  <template v-if="an.checked">{{ an.abc }}</template>
                </template>
              </div>
            </div>
            <div :class="{ 'a-wrong': !item.isRight, 'a-right': item.isRight }">
              答题结果：<span v-if="item.isRight">正确</span><span v-else>错误</span>
            </div>
          </div>
        </div>
      </div>
    </el-card>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { ref, watch } from 'vue'
import { paperFullDetailApi } from '@/api/modules/exam/paper'

const props = withDefaults(defineProps<{ paperId?: string }>(), { paperId: '' })

const paperData = ref<any>({ quList: [] })

const paperDetail = (id: string) => {
  paperFullDetailApi({ id }).then((res) => {
    paperData.value = res.data
  })
}

watch(
  () => props.paperId,
  (val) => {
    if (val) {
      paperDetail(val)
    }
  },
  { immediate: true }
)
</script>

<style lang="less" scoped>
.qu-content {
  border-bottom: #eee 1px solid;
  padding-bottom: 10px;
  margin-bottom: 30px;
}

.qu-content div {
  line-height: 24px;
}

.answer-item {
  border: 1px solid #e0e0e0;
  border-radius: 5px;
  padding: 8px 10px;
  margin-bottom: 10px;
}

.answer-item.is-right {
  border-color: #24da70;
}

.answer-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.answer-item.is-checked {
  font-weight: bold;
}

.score-text {
  color: #e6a23c;
  font-weight: bold;
}

.right-mark {
  color: #24da70;
  font-weight: bold;
}

.content-p :deep(p) {
  margin-top: 0;
  margin-bottom: 0;
}

.a-right {
  color: #24da70;
}

.a-wrong {
  color: #ff0000;
}
</style>
