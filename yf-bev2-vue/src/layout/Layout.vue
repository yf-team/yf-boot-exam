<template>
  <section :class="[prefixCls, `${prefixCls}__${layout}`, 'w-[100%] h-[100%] relative']">
    <div
      v-if="mobile && !collapse"
      class="absolute top-0 left-0 w-full h-full opacity-30 z-99 bg-[var(--el-color-black)]"
      @click="handleClickOutside"
    ></div>
    <LayoutClassic v-if="layout === 'classic'" />
    <LayoutTopLeft v-else-if="layout === 'topLeft'" />
    <LayoutTop v-else-if="layout === 'top'" />
    <LayoutClassic v-else />
    <Setting />
  </section>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useAppStore } from '@/store/modules/app'
import { Setting } from '@/components/Setting'
import { useDesign } from '@/hooks/web/useDesign'
import LayoutClassic from './components/LayoutClassic.vue'
import LayoutTopLeft from './components/LayoutTopLeft.vue'
import LayoutTop from './components/LayoutTop.vue'

const { getPrefixCls } = useDesign()
const prefixCls = getPrefixCls('layout')

const appStore = useAppStore()

const mobile = computed(() => appStore.getMobile)
const collapse = computed(() => appStore.getCollapse)
const layout = computed(() => appStore.getLayout)

const handleClickOutside = () => {
  appStore.setCollapse(true)
}
</script>

<style lang="less" scoped>
@prefix-cls: ~'@{namespace}-layout';

.@{prefix-cls} {
  background-color: var(--app-content-bg-color);
  :deep(.@{elNamespace}-scrollbar__view) {
    height: 100% !important;
  }
}
</style>
