<template>
  <ContentWrap>
    <data-table
      :options="options"
      :query="query"
      @on-add="handleAdd(formRef)"
      @on-edit="handleEdit"
      ref="table"
    >
      <template #search>
        <el-input
          class="filter-item"
          v-model="query.params['roleName']"
          placeholder="搜索角色名称"
        />
      </template>

      <template #columns>
        <el-table-column type="selection" width="50px" />
        <el-table-column prop="title" label="题库名称" />
        <el-table-column prop="catId_dictText" label="题库分类" />
        <el-table-column prop="quCount" label="题目数量" align="center" />
        <el-table-column prop="createBy_dictText" label="创建人" />
        <el-table-column prop="createTime" label="时间" />
      </template>
    </data-table>

    <el-dialog v-model="dialogVisible" title="题库管理" width="50%" :before-close="handleClose">
      <el-form :model="form" :rules="rules" ref="formRef" label-width="120px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="题库名称" prop="title">
              <el-input v-model="form.title" autocomplete="off" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="题库分类" prop="catId">
              <DictListSelect dic-code="repo_catalog" v-model="form.catId" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSave(formRef)">保存</el-button>
        </span>
      </template>
    </el-dialog>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { DataTable } from '@/components/DataTable'
import { ref, reactive, unref } from 'vue'
import type { OptionsType, TableQueryType } from '@/components/DataTable/src/types'
import type { FormInstance, FormRules } from 'element-plus'
import { ElMessage } from 'element-plus'
import { saveApi, detailApi } from '@/api/modules/exam/repo'
import { RepoDataType } from './types'
import { DictListSelect } from '@/components/DictListSelect'

// 表格查询参数
let query = ref<TableQueryType>({
  current: 1,
  size: 10,
  params: {
    title: '',
    deptCode: ''
  }
})

// 表格默认参数
let options = ref<OptionsType>({
  listUrl: '/api/exam/repo/repo/paging',
  delUrl: '/api/exam/repo/repo/delete',
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
  },
  // 批量操作
  batch: [
    {
      key: 'state',
      label: '启用',
      params: { state: 0 },
      action: '/api/sys/user/state'
    },
    {
      key: 'state',
      label: '禁用',
      params: { state: 1 },
      action: '/api/sys/user/state'
    }
  ]
})

const table = ref()
const dialogVisible = ref(false)
const form = ref<RepoDataType>({})
const formRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  title: [
    {
      required: true,
      message: '题库名称不能为空',
      trigger: 'blur'
    }
  ],
  catId: [
    {
      required: true,
      message: '题库分类不能为空',
      trigger: 'blur'
    }
  ]
})

const handleAdd = (formEl: FormInstance | undefined) => {
  dialogVisible.value = true
  form.value = {}
  formEl?.resetFields()
}

const handleClose = () => {
  dialogVisible.value = false
}

const handleEdit = (row: any) => {
  detailApi({ id: row.id }).then((res) => {
    // 数据
    console.log('data', res.data)
    form.value = res.data
  })

  dialogVisible.value = true
}

const handleSave = (formEl: FormInstance | undefined) => {
  if (!formEl) return

  formEl.validate((valid) => {
    if (valid) {
      const formData = unref(form)
      saveApi(formData).then(() => {
        ElMessage({
          showClose: true,
          message: '操作成功！',
          type: 'success'
        })
        // 刷新表格
        table.value.reload()
        dialogVisible.value = false
      })
    } else {
      dialogVisible.value = false
    }
  })
}
</script>
