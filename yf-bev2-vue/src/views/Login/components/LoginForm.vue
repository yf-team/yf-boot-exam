<template>
  <el-form
    ref="formRef"
    :model="form"
    :rules="rules"
    class="dark:(border-1 border-[var(--el-border-color)] border-solid); w-[100%]"
    hide-required-asterisk
    label-position="top"
    size="large"
  >
    <el-form-item>
      <h2 class="text-2xl font-bold text-center w-[100%]">{{ t('login.loginTitle') }} </h2>
    </el-form-item>

    <el-form-item :label="t('login.username')" prop="userName">
      <el-input
        v-model="form.userName"
        :placeholder="t('login.usernamePlaceholder')"
        clearable
        type="text"
      />
    </el-form-item>

    <el-form-item :label="t('login.password')" prop="password">
      <el-input
        v-model="form.password"
        :placeholder="t('login.passwordPlaceholder')"
        :show-password="true"
        clearable
        type="password"
      />
    </el-form-item>

    <el-form-item :label="t('login.code')" prop="captchaValue">
      <input-captcha v-model="form" :placeholder="t('login.codePlaceholder')" style="width: 100%" />
    </el-form-item>

    <el-form-item>
      <div class="flex justify-between items-center w-[100%]">
        <el-checkbox v-model="remember" :label="t('login.remember')" size="small" />
        <el-link :underline="false" type="primary"> {{ t('login.forgetPassword') }}</el-link>
      </div>
    </el-form-item>

    <el-form-item>
      <div class="w-[100%]">
        <el-button :loading="loading" class="w-[100%]" type="primary" @click="signIn(formRef)">
          {{ t('login.login') }}
        </el-button>
      </div>
      <div v-if="siteInfo?.props?.userReg" class="w-[100%] mt-15px">
        <el-button class="w-[100%]" @click="toRegister"> {{ t('login.noUser') }}</el-button>
      </div>
    </el-form-item>

    <el-form-item style="display: none">
      <el-divider content-position="center">其它登录方式</el-divider>

      <div class="flex justify-between w-[100%]">
        <Icon
          :color="iconColor"
          :hoverColor="hoverColor"
          :size="iconSize"
          class="cursor-pointer ant-icon"
          icon="ant-design:github-filled"
        />
        <Icon
          :color="iconColor"
          :hoverColor="hoverColor"
          :size="iconSize"
          class="cursor-pointer ant-icon"
          icon="ant-design:wechat-filled"
        />
        <Icon
          :color="iconColor"
          :hoverColor="hoverColor"
          :size="iconSize"
          class="cursor-pointer ant-icon"
          icon="ant-design:alipay-circle-filled"
        />
        <Icon
          :color="iconColor"
          :hoverColor="hoverColor"
          :size="iconSize"
          class="cursor-pointer ant-icon"
          icon="ant-design:weibo-circle-filled"
        />
      </div>
    </el-form-item>
  </el-form>
</template>

<script lang="tsx" setup>
import { computed, ref, unref, watch } from 'vue'
import { useI18n } from '@/hooks/web/useI18n'
import { useAppStore } from '@/store/modules/app'
import { useUserStore } from '@/store/modules/user'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useRouter } from 'vue-router'
import { useValidator } from '@/hooks/web/useValidator'
import { Icon } from '@/components/Icon'
import { UserLoginType } from '@/api/login/types'
import { FormInstance } from 'element-plus'
import InputCaptcha from '@/components/InputCaptcha/src/InputCaptcha.vue'

const { required } = useValidator()
const emit = defineEmits(['to-register'])

const appStore = useAppStore()
const userStore = useUserStore()
const { currentRoute, replace } = useRouter()
const { t } = useI18n()

const siteInfo = computed(() => appStore.getSiteInfo)

const form = ref<UserLoginType>({
  userName: '',
  password: '',
  captchaKey: '',
  captchaValue: ''
})
const formRef = ref<FormInstance>()

const rules = {
  username: [required()],
  password: [required()],
  captchaValue: [required()]
}
const iconSize = 30
const remember = ref(false)
const loading = ref(false)
const iconColor = '#999'
const hoverColor = 'var(--el-color-primary)'
const redirect = ref<string>('')

watch(
  () => currentRoute.value,
  (route: RouteLocationNormalizedLoaded) => {
    redirect.value = route?.query?.redirect as string
  },
  {
    immediate: true
  }
)

// 登录
const signIn = async (formEl: FormInstance | undefined) => {
  if (!formEl) return
  await formEl?.validate((isValid) => {
    if (isValid) {
      loading.value = true
      const formData = unref(form)

      userStore
        .login(formData)
        .then(() => {
          loading.value = false

          console.log('登录了？')

          // 跳转到记录页面或首页
          replace(redirect.value || '/')
        })
        .catch(() => {
          loading.value = false
        })
    }
  })
}

// 去注册页面
const toRegister = () => {
  emit('to-register')
}
</script>
