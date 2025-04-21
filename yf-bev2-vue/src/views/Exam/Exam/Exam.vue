<template>
  <ContentWrap>
    <DataTable
      ref="table"
      :options="options"
      :query="query"
      @on-add="handleAdd"
      @on-edit="handleEdit"
    >
      <template #search>
        <el-input v-model="query.params.title" class="filter-item" placeholder="搜索题库" />
      </template>

      <template #columns>
        <el-table-column type="selection" width="50px" />
        <el-table-column label="考试名称" prop="title" />
        <el-table-column align="center" label="开始时间" prop="startTime" />
        <el-table-column align="center" label="结束时间" prop="endTime" />
        <el-table-column align="center" label="创建人" prop="createBy_dictText" />
        <el-table-column align="center" label="创建时间" prop="createTime" />
        <el-table-column :align="'center'" label="操作" width="180px">
          <template #default="{ row }">
            <el-button icon="Document" type="primary" @click="toRecord(row.id)">考试记录</el-button>
          </template>
        </el-table-column>
      </template>
    </DataTable>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { DataTable } from '@/components/DataTable'
import { onActivated, ref } from 'vue'
import type { OptionsType, TableQueryType } from '@/components/DataTable/src/types'
import { useRouter } from 'vue-router'

const { push } = useRouter()

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
  listUrl: '/api/exam/exam/exam/paging',
  delUrl: '/api/exam/exam/exam/delete',
  add: {
    enable: true,
    permission: ['exam:exam:add']
  },
  edit: {
    enable: true,
    permission: ['exam:exam:edit']
  },
  del: {
    enable: true,
    permission: ['exam:exam:delete']
  }
})

const table = ref()

const handleAdd = () => {
  push({ name: 'ExamAdd' })
}
const handleEdit = (row: any) => {
  push({ name: 'ExamEdit', query: { id: row.id } })
}

const toRecord = (id: string) => {
  push({ name: 'ExamRecord', query: { id: id } })
}

onActivated(() => {
  // 刷新表格
  table.value.reload()
})
</script>
