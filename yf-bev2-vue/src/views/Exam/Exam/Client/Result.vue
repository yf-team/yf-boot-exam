<template>
  <ContentWrap>
    <el-result
      :icon="detail.passed ? 'success' : 'warning'"
      :title="detail.passed ? '恭喜，考试通过了哟！' : '很遗憾，本次考试未及格！'"
    >
      <template #extra>
        <div class="score-show">{{ detail.userScore }}分</div>
        <el-button size="large" type="primary" @click="backExamList">返回考试列表</el-button>
      </template>
    </el-result>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { paperDetailApi } from '@/api/modules/exam/paper'

const { push } = useRouter()

const route = useRoute()
const paperId = route.query.id
const detail = ref({})

// 查找详情
const paperDetail = () => {
  paperDetailApi({ id: paperId }).then((res) => {
    detail.value = res.data
  })
}

// 返回考试列表
const backExamList = () => {
  push({ name: 'ClientExamList' })
}

// 查找详情
onMounted(() => {
  paperDetail()
})
</script>

<style lang="less" scoped>
.score-show {
  font-size: 32px;
  font-weight: bold;
  color: #ff4949;
  padding-bottom: 30px;
}
</style>
