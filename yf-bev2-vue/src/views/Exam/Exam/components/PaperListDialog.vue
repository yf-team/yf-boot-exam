<template>
  <el-dialog
    v-model="dialogVisible"
    :before-close="handleClose"
    align-center
    title="考试记录"
    width="80%"
  >
    <DataTable ref="table" :options="options" :query="query">
      <template #columns>
        <el-table-column label="考试时间" prop="createTime" show-overflow-tooltip />
        <el-table-column align="center" label="用户得分" prop="userScore" width="100" />
        <el-table-column align="center" label="试卷总分" prop="totalScore" width="100" />
        <el-table-column align="center" label="用时/总时长（分钟）">
          <template #default="{ row }"> {{ row.userTime }} / {{ row.totalTime }}</template>
        </el-table-column>
        <el-table-column align="center" label="及格分数" prop="qualifyScore" width="100" />
        <el-table-column align="center" label="交卷时间" prop="handTime" show-overflow-tooltip  />
        <el-table-column align="center" label="是否通过" width="100">
          <template #default="{ row }">
            <span v-if="row.passed" class="!text-[#67c23a]">通过</span>
            <span v-else class="!text-[#f56c6c]">未通过</span>
          </template>
        </el-table-column>
        <el-table-column align="center" label="操作" width="120">
          <template #default="{ row }">
            <el-button icon="View" type="primary" @click="toDetail(row.id)">明细</el-button>
          </template>
        </el-table-column>
      </template>
    </DataTable>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, watch } from 'vue'
import { DataTable } from '@/components/DataTable'
import type { OptionsType, TableQueryType } from '@/components/DataTable/src/types'

const dialogVisible = ref(false)

// 组件参数
const props = defineProps({
  visible: {
    type: Boolean,
    default: false
  },
  examId: {
    type: String,
    default: ''
  },
  userId: {
    type: String,
    default: ''
  }
})

const emit = defineEmits(['update:visible'])

// 表格查询参数
let query = ref<TableQueryType>({
  current: 1,
  size: 10,
  params: {
    title: '',
    examId: '',
    userId: ''
  }
})

// 表格默认参数
let options = ref<OptionsType>({
  listUrl: '/api/exam/paper/paper/paging'
})

const table = ref()

// 监听数据变化
watch(
  () => props.visible,
  (val) => {
    dialogVisible.value = val
  }
)

// 监听数据变化
watch(
  () => props.userId,
  (val) => {
    query.value.params.userId = val
  },
  {
    immediate: true
  }
)

watch(
  () => props.examId,
  (val) => {
    query.value.params.examId = val
  },
  {
    immediate: true
  }
)

const handleClose = () => {
  dialogVisible.value = false
  emit('update:visible', false)
}

import { useRouter } from 'vue-router'
const { push } = useRouter()

const toDetail = (id) => {
  push({ name: 'ExamClientResult', query: { id, mode: 'full' } })
}
</script>
