<template>
  <el-select
    v-model="repoId"
    clearable
    placeholder="请选择题库"
    style="width: 100%"
    @change="selectChange"
  >
    <el-option v-for="item in options" :key="item.id" :label="item.title" :value="item.id || ''" />
  </el-select>
</template>

<script lang="ts" setup>
import { onMounted, ref, unref, watch } from 'vue'
import { pagingApi } from '@/api/modules/exam/repo'
import type { RepoDataType } from '../types'

const repoId = ref<String>()
const options = ref<RepoDataType[]>([])

// 组件参数
const props = defineProps({
  modelValue: {
    type: String,
    default: ''
  }
})

const emit = defineEmits(['update:modelValue'])

// 监听数据变化
watch(
  () => props.modelValue,
  (val) => {
    repoId.value = val
  }
)

// 加载数据
const loadData = async () => {
  // 加载下拉列表
  await pagingApi({ current: 1, size: 100, params: {} }).then((res) => {
    options.value = res.data.records
  })
}

// 选定内容
const selectChange = () => {
  console.log('selectChange', unref(repoId))
  emit('update:modelValue', unref(repoId))
}

// 加载第一页数据
onMounted(() => {
  // 首次加载数据
  loadData()
})
</script>
