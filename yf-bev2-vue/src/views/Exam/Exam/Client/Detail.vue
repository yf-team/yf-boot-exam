<template>
  <ContentWrap> 啊飒飒所 </ContentWrap>
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
  push({ name: 'TmplAdd', query: { id: id } })
}

onActivated(() => {
  // 刷新表格
  table.value.reload()
})
</script>
