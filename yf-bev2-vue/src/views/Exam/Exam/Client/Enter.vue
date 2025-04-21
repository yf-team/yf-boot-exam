<template>
  <el-row :gutter="20">
    <el-col :span="24">
      <el-card>
        <div class="top-opt-box">
          <ExamTimer :paperId="paperId" />

          <el-button icon="Select" size="large" type="primary" @click="handPaper"
            >立即交卷
          </el-button>
        </div>
      </el-card>
    </el-col>
    <el-col :span="4">
      <el-card style="height: 70vh">
        <div v-for="card in cardList" :key="card?.quType">
          <h3>{{ card?.quType_dictText }}</h3>
          <el-tag
            v-for="(item, i) in card?.itemList"
            :key="i"
            :class="{ 'ml-2': i > 0 }"
            :type="tagType(item)"
            class="tag-item"
            size="large"
            @click="quDetail(item.quId)"
            >{{ i + 1 }}
          </el-tag>
        </div>
      </el-card>
    </el-col>
    <el-col :span="20">
      <el-card style="height: 70vh">
        <h3> {{ detail.quType_dictText }}</h3>
        <div v-html="detail.content"></div>
        <div>
          <div
            v-for="item in detail.answerList"
            :key="item.answerId"
            :class="{ checked: item.checked }"
            class="answer-item"
            @click="itemClick(item)"
          >
            <div v-if="detail.quType === 'multi' || detail.quType === 'multi2'">
              <input :checked="item.checked" type="checkbox" />
            </div>
            <div v-if="detail.quType === 'radio' || detail.quType === 'judge'">
              <input :checked="item.checked" type="radio" />
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
import { fillAnswerApi, handApi, quCardApi, quDetailApi } from '@/api/modules/exam/paper'
import { QuCardType } from '@/views/Exam/Exam/types'
import ExamTimer from '@/views/Exam/Exam/Client/components/ExamTimer.vue'

const { push } = useRouter()

const route = useRoute()
const paperId = route.query.id as string
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
const quDetail = (quId: string) => {
  quDetailApi({ paperId: paperId, quId: quId }).then((res) => {
    detail.value = res.data
  })
}

// 显示首个题目
const loadFirst = () => {
  quDetail(cardList.value[0].itemList[0].quId)
}

// 显示首个题目
const handPaper = () => {
  handApi({ id: paperId }).then(() => {
    push({ name: 'ExamClientResult', query: { id: paperId } })
  })
}

const tagType = (item) => {
  if (item.quId === detail.value.quId) {
    return 'danger'
  }
  if (item.answered) {
    return 'primary'
  }
  return 'info'
}

const itemClick = (e) => {
  e.checked = !e.checked
  // 单选排他
  if (detail.value.quType === 'radio' || detail.value === 'judge') {
    for (const a of detail.value.answerList) {
      if (a.answerId !== e.answerId) {
        a.checked = false
      }
    }
  }

  // 直接触发保存
  saveAnswer()
}

const markAnswered = (id: string, answered: boolean) => {
  for (const card of cardList.value) {
    const itemList = card.itemList
    for (const item of itemList) {
      if (item.quId === id) {
        item.answered = answered
      }
    }
  }
}

const saveAnswer = () => {
  const checkedItems = []
  for (const item of detail.value.answerList) {
    if (item.checked) {
      checkedItems.push(item.answerId)
    }
  }

  const params = { paperId: paperId, quId: detail.value.quId, checkedItems: checkedItems }

  fillAnswerApi(params).then((res) => {
    // 标记为已答或未答
    markAnswered(detail.value.quId, res.data.filled)
  })
}

// 查找详情
onMounted(() => {
  listCard()
})
</script>

<style scoped>
.top-opt-box {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.tag-item {
  cursor: pointer;
}

.el-col {
  margin-bottom: 20px;
}

.answer-item {
  border-radius: 5px;
  border: #ddd 1px solid;
  margin-bottom: 10px;
  padding: 10px 10px;
  display: flex;
  align-items: center;
  cursor: pointer;
}

.checked {
  border: #2d8cf0 2px solid !important;
}
</style>
