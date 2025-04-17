<template>
  <el-row :gutter="20">
    <el-col :span="24">
      <el-card style="display: flex; justify-content: flex-end">
        <el-button type="primary" @click="handPaper" size="large" icon="Select">交卷</el-button>
      </el-card>
    </el-col>
    <el-col :span="6">
      <el-card style="height: 70vh">
        <div v-for="(item, i) in cardList" :key="i">
          <h3>{{ item.quType_dictText }}</h3>
          <el-tag
            :class="{ 'ml-2': i2 > 0 }"
            size="large"
            v-for="(quId, i2) in item.quIdList"
            :key="i2"
            @click="quDetail(quId)"
            >{{ i2 + 1 }}</el-tag
          >
        </div>
      </el-card>
    </el-col>
    <el-col :span="18">
      <el-card style="height: 70vh">
        <h3> {{ detail.quType_dictText }}</h3>
        <div v-html="detail.content"></div>
        <div>
          <div
            v-for="item in detail.answerList"
            :key="item.id"
            class="answer-item"
            :class="{ checked: item.checked }"
            @click="itemClick(item)"
          >
            <div v-if="detail.quType === 'multi' || detail.quType === 'multi2'">
              <el-checkbox size="large" v-model="item.checked" />
            </div>
            <div v-if="detail.quType === 'radio' || detail.quType === 'judge'">
              <el-radio
                size="large"
                :label="item.answerId"
                :value="item.checked ? item.answerId : ''"
              />
            </div>
            <div>
              {{ item.content }}
            </div>
          </div>
        </div>
      </el-card>
    </el-col>
  </el-row>
</template>

<script lang="ts" setup>
import { onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { quCardApi, quDetailApi, handApi, fillAnswerApi } from '@/api/modules/exam/paper'
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

const itemClick = (item) => {
  item.checked = !item.checked

  // 单选排他
  if (detail.value.quType === 'radio' || detail.value === 'judge') {
    for (const qu of detail.value.answerList) {
      if (item.id !== qu.id) {
        qu.checked = false
      }
    }
  }

  // 直接触发保存
  saveAnswer()
}

const saveAnswer = () => {
  const checkedItems = []
  for (const item of detail.value.answerList) {
    if (item.checked) {
      checkedItems.push(item.id)
    }
  }

  fillAnswerApi({ paperId: paperId, quId: detail.value.id, checkedItems: checkedItems }).then(
    () => {
      console.log('保存成功')
    }
  )

  console.log(checkedItems)
}

// 查找详情
onMounted(() => {
  listCard()
})
</script>

<style scoped>
.el-col {
  margin-bottom: 20px;
}

.answer-item {
  border-radius: 5px;
  border: #ddd 1px solid;
  margin-bottom: 10px;
  padding: 5px 10px;
  display: flex;
  align-items: center;
  cursor: pointer;
}

.checked {
  border: #2d8cf0 2px solid !important;
}
</style>
