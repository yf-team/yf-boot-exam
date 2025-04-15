<template>
  <ContentWrap>
    <h3>考试信息</h3>
    <el-form :model="form" :rules="rules" ref="formRef" label-width="120px">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="考试名称" prop="title">
            <el-input v-model="form.title" autocomplete="off" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="考试时间">
            <el-date-picker
              v-model="dateRange"
              type="datetimerange"
              range-separator="到"
              value-format="YYYY-MM-DD HH:mm:ss"
            />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="总分数">
            <el-input-number v-model="form.totalScore" disabled /> 分
          </el-form-item>
        </el-col>

        <el-col :span="12">
          <el-form-item label="及格分">
            <el-input-number v-model="form.qualifyScore" /> 分
          </el-form-item>
        </el-col>

        <el-col :span="12">
          <el-form-item label="考试时长">
            <el-input-number v-model="form.totalTime" /> 分钟
          </el-form-item>
        </el-col>

        <el-col :span="12">
          <el-form-item label="考试机会">
            <el-input-number v-model="form.chance" :min="1" /> 次
          </el-form-item>
        </el-col>

        <el-col :span="12">
          <el-form-item label="允许迟到时长">
            <el-input-number v-model="form.lateMax" :min="1" /> 分钟
          </el-form-item>
        </el-col>

        <el-col :span="12">
          <el-form-item label="最低交卷时间">
            <el-input-number v-model="form.handMin" :min="1" /> 分钟
          </el-form-item>
        </el-col>

        <el-col :span="24">
          <el-form-item label="考试说明" prop="content">
            <Editor v-model="form.content" height="100px" ref="editorRef" style="width: 100%" />
          </el-form-item>
        </el-col>

        <el-col :span="24">
          <h3>组卷信息</h3>

          <el-form-item label="抽题题库" prop="repoId">
            <repo-select v-model="form.repoId" />
          </el-form-item>

          <div style="font-size: 12px; color: #2d8cf0; padding-bottom: 10px"
            >* 不需要抽取的题型抽题数量设置为0即可</div
          >

          <el-table :data="form.ruleList" style="width: 100%" border>
            <el-table-column label="题型" prop="quType_dictText" />
            <el-table-column label="总题数" prop="totalCount" />
            <el-table-column label="抽取题数">
              <template #default="{ row }">
                <el-input-number v-model="row.quCount" :disabled="row.totalCount === 0" />
              </template>
            </el-table-column>
            <el-table-column label="每题分数">
              <template #default="{ row }">
                <el-input-number v-model="row.quScore" :disabled="row.totalCount === 0" />
              </template>
            </el-table-column>
          </el-table>
        </el-col>
      </el-row>
    </el-form>

    <div>
      <el-button type="primary" @click="handleSave(formRef)" :loading="loading">保存</el-button>
    </div>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ref, watch, onMounted, reactive, computed } from 'vue'
import { ElMessage, FormInstance, FormRules } from 'element-plus'
import Editor from '@/components/Editor/src/Editor.vue'
import { ContentWrap } from '@/components/ContentWrap'
import { ExamType } from '@/views/Exam/Exam/types'
import RepoSelect from '@/views/Exam/Repo/components/RepoSelect.vue'
import { statApi } from '@/api/modules/exam/repo'
import { saveApi, detailApi } from '@/api/modules/exam/exam'

const dialogVisible = ref(false)
const loading = ref(false)

const form = ref<ExamType>({
  repoId: ''
})
const formRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  title: [
    {
      required: true,
      message: '考试名称必须填写！',
      trigger: 'blur'
    }
  ],
  repoId: [
    {
      required: true,
      message: '题库必须选择！',
      trigger: 'blur'
    }
  ]
})

// 监听数据变化
watch(
  () => form.value.repoId,
  (val) => {
    statApi({ id: val }).then((res) => {
      const list = res.data
      form.value.ruleList = []
      for (let i = 0; i < list.length; i++) {
        form.value.ruleList.push({
          totalCount: list[i].quCount,
          quScore: 0,
          quCount: 0,
          quType: list[i].quType,
          quType_dictText: list[i].quType_dictText
        })
      }
    })
  }
)

// 保存题目
const handleSave = async (formEl: FormInstance | undefined) => {
  if (!formEl) return
  await formEl?.validate(async (isValid) => {
    if (isValid) {
      loading.value = true
      saveApi(form.value)
        .then(() => {
          ElMessage({
            message: '考试添加成功！',
            type: 'success'
          })

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

// 添加一个选项
const addRule = () => {
  // if (!form.value.answerList) {
  //   form.value.answerList = []
  // }
  //
  // form.value.answerList.push({ content: '', isRight: false })
}

// 移除选项
const removeRule = (i: number) => {
  //form.value.answerList?.splice(i, 1)
}

const dateRange = computed({
  get: () => [form.value.startTime, form.value.endTime],
  set: (val) => {
    form.value.startTime = val?.[0] || ''
    form.value.endTime = val?.[1] || ''
  }
})

// 加载第一页数据
onMounted(() => {
  // // 查询详情
  // if (quId) {
  //   loadData(props.quId)
  // }
})
</script>
