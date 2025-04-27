<template>
  <ContentWrap>
    <DataTable ref="table" :options="options" :query="query">
      <template #search>
        <DictListSelect
          v-model="query.params.groupId"
          class="filter-item"
          dic-code="plugin_group"
        />
      </template>

      <template #columns>
        <el-table-column type="selection" width="50px" />
        <el-table-column label="插件编号" prop="code" />
        <el-table-column label="插件名称" prop="title" />
        <el-table-column label="插件类型" prop="groupId_dictText" />

        <el-table-column :align="'center'" label="使用状态" width="180px">
          <template #default="scope">
            <el-tag v-if="scope.row.inUse" type="success">使用中</el-tag>
            <el-tag v-else type="danger">未使用</el-tag>
          </template>
        </el-table-column>

        <el-table-column :align="'center'" label="操作项" width="180px">
          <template #default="scope">
            <el-button
              circle
              icon="Setting"
              size="small"
              type="primary"
              @click="showConfig(scope.row)"
            />
          </template>
        </el-table-column>
      </template>
    </DataTable>

    <ElDialog v-model="dialogVisible" :before-close="handleClose" title="配置插件" width="40%">
      <el-form ref="formRef" :model="form" label-width="150px">
        <template v-for="item in configItems" :key="item.name">
          <el-form-item :label="item.title" :prop="item.name">
            <el-input v-model="form[item.name || 'none']" autocomplete="off" />
          </el-form-item>
        </template>
      </el-form>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSave(formRef)">保存</el-button>
        </span>
      </template>
    </ElDialog>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { DataTable } from '@/components/DataTable'
import { ref, unref } from 'vue'
import type { OptionsType, TableQueryType } from '@/components/DataTable/src/types'
import type { FormInstance } from 'element-plus'
import { ElMessage } from 'element-plus'
import { saveConfig } from '@/api/sys/plugin/data'
import { detailApi as schemaDetail } from '@/api/sys/plugin/schema'
import DictListSelect from '@/components/DictListSelect/src/DictListSelect.vue'
import type { ConfigIem } from './types'

// 表格查询参数
let query = ref<TableQueryType>({
  current: 1,
  size: 10,
  params: {
    title: '',
    deptCode: ''
  }
})

const configItems = ref<ConfigIem[]>()

// 表格默认参数
let options = ref<OptionsType>({
  listUrl: '/api/sys/plugin/data/paging'
})

const table = ref()
const dialogVisible = ref(false)
const form = ref({})
const formRef = ref<FormInstance>()
const current = ref()

const showConfig = (data: any) => {
  // 当前数据
  current.value = data

  // 加载元数据
  schemaDetail({ id: data.schemaId }).then((res) => {
    configItems.value = JSON.parse(res.data.schemaData)
    console.log(configItems.value)
  })

  if (data.configData) {
    form.value = data.configData
  } else {
    form.value = {}
  }
  dialogVisible.value = true
}

const handleClose = () => {
  dialogVisible.value = false
}

const handleSave = (formEl: FormInstance | undefined) => {
  if (!formEl) return

  formEl.validate((valid) => {
    if (valid) {
      const params = {
        id: current.value.id,
        configData: unref(form)
      }

      saveConfig(params).then(() => {
        ElMessage({
          showClose: true,
          message: '配置保存成功！',
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
