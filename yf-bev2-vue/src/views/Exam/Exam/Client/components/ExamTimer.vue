<template>
  <div class="count-box">
    <span style="">剩余考试时间：</span>
    <span style="color: #409eff"
      ><CountDown :left-seconds="seconds" @overdue="examTimeout" @warn="showWarn" />
    </span>
  </div>
</template>

<script lang="ts" setup>
import { onMounted, onUnmounted, ref } from 'vue'
import { ElMessage } from 'element-plus'
import { CountDown } from '@/components/CountDown'
import { realTimeStateApi } from '@/api/modules/exam/paper'
import { useRouter } from 'vue-router'

const { push } = useRouter()

// 组件参数
const props = defineProps({
  paperId: {
    type: String,
    default: null
  }
})

const emit = defineEmits(['overdue', 'warn'])
const seconds = ref(999999999)

// 提前告警
const showWarn = () => {
  emit('warn')
  ElMessage.error('剩余考试时间已不足5分钟，请合理安排时间！')
}

// 强制交卷
const examTimeout = () => {
  emit('overdue')
}

// 定时任务方法
const executeTask = () => {
  realTimeStateApi({ id: props.paperId }).then((res) => {
    const data = res.data
    if (data.handed) {
      ElMessage.error('当前试卷已被提交、无法继续答题！')
      setTimeout(() => {
        push({ name: 'ExamClientResult', query: { id: props.paperId } })
      }, 2000)
      return
    }
    seconds.value = data.leftSeconds
  })
}

// 定时器引用
const timer = ref<NodeJS.Timeout | null>(null)

// 初始化定时器
const initTimer = () => {
  // 先立即执行一次
  executeTask()

  // 设置每分钟(60000毫秒)执行的定时器
  timer.value = setInterval(() => {
    executeTask()
  }, 60000)
}

// 清理定时器
const clearTimer = () => {
  if (timer.value) {
    clearInterval(timer.value)
    timer.value = null
  }
}

// 查找详情
onMounted(() => {
  initTimer()
})

// 组件卸载时清理
onUnmounted(() => {
  clearTimer()
})
</script>

<style lang="less" scoped>
.count-box {
  font-size: 18px;
  font-weight: 700;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
