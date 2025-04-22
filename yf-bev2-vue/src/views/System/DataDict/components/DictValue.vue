<template>
  <div v-loading="loading" element-loading-text="加载中...">
    <el-table
      :data="records"
      :tree-props="{
        children: 'children',
        hasChildren: 'hasChildren'
      }"
      default-expand-all
      row-key="id"
      stripe
      style="width: 100%"
    >
      <el-table-column label="名称">
        <template #default="scope">
          <el-input v-model="scope.row.title" style="width: calc(100% - 150px)" />
        </template>
      </el-table-column>

      <el-table-column v-if="props.dictType === 1" label="值">
        <template #default="scope">
          <el-input v-model="scope.row.dicValue" />
        </template>
      </el-table-column>

      <el-table-column :align="'center'" label="操作" width="150px">
        <template #default="scope">
          <el-button
            :disabled="!scope.row.id"
            circle
            icon="Plus"
            size="small"
            @click="handleAddSub(scope.row)"
          />
          <el-button circle icon="Check" size="small" type="primary" @click="saveItem(scope.row)" />
          <el-button
            :disabled="!scope.row.id"
            circle
            icon="Delete"
            size="small"
            type="danger"
            @click="removeItem(scope.row)"
          />
        </template>
      </el-table-column>
    </el-table>

    <el-button style="width: 100%; margin-top: 20px" type="primary" @click="handleAdd"
      >添加新的项目
    </el-button>
  </div>
</template>

<script lang="ts" setup>
import { onMounted, ref, watch } from 'vue'
import { subDeleteApi, subListApi, subSaveApi } from '@/api/sys/dict'
import { ElMessage } from 'element-plus'

// 页面参数
const records = ref()
const loading = ref(false)

// 表格参数
const props = defineProps({
  dicCode: {
    type: String,
    default: ''
  },
  dictType: {
    type: Number,
    default: 1
  }
})

// 监听数据变化
watch(
  () => props.dicCode,
  (val) => {
    if (!val) return
    loadData()
  }
)

// 加载数据
const loadData = () => {
  loading.value = true
  subListApi({ dicCode: props.dicCode })
    .then((res) => {
      records.value = res.data
      loading.value = false
    })
    .catch(() => {
      loading.value = false
    })
}

// 加载数据
const mergeData = () => {
  loading.value = true
  subListApi({ dicCode: props.dicCode })
    .then((res) => {
      // 服务器返回数据
      for (const item of res.data) {
        for (const rc of records.value) {
          if (item.dicValue === rc.dicValue) {
            rc.id = item.id
          }
        }
      }
      loading.value = false
    })
    .catch(() => {
      loading.value = false
    })
}

const handleAdd = () => {
  if (!records.value) {
    records.value = []
  }
  records.value.push({ parentId: 0, title: '', dicValue: '', dicCode: props.dicCode })
}

const saveItem = (row: any) => {
  if ((!row.dicValue || !row.title) && props.dictType === 1) {
    ElMessage({
      showClose: true,
      message: '字典名称和值不能为空！',
      type: 'warning'
    })
    return
  }

  if (!row.title && props.dictType === 2) {
    ElMessage({
      showClose: true,
      message: '分类名称不能为空！',
      type: 'warning'
    })
    return
  }

  subSaveApi(row).then(() => {
    ElMessage({
      showClose: true,
      message: '保存成功！',
      type: 'success'
    })

    if (props.dictType === 1) {
      mergeData()
    } else {
      loadData()
    }
  })
}

const removeItem = (row: any) => {
  subDeleteApi({ ids: [row.id] }).then(() => {
    ElMessage({
      showClose: true,
      message: '删除成功！',
      type: 'success'
    })
    loadData()
  })
}

const handleAddSub = (row: any) => {
  if (!row.children) {
    row.children = []
  }
  row.children.push({ title: '', dicValue: '', parentId: row.id, dicCode: props.dicCode })
}

// 加载第一页数据
onMounted(() => {
  // 首次加载数据
  loadData()
})
</script>
