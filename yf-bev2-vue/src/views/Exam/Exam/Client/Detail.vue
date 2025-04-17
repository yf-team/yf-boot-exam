<template>
  <ContentWrap>
    {{ detail.title }}
    <el-button type="primary" @click="startExam" :loading="loading">开始考试</el-button>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { detailForExamApi } from '@/api/modules/exam/exam'
import { createApi } from '@/api/modules/exam/paper'

const { push } = useRouter()

const route = useRoute()
const examId = route.query.id
const loading = ref(false)

const detail = ref({})

// 创建考试并进入
const startExam = () => {
  loading.value = true
  createApi({ id: examId }).then((res) => {
    const paperId = res.data.id
    // 进入考试
    push({ name: 'ExamClientEnter', query: { id: paperId } })
    loading.value = false
  })
}

// 查找详情
onMounted(() => {
  detailForExamApi({ id: examId }).then((res) => {
    detail.value = res.data
  })
})
</script>
