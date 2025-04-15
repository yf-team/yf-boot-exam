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
        <el-input class="filter-item" v-model="query.params['title']" placeholder="搜索题库" />
      </template>

      <template #columns>
        <el-table-column type="selection" width="50px" />
        <el-table-column prop="title" label="试卷名称" />
        <el-table-column prop="joinType_dictText" label="组卷方式" align="center" />
        <el-table-column prop="totalScore" label="试卷总分" align="center" />
        <el-table-column prop="createBy_dictText" label="创建人" align="center" />
        <el-table-column prop="createTime" label="创建时间" align="center" />
        <el-table-column label="操作" width="180px" :align="'center'">
          <template #default="{ row }">
            <el-button icon="Setting" type="primary" size="small" @click="toQuList(row.id)"
              >试题管理</el-button
            >
          </template>
        </el-table-column>
      </template>
    </data-table>

    <el-dialog v-model="dialogVisible" title="试卷管理" width="50%" :before-close="handleClose">
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
  listUrl: '/api/exam/tmpl/tmpl/paging',
  delUrl: '/api/exam/tmpl/tmpl/delete',
  add: {
    enable: true,
    permission: ['exam:tmpl:add']
  },
  edit: {
    enable: true,
    permission: ['exam:tmpl:edit']
  },
  del: {
    enable: true,
    permission: ['exam:tmpl:delete']
  }
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

const toQuList = (id: string) => {
  push({ name: 'Qu', query: { repoId: id } })
}
</script>
