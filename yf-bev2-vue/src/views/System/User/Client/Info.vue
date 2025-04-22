<template>
  <ContentWrap>
    <el-form ref="formRef" :model="form" :rules="rules" label-width="120px">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="用户编号">
            <el-input v-model="form.id" autocomplete="off" disabled />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="归属部门">
            <el-input v-model="form.deptCode_dictText" disabled />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="登录账号" prop="userName">
            <el-input v-model="form.userName" autocomplete="off" disabled />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="真实姓名" prop="realName">
            <el-input v-model="form.realName" autocomplete="off" />
          </el-form-item>
        </el-col>

        <el-col :span="12">
          <el-form-item label="手机号码" prop="mobile">
            <el-input v-model="form.mobile" autocomplete="off" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="身份证号" prop="idCard">
            <el-input v-model="form.idCard" autocomplete="off" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="用户头像" prop="avatar">
            <file-uploader v-model="form.avatar" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <div>
      <el-button type="primary" @click="handleSave(formRef)">保存</el-button>
    </div>
  </ContentWrap>
</template>

<script lang="ts" setup>
import { ContentWrap } from '@/components/ContentWrap'
import { onMounted, reactive, ref, unref } from 'vue'
import type { FormInstance, FormRules } from 'element-plus'
import { ElMessage } from 'element-plus'
import { infoApi, updateApi } from '@/api/sys/user'
import type { UserDataType } from '../types'
import { useUserStoreWithOut } from '@/store/modules/user'
import { FileUploader } from '@/plugins/uploader'

const userInfo = useUserStoreWithOut().getUserInfo

const form = ref<UserDataType>({})
const formRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  realName: [
    {
      required: true,
      message: '姓名必须输入',
      trigger: 'blur'
    }
  ]
})

const handleSave = (formEl: FormInstance | undefined) => {
  if (!formEl) return

  formEl.validate((valid) => {
    if (valid) {
      const formData = unref(form)
      updateApi(formData).then(() => {
        ElMessage({
          showClose: true,
          message: '操作成功！',
          type: 'success'
        })

        loadInfo()
      })
    }
  })
}

// 获取用户信息
const loadInfo = () => {
  infoApi({ token: userInfo?.token }).then((res) => {
    form.value = res.data
  })
}

onMounted(() => {
  loadInfo()
})
</script>
