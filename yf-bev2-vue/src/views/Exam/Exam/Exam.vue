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
        <el-input class="filter-item" v-model="query.params['title']" placeholder="搜索题库" />
      </template>

      <template #columns>
        <el-table-column type="selection" width="50px" />
        <el-table-column prop="title" label="考试名称" />
        <el-table-column prop="startTime" label="开始时间" align="center" />
        <el-table-column prop="endTime" label="结束时间" align="center" />
        <el-table-column prop="createBy_dictText" label="创建人" align="center" />
        <el-table-column prop="createTime" label="创建时间" align="center" />
        <el-table-column label="操作" width="180px" :align="'center'">
          <template #default="{ row }">
            <el-button icon="Setting" type="primary" size="small" @click="toRecord(row.id)"
              >考试记录</el-button
            >
          </template>
        </el-table-column>
      </template>
    </data-table>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { DataTable } from '@/components/DataTable'
import { ref } from 'vue'
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
  push({ name: 'TmplAdd', query: { id: id } })
}
</script>
