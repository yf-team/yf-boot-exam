<template>
  <ContentWrap> 考试结果，几分这是？ </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { quCardApi, quDetailApi, handApi } from '@/api/modules/exam/paper'
import { QuCardType } from '@/views/Exam/Exam/types'

const { push } = useRouter()

const route = useRoute()
const paperId = route.query.id

const detail = ref({})
let cardList = ref<QuCardType>()

// 查找答题卡
const listCard = () => {
  quCardApi({ id: paperId }).then((res) => {
    cardList.value = res.data
    // 加载第一个题目
    loadFirst()
  })
}

// 查找详情
const quDetail = (id: string) => {
  quDetailApi({ id: id }).then((res) => {
    detail.value = res.data
  })
}

// 显示首个题目
const loadFirst = () => {
  quDetail(cardList.value[0].quIdList[0])
}

// 显示首个题目
const handPaper = () => {
  handApi({ id: paperId }).then(() => {
    push({ name: 'ExamClientResult', query: { id: paperId } })
  })
}

// 查找详情
onMounted(() => {
  listCard()
})
</script>
