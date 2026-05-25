<template>
  <div
    :class="[
      'flex items-center justify-between bg-[var(--top-header-bg-color)] relative',
      { 'layout-border__bottom': !tagsView }
    ]"
  >
    <Logo v-if="logo" class="custom-hover" />
    <Menu class="flex-1 px-10px h-[var(--top-tool-height)]" />
    <ToolHeader />
  </div>
  <div
    :class="[
      `${prefixCls}-content`,
      'w-full',
      {
        'h-[calc(100%-var(--app-footer-height))]': !fixedHeader,
        'h-[calc(100%-var(--tags-view-height)-var(--app-footer-height))]': fixedHeader
      }
    ]"
  >
    <ElScrollbar
      v-loading="pageLoading"
      :class="[
        `${prefixCls}-content-scrollbar`,
        {
          'mt-[var(--tags-view-height)] !pb-[calc(var(--tags-view-height)+var(--app-footer-height))]':
            fixedHeader,
          'pb-[var(--app-footer-height)]': !fixedHeader
        }
      ]"
    >
      <TagsView
        v-if="tagsView"
        :class="[
          'layout-border__bottom layout-border__top relative',
          {
            '!fixed w-full top-[calc(var(--top-tool-height)+1px)] left-0': fixedHeader
          }
        ]"
        style="
          transition:
            width var(--transition-time-02),
            left var(--transition-time-02);
        "
      />
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
const logo = computed(() => appStore.getLogo)
const pageLoading = computed(() => appStore.getPageLoading)
const fixedHeader = computed(() => appStore.getFixedHeader)
const tagsView = computed(() => appStore.getTagsView)
</script>
