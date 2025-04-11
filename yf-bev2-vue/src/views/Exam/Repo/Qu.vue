<template>
  <ContentWrap>
    <data-table
      :options="options"
      :query="query"
      @on-add="handleAdd"
      @on-edit="handleEdit"
      ref="table"
    >
      <template #search>
        <el-input class="filter-item" v-model="query.params['content']" placeholder="搜索题目" />
      </template>

      <template #columns>
        <el-table-column type="selection" width="50px" />
        <el-table-column prop="contentText" label="试题内容" />
        <el-table-column prop="repoId_dictText" label="所属题库" />
        <el-table-column prop="quType_dictText" label="题型" align="center" />
        <el-table-column prop="difficultyLevel_dictText" label="难度等级" align="center" />
        <el-table-column prop="createBy_dictText" label="创建人" align="center" />
        <el-table-column prop="createTime" label="创建时间" align="center" />
      </template>
    </data-table>

    <QuFormDialog
      v-model:visible="dialogVisible"
      :repo-id="repoId"
      :qu-id="quId"
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
    title: '',
    repoId: repoId
  }
})

// 表格默认参数
let options = ref<OptionsType>({
  listUrl: '/api/exam/repo/qu/paging',
  delUrl: '/api/exam/repo/qu/delete',
  add: {
    enable: true,
    permission: ['sys:user:add']
  },
  edit: {
    enable: true,
    permission: ['sys:user:edit']
  },
  del: {
    enable: true,
    permission: ['sys:user:delete']
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
