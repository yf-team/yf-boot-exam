<template>
  <div
    class="absolute top-0 left-0 h-full layout-border__right"
    :class="{ '!fixed z-3000': mobile }"
  >
    <Logo
      v-if="logo"
      :class="[
        'bg-[var(--left-menu-bg-color)] relative',
        {
          '!pl-0': mobile && collapse,
          'w-[var(--left-menu-min-width)]': appStore.getCollapse,
          'w-[var(--left-menu-max-width)]': !appStore.getCollapse
        }
      ]"
      style="transition: all var(--transition-time-02)"
    />
    <Menu :class="{ '!h-[calc(100%-var(--logo-height))]': logo }" />
  </div>
  <div
    :class="[
      `${prefixCls}-content`,
      'absolute top-0 h-[100%]',
      {
        'w-[calc(100%-var(--left-menu-min-width))] left-[var(--left-menu-min-width)]':
          collapse && !mobile,
        'w-[calc(100%-var(--left-menu-max-width))] left-[var(--left-menu-max-width)]':
          !collapse && !mobile,
        'fixed !w-full !left-0': mobile
      }
    ]"
    style="transition: all var(--transition-time-02)"
  >
    <ElScrollbar
      v-loading="pageLoading"
      :class="[
        `${prefixCls}-content-scrollbar`,
        {
          '!h-[calc(100%-var(--top-tool-height)-var(--tags-view-height))] mt-[calc(var(--top-tool-height)+var(--tags-view-height))]':
            fixedHeader
        }
      ]"
    >
      <div
        :class="{
          'fixed top-0 left-0 z-10': fixedHeader,
          'w-[calc(100%-var(--left-menu-min-width))] !left-[var(--left-menu-min-width)]':
            collapse && fixedHeader && !mobile,
          'w-[calc(100%-var(--left-menu-max-width))] !left-[var(--left-menu-max-width)]':
            !collapse && fixedHeader && !mobile,
          '!w-full !left-0': mobile
        }"
        style="transition: all var(--transition-time-02)"
      >
        <ToolHeader
          :class="['bg-[var(--top-header-bg-color)]', { 'layout-border__bottom': !tagsView }]"
        />
        <TagsView v-if="tagsView" class="layout-border__bottom layout-border__top" />
      </div>
      <AppView />
      <Backtop />
    </ElScrollbar>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useAppStore } from '@/store/modules/app'
import { useDesign } from '@/hooks/web/useDesign'
import { Logo } from '@/components/Logo'
import { Menu } from '@/components/Menu'
import ToolHeader from './ToolHeader.vue'
import { TagsView } from '@/components/TagsView'
import AppView from './AppView.vue'
import { Backtop } from '@/components/Backtop'

const { getPrefixCls } = useDesign()
const prefixCls = getPrefixCls('layout')

const appStore = useAppStore()
const mobile = computed(() => appStore.getMobile)
const collapse = computed(() => appStore.getCollapse)
const logo = computed(() => appStore.getLogo)
const pageLoading = computed(() => appStore.getPageLoading)
const fixedHeader = computed(() => appStore.getFixedHeader)
const tagsView = computed(() => appStore.getTagsView)
</script>
