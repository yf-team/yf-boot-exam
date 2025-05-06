<template>
  <div v-loading="loading" element-loading-text="加载中...">
    <div v-if="$slots.search" class="search-box">
      <div class="search-items">
        <slot name="search"></slot>
      </div>

      <el-button icon="Search" type="primary" @click="search">搜索</el-button>
      <el-button icon="RefreshLeft" @click="reset()">重置</el-button>
    </div>

    <div class="opt-box">
      <div class="opt-box-left">
        <el-button
          v-if="add && add.enable"
          v-hasPermi="add.permission"
          class="filter-item"
          icon="Plus"
          type="primary"
          @click="onAdd"
          >添加
        </el-button>
        <el-button
          v-if="edit && edit.enable"
          v-hasPermi="edit.permission"
          :disabled="selectedIds.length === 0"
          class="filter-item"
          icon="Edit"
          type="success"
          @click="onEdit"
          >修改
        </el-button>
        <el-button
          v-if="del && del.enable"
          v-hasPermi="del.permission"
          :disabled="selectedIds.length === 0"
          class="filter-item"
          icon="Delete"
          type="danger"
          @click="onDelete"
          >删除
        </el-button>
        <el-button
          v-if="ip && ip.enable"
          v-hasPermi="ip.permission"
          class="filter-item"
          icon="Upload"
          >导入
        </el-button>
        <el-button
          v-if="op && op.enable"
          v-hasPermi="op.permission"
          class="filter-item"
          icon="Download"
          >导出
        </el-button>

        <el-dropdown v-if="selectedIds.length > 0 && batch" style="margin-left: 10px">
          <el-button plain type="primary">
            批量操作
            <el-icon class="el-icon--right">
              <arrow-down />
            </el-icon>
          </el-button>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item v-for="(item, index) in batch" :key="index" @click="onBatch(item)"
                >{{ item.label }}
              </el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>

      <div class="opt-box-right">
        <el-button circle icon="Refresh" size="small" @click="reload" />
      </div>
    </div>

    <el-table
      :data="records"
      :row-key="rowKey || 'id'"
      stripe
      style="width: 100%"
      @select="rowSelect"
      @selection-change="selection"
    >
      <slot name="columns"></slot>
    </el-table>

    <div class="paging-box">
      <el-pagination
        :current-page="current"
        :page-sizes="[10, 50, 100, 500]"
        :total="total"
        background
        layout="total, sizes, prev, pager, next"
        @size-change="sizeChange"
        @current-change="currentChange"
      />
    </div>
  </div>
</template>

<script lang="ts" setup>
import request from '@/config/axios'
import { onMounted, PropType, ref, toRefs, unref } from 'vue'
import { BatchType, OptionsType, TableQueryType } from './types'
import { ElMessage, ElMessageBox } from 'element-plus'

// 页面参数
const current = ref(1)
const records = ref([])
const total = ref(0)
const loading = ref(false)
const selectedIds = ref([] as any[])
const selectedRow = ref({})

// 表格参数
const props = defineProps({
  options: {
    type: Object as PropType<OptionsType>,
    default: () => ({})
  },
  query: {
    type: Object as PropType<TableQueryType>,
    default: () => ({
      current: 1,
      size: 10,
      params: {}
    })
  }
})

// 事件定义
const emit = defineEmits(['onAdd', 'onEdit', 'onDelete', 'onBatch'])

// 解构参数便于处理
const { listUrl, delUrl, rowKey, add, edit, del, ip, op, batch } = toRefs(props.options)
const { query } = toRefs(props)

// 搜索数据
const search = () => {
  // 第一页
  query.value.current = 1
  // 加载数据
  loadData()
}

// 搜索数据
const reset = () => {
  // 清空值并搜索
  query.value.params = {}
  search()
}

// 选定数据
const selection = (rows: { id: string }[]) => {
  let ids = [] as any[]
  rows.forEach((row) => {
    ids.push(row.id)
    console.log('++++选定的：' + row.id)
  })

  // 赋值
  selectedIds.value = ids
  console.log('select', selectedIds.value)
}

// 最后选择的数据，用于编辑
const rowSelect = (row) => {
  selectedRow.value = row
}

// 添加操作
const onAdd = () => {
  console.log('添加操作：' + JSON.stringify(selectedRow.value))
  emit('onAdd', selectedRow.value)
}

// 修改操作
const onEdit = () => {
  console.log('修改操作：' + JSON.stringify(selectedRow.value))
  emit('onEdit', unref(selectedRow.value[0]))
}

// 删除操作
const onDelete = () => {
  ElMessageBox.confirm('确实要删除选定的数据吗?', '提示信息', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    emit('onDelete', unref(selectedIds))

    // 执行删除操作
    request
      .post({
        url: delUrl?.value,
        data: { ids: selectedIds.value }
      })
      .then(() => {
        ElMessage({
          showClose: true,
          message: '删除成功！',
          type: 'success'
        })
        // 刷新数据
        loadData()
      })
  })
}

// 批量操作
const onBatch = (data: BatchType) => {
  console.log('批量操作' + JSON.stringify(data))

  ElMessageBox.confirm('确认要批量操作吗?', '提示信息', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    // 回调数据
    const result = {
      ids: selectedIds.value,
      key: data.key
    }

    // 回调即可
    emit('onBatch', result)

    // 直接提交数据
    if (data.action) {
      let params = data.params || {}

      params[data.idsKey || 'ids'] = selectedIds.value

      // 执行批量操作
      request
        .post({
          url: data.action,
          data: params
        })
        .then(() => {
          ElMessage({
            showClose: true,
            message: '操作成功！',
            type: 'success'
          })
          // 刷新数据
          loadData()
        })

      console.log('提交到：' + data.action)
      console.log('提交参数：' + JSON.stringify(params))
    }
  })
}

// 刷新数据
const reload = () => {
  console.log('数据已重新加载..')
  loadData()
}

// 加载数据
const loadData = () => {
  loading.value = true

  // 请求服务器
  request
    .post({
      url: listUrl.value,
      data: query.value
    })
    .then((res) => {
      const data = res.data
      current.value = query.value.current
      records.value = data.records
      total.value = data.total
      loading.value = false
    })
}

// 修改每页数量
const sizeChange = (size) => {
  // 清空值并搜索
  query.value.current = 1
  query.value.size = size
  // 加载数据
  loadData()
}

// 修改每页数量
const currentChange = (current) => {
  // 跳页即可
  query.value.current = current
  // 加载数据
  loadData()
}

// 加载第一页数据
onMounted(() => {
  // 首次加载数据
  loadData()
})

// 对外开放数据
defineExpose({
  reload
})
</script>

<style scoped></style>
