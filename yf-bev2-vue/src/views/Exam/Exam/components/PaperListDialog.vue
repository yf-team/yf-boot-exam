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
        <el-table-column label="考试时间" prop="createTime" />
        <el-table-column align="center" label="用户得分" prop="userScore" />
        <el-table-column align="center" label="试卷总分" prop="totalScore" />
        <el-table-column align="center" label="考试用时/总时长（分钟）">
          <template #default="{ row }"> {{ row.userTime }} / {{ row.totalTime }}</template>
        </el-table-column>
        <el-table-column align="center" label="及格分数" prop="qualifyScore" />
        <el-table-column align="center" label="交卷时间" prop="handTime" />
        <el-table-column align="center" label="是否通过">
          <template #default="{ row }">
            <span v-if="row.passed" style="color: #67c23a">通过</span>
            <span v-else style="color: #f56c6c">未通过</span>
          </template>
        </el-table-column>
      </template>
    </DataTable>
  </el-dialog>
</template>

<script lang="ts" setup>
import { onMounted, ref, watch } from 'vue'
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
const loading = ref(false)

// 表格查询参数
let query = ref<TableQueryType>({
  current: 1,
  size: 10,
  params: {
    title: ''
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
    //
    console.log(val)
  }
)

const handleClose = () => {
  dialogVisible.value = false
  emit('update:visible', false)
}
// 加载第一页数据
onMounted(() => {})
</script>
