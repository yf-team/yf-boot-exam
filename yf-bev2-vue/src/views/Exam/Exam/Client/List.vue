<template>
  <ContentWrap>
    <DataTable ref="table" :options="options" :query="query">
      <template #search>
        <el-input v-model="query.params['title']" class="filter-item" placeholder="搜索考试" />
      </template>

      <template #columns>
        <el-table-column label="考试名称" prop="title" />
        <el-table-column align="center" label="开始时间" prop="startTime" />
        <el-table-column align="center" label="结束时间" prop="endTime" />
        <el-table-column align="center" label="创建人" prop="createBy_dictText" />
        <el-table-column align="center" label="创建时间" prop="createTime" />
        <el-table-column :align="'center'" label="操作" width="180px">
          <template #default="{ row }">
            <el-button icon="Position" type="primary" @click="toDetail(row.id)">进入考试</el-button>
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
  listUrl: '/api/exam/exam/exam/client-paging'
})

const toDetail = (id: string) => {
  push({ name: 'ExamClientDetail', query: { id: id } })
}

onActivated(() => {})
</script>
