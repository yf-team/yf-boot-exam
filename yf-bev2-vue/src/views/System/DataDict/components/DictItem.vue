<template>
  <ContentWrap>
    <DataTable
      ref="tableRef"
      :options="options"
      :query="query"
      @on-add="handleAdd(formRef)"
      @on-edit="handleEdit"
    >
      <template #search>
        <DictListSelect v-model="query.params.type" class="filter-item" dic-code="dic_type" />
        <el-input v-model="query.params.title" class="filter-item" placeholder="搜名称或编码" />
      </template>

      <template #columns>
        <el-table-column type="selection" width="50px" />

        <el-table-column label="名称" prop="title" sortable />

        <el-table-column label="类型" prop="type_dictText" sortable />

        <el-table-column label="编码" prop="dicCode" sortable />

        <el-table-column label="备注信息" prop="remark" />

        <el-table-column :align="'center'" label="操作" width="180px">
          <template #default="scope">
            <el-button size="small" type="primary" @click="showItem(scope.row)">字典项</el-button>
          </template>
        </el-table-column>
      </template>
    </DataTable>

    <el-dialog v-model="dialogVisible" :before-close="handleClose" title="保存数据字典" width="30%">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="类型" prop="type">
          <DictListSelect v-model="form.type" dic-code="dic_type" />
        </el-form-item>

        <el-form-item label="名称" prop="title">
          <el-input v-model="form.title" autocomplete="off" />
        </el-form-item>

        <el-form-item label="编码" prop="dicCode">
          <el-input v-model="form.dicCode" autocomplete="off" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="form.remark" autocomplete="off" />
        </el-form-item>
      </el-form>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSave(formRef)">保存</el-button>
        </span>
      </template>
    </el-dialog>

    <el-drawer
      v-model="drawerVisible"
      :before-close="handleClose"
      :close-on-click-modal="false"
      direction="rtl"
      size="50%"
      title="配置字典项"
    >
      <DictValue :dic-code="dicCode" :dict-type="dictType" />
    </el-drawer>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { DataTable } from '@/components/DataTable'
import { reactive, ref, unref } from 'vue'
import type { OptionsType, TableQueryType } from '@/components/DataTable/src/types'
import type { FormInstance, FormRules } from 'element-plus'
import { ElMessage } from 'element-plus'
import { saveApi } from '@/api/sys/dict'
import DictValue from './DictValue.vue'
import DictListSelect from '@/components/DictListSelect/src/DictListSelect.vue'
import type { DictDataType } from './types'
// 表格查询参数
let query = ref<TableQueryType>({
  current: 1,
  size: 10,
  params: {}
})

// 添加窗口
let dialogVisible = ref(false)

// 表单对象
const form = ref<DictDataType>({})

const checkCode = (_rule: any, value: any, callback: any) => {
  if (!value) {
    return callback(new Error('编码必须填写！'))
  }

  // 必须调用的
  callback()
}

const formRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  type: [
    {
      required: true,
      message: '类型必须选择！',
      trigger: 'blur'
    }
  ],
  title: [
    {
      required: true,
      message: '请输入字典名称！',
      trigger: 'blur'
    }
  ],
  dicCode: [
    {
      required: true,
      validator: checkCode,
      trigger: 'blur'
    }
  ]
})

// 表格默认参数
let options = ref<OptionsType>({
  listUrl: '/api/sys/dic/paging',
  delUrl: '/api/sys/dic/delete',
  add: {
    enable: true,
    permission: ['role:add']
  },
  edit: {
    enable: true,
    permission: ['role:edit']
  },
  del: {
    enable: true,
    permission: ['']
  }
})

const tableRef = ref()

const handleAdd = (formEl: FormInstance | undefined) => {
  form.value = {}
  dialogVisible.value = true
  formEl?.resetFields()
}

const handleClose = () => {
  dialogVisible.value = false
  drawerVisible.value = false
}

const handleEdit = (row: any) => {
  dialogVisible.value = true
  form.value = row
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

        console.log('关闭?')
        dialogVisible.value = false
        // 刷新表格
        tableRef.value.reload()
      })
    } else {
      dialogVisible.value = false
    }
  })
}

const drawerVisible = ref(false)
const dicCode = ref('')
const dictType = ref(0)

const showItem = (row: any) => {
  dicCode.value = row.dicCode
  dictType.value = row.type
  drawerVisible.value = true
}
</script>
