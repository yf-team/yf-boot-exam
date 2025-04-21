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
        <el-input v-model="query.params.content" class="filter-item" placeholder="搜索题目" />
      </template>

      <template #columns>
        <el-table-column type="selection" width="50px" />
        <el-table-column label="试题内容" prop="contentText" show-overflow-tooltip />
        <el-table-column label="所属题库" prop="repoId_dictText" />
        <el-table-column align="center" label="题型" prop="quType_dictText" />
        <el-table-column align="center" label="难度等级" prop="difficultyLevel_dictText" />
        <el-table-column align="center" label="创建人" prop="createBy_dictText" />
        <el-table-column align="center" label="创建时间" prop="createTime" />
      </template>
    </DataTable>

    <QuFormDialog
      v-model:visible="dialogVisible"
      :qu-id="quId"
      :repo-id="repoId"
      @saved="handleRefresh"
    />
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { DataTable } from '@/components/DataTable'
import { ref } from 'vue'
import type { OptionsType, TableQueryType } from '@/components/DataTable/src/types'
import { useRoute } from 'vue-router'
import QuFormDialog from '@/views/Exam/Repo/components/QuFormDialog.vue'

// 获取参数
const route = useRoute()
const repoId = ref()
const quId = ref()

repoId.value = route.query.repoId || ''

// 添加修改
const dialogVisible = ref(false)

// 表格查询参数
let query = ref<TableQueryType>({
  current: 1,
  size: 10,
  params: {
    repoId: repoId,
    content: ''
  }
})

// 表格默认参数
let options = ref<OptionsType>({
  listUrl: '/api/exam/repo/qu/paging',
  delUrl: '/api/exam/repo/qu/delete',
  add: {
    enable: true,
    permission: ['repo:qu:add']
  },
  edit: {
    enable: true,
    permission: ['repo:qu:edit']
  },
  del: {
    enable: true,
    permission: ['repo:qu:delete']
  },
  ip: {
    enable: true,
    permission: ['repo:qu:import']
  },
  op: {
    enable: true,
    permission: ['repo:qu:export']
  }
})

const table = ref()

const handleAdd = () => {
  quId.value = ''
  dialogVisible.value = true
}

const handleEdit = (row: any) => {
  quId.value = row.id
  dialogVisible.value = true
}

// 刷新列表
const handleRefresh = () => {
  table.value.reload()
}
</script>
