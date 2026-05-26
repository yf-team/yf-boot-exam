<template>
  <ContentWrap>
    <DataTable ref="table" :options="options" :query="query">
      <template #search>
        <el-input
          v-model="query.params.title"
          class="filter-item"
          clearable
          placeholder="搜索考试"
        />
        <DictListSelect
          v-model="query.params.passed"
          class="filter-item"
          dicCode="yes_no"
          title="是否通过"
        />
      </template>

      <template #columns>
        <el-table-column label="考试名称" prop="examId_dictText" />
        <el-table-column align="center" label="考试次数" prop="tryCount" />
        <el-table-column align="center" label="最高分数" prop="maxScore" />
        <el-table-column align="center" label="最近分数" prop="lastScore" />
        <el-table-column align="center" label="是否通过">
          <template #default="{ row }">
            <span v-if="row.passed" class="!text-[#67c23a]">通过</span>
            <span v-else class="!text-[#f56c6c]">未通过</span>
          </template>
        </el-table-column>
        <el-table-column align="center" label="操作" width="180px">
          <template #default="{ row }">
            <el-button icon="DocumentCopy" type="primary" @click="toRecord(row)"
              >考试明细
            </el-button>
          </template>
        </el-table-column>
      </template>
    </DataTable>

    <PaperListDialog v-model:visible="dialogVisible" :exam-id="examId" :user-id="userId" />
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { DataTable } from '@/components/DataTable'
import { onActivated, ref } from 'vue'
import type { OptionsType, TableQueryType } from '@/components/DataTable/src/types'
import { DictListSelect } from '@/components/DictListSelect'
import PaperListDialog from '@/views/Exam/Exam/components/PaperListDialog.vue'


// 表格查询参数
let query = ref<TableQueryType>({
  current: 1,
  size: 10,
  params: {
    title: '',
    passed: null
  }
})

// 表格默认参数
let options = ref<OptionsType>({
  listUrl: '/api/exam/exam/record/client-paging'
})

const table = ref()


const dialogVisible = ref(false)
const examId = ref('')
const userId = ref('')

const toRecord = (row) => {
  examId.value = row.examId
  userId.value = row.userId
  dialogVisible.value = true
}

onActivated(() => {
  // 刷新表格
  table.value.reload()
})
</script>
