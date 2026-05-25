<template>
  <div
    :id="`${variables.namespace}-tool-header`"
    :class="[
      prefixCls,
      'h-[var(--top-tool-height)] relative px-[var(--top-tool-p-x)] flex items-center justify-between',
      'dark:bg-[var(--el-bg-color)]'
    ]"
  >
    <div v-if="layout !== 'top'" class="h-full flex items-center">
      <Collapse v-if="hamburger" class="custom-hover" color="var(--top-header-text-color)" />
      <Breadcrumb v-if="breadcrumb" class="<md:hidden" />
    </div>
    <div class="h-full flex items-center">
      <Screenfull v-if="screenfull" class="custom-hover" color="var(--top-header-text-color)" />
      <SizeDropdown v-if="size" class="custom-hover" color="var(--top-header-text-color)" />
      <LocaleDropdown v-if="locale" class="custom-hover" color="var(--top-header-text-color)" />
      <UserInfo />
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { Collapse } from '@/components/Collapse'
import { LocaleDropdown } from '@/components/LocaleDropdown'
import { SizeDropdown } from '@/components/SizeDropdown'
import { UserInfo } from '@/components/UserInfo'
import { Screenfull } from '@/components/Screenfull'
import { Breadcrumb } from '@/components/Breadcrumb'
import { useAppStore } from '@/store/modules/app'
import { useDesign } from '@/hooks/web/useDesign'

const { getPrefixCls, variables } = useDesign()

const prefixCls = getPrefixCls('tool-header')

const appStore = useAppStore()

const breadcrumb = computed(() => appStore.getBreadcrumb)
const hamburger = computed(() => appStore.getHamburger)
const screenfull = computed(() => appStore.getScreenfull)
const size = computed(() => appStore.getSize)
const layout = computed(() => appStore.getLayout)
const locale = computed(() => appStore.getLocale)
</script>

<style lang="less" scoped>
@prefix-cls: ~'@{namespace}-tool-header';

.@{prefix-cls} {
  transition: left var(--transition-time-02);
}
</style>
