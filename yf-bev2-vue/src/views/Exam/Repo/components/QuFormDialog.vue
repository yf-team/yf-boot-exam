<template>
  <el-dialog v-model="dialogVisible" title="试题管理" width="50%" :before-close="handleClose">
    <el-form :model="form" :rules="rules" ref="formRef" label-width="120px">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="试题题型" prop="quType">
            <DictListSelect dic-code="qu_type" v-model="form.quType" :disabled="!!form.id" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="难度等级" prop="difficultyLevel">
            <DictListSelect dic-code="qu_difficulty_level" v-model="form.difficultyLevel" />
          </el-form-item>
        </el-col>

        <el-col :span="12">
          <el-form-item label="所属题库" prop="repoId">
            <RepoSelect v-model="form.repoId" />
          </el-form-item>
        </el-col>

        <el-col :span="24">
          <el-form-item label="试题题干" prop="content">
            <Editor v-model="form.content" height="200px" ref="editorRef" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取消</el-button>
        <el-button type="primary" @click="handleSave(formRef)" :loading="loading">保存</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, watch, onMounted, reactive } from 'vue'
import { DictListSelect } from '@/components/DictListSelect'
import { QuDataType } from '@/views/Exam/Repo/types'
import type { FormInstance, FormRules } from 'element-plus'
import RepoSelect from '@/views/Exam/Repo/components/RepoSelect.vue'
import { detailApi, saveApi } from '@/api/modules/exam/qu'
import Editor from '@/components/Editor/src/Editor.vue'

const dialogVisible = ref(false)

// 组件参数
const props = defineProps({
  visible: {
    type: Boolean,
    default: false
  },
  repoId: {
    type: String,
    default: ''
  },
  quId: {
    type: String,
    default: ''
  }
})

const emit = defineEmits(['update:visible', 'saved'])
const loading = ref(false)

const form = ref<QuDataType>({})
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

// 监听数据变化
watch(
  () => props.visible,
  (val) => {
    dialogVisible.value = val
  }
)

// 监听数据变化
watch(
  () => props.quId,
  (val) => {
    if (val) {
      loadData(val)
    } else {
      form.value = {}
    }
  }
)

const handleClose = () => {
  dialogVisible.value = false
  emit('update:visible', false)
}

// 登录
const handleSave = async (formEl: FormInstance | undefined) => {
  if (!formEl) return
  await formEl?.validate(async (isValid) => {
    if (isValid) {
      loading.value = true
      saveApi(form.value)
        .then(() => {
          dialogVisible.value = false
          emit('update:visible', false)
          emit('saved')
          loading.value = false
        })
        .catch(() => {
          loading.value = false
        })
    }
  })
}

// 加载详情
const loadData = (repoId: string) => {
  detailApi({ id: repoId }).then(({ data }) => {
    form.value = data
  })
}

// 加载第一页数据
onMounted(() => {
  // 查询详情
  if (props.quId) {
    loadData(props.quId)
  }
})
</script>
