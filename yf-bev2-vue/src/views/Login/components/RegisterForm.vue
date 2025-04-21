<template>
  <el-form
    ref="formRef"
    :model="form"
    :rules="rules"
    class="dark:(border-1 border-[var(--el-border-color)] border-solid); w-[100%]"
    hide-required-asterisk
    label-position="left"
    label-width="70px"
    size="large"
  >
    <el-form-item>
      <h2 class="text-2xl font-bold text-center w-[100%]">{{ t('login.registerTitle') }}</h2>
    </el-form-item>

    <el-form-item :label="t('login.username')" prop="userName">
      <el-input
        v-model="form.userName"
        :placeholder="t('login.usernamePlaceholder')"
        clearable
        type="text"
      />
    </el-form-item>

    <el-form-item :label="t('login.realName')" prop="realName">
      <el-input
        v-model="form.realName"
        :placeholder="t('login.realNamePlaceholder')"
        clearable
        type="text"
      />
    </el-form-item>

    <el-form-item :label="t('login.password')" prop="password">
      <input-password
        v-model="form.password"
        :placeholder="t('login.passwordPlaceholder')"
        :strength="true"
        style="width: 100%"
      />
    </el-form-item>

    <el-form-item :label="t('login.checkPassword')" prop="checkPassword">
      <input-password
        v-model="form.checkPassword"
        :placeholder="t('login.passwordPlaceholder')"
        :strength="true"
        style="width: 100%"
      />
    </el-form-item>

    <el-form-item :label="t('login.code')" prop="captchaValue">
      <input-captcha v-model="form" :placeholder="t('login.codePlaceholder')" style="width: 100%" />
    </el-form-item>

    <el-form-item>
      <div class="w-[100%]">
        <el-button :loading="loading" class="w-[100%]" type="primary" @click="register(formRef)">
          {{ t('login.register') }}
        </el-button>
      </div>
      <div class="w-[100%] mt-15px">
        <el-button class="w-[100%]" @click="toLogin"> {{ t('login.hasUser') }}</el-button>
      </div>
    </el-form-item>
  </el-form>
</template>

<script lang="ts" setup>
import { ref, unref } from 'vue'
import { useI18n } from '@/hooks/web/useI18n'
import { useValidator } from '@/hooks/web/useValidator'
import { UserLoginType } from '@/api/login/types'
import { FormInstance } from 'element-plus'
import InputPassword from '@/components/InputPassword/src/InputPassword.vue'
import InputCaptcha from '@/components/InputCaptcha/src/InputCaptcha.vue'
import { useRouter } from 'vue-router'
import { useUserStoreWithOut } from '@/store/modules/user'

const { required } = useValidator()

const { replace } = useRouter()
const emit = defineEmits(['to-login'])

const userStore = useUserStoreWithOut()

const { t } = useI18n()
const form = ref<UserLoginType>({
  userName: '',
  realName: '',
  password: '',
  captchaKey: '',
  captchaValue: ''
})
const formRef = ref<FormInstance>()

// 密码校验
const checkPass = (_rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('请输入确认密码！'))
  } else if (value !== form.value.password) {
    callback(new Error('两次密码输入不一致！'))
  } else {
    callback()
  }
}

const rules = {
  userName: [required()],
  realName: [required()],
  password: [required()],
  checkPassword: [{ validator: checkPass, trigger: 'blur' }],
  captchaValue: [required()]
}
const loading = ref(false)

// 登录
const register = async (formEl: FormInstance | undefined) => {
  if (!formEl) return
  await formEl?.validate(async (isValid) => {
    if (isValid) {
      loading.value = true
      const formData = unref(form)
      // 注册并登录
      userStore
        .register(formData)
        .then(() => {
          replace('/')
          loading.value = false
        })
        .catch(() => {
          loading.value = false
        })
    }
  })
}

// 去登录页面
const toLogin = () => {
  emit('to-login')
}
</script>

<style lang="less" scoped>
:deep(.el-form-item__label) {
  display: inline-block;
  width: 70px;
  margin-right: 10px;
  text-align-last: justify;
}
</style>
