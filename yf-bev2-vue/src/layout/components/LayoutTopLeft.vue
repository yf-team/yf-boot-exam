<template>
  <div
    class="flex items-center bg-[var(--top-header-bg-color)] relative layout-border__bottom dark:bg-[var(--el-bg-color)]"
  >
    <Logo v-if="logo" class="custom-hover" />
    <ToolHeader class="flex-1" />
  </div>
  <div
    class="absolute top-[var(--logo-height)+1px] left-0 w-full h-[calc(100%-1px-var(--logo-height))] flex"
  >
    <Menu class="!h-full relative layout-border__right" />
    <div
      :class="[
        `${prefixCls}-content`,
        'h-[100%]',
        {
          'w-[calc(100%-var(--left-menu-min-width))] left-[var(--left-menu-min-width)]': collapse,
          'w-[calc(100%-var(--left-menu-max-width))] left-[var(--left-menu-max-width)]': !collapse
        }
      ]"
      style="transition: all var(--transition-time-02)"
    >
      <ElScrollbar
        v-loading="pageLoading"
        :class="[
          `${prefixCls}-content-scrollbar`,
          {
            '!h-[calc(100%-var(--tags-view-height))] mt-[calc(var(--tags-view-height))]':
              fixedHeader && tagsView
          }
        ]"
      >
        <TagsView
          v-if="tagsView"
          :class="[
            'layout-border__bottom absolute',
            {
              '!fixed top-0 left-0 z-10': fixedHeader,
              'w-[calc(100%-var(--left-menu-min-width))] !left-[var(--left-menu-min-width)] mt-[calc(var(--logo-height)+1px)]':
                collapse && fixedHeader,
              'w-[calc(100%-var(--left-menu-max-width))] !left-[var(--left-menu-max-width)] mt-[calc(var(--logo-height)+1px)]':
                !collapse && fixedHeader
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
const collapse = computed(() => appStore.getCollapse)
const logo = computed(() => appStore.getLogo)
const pageLoading = computed(() => appStore.getPageLoading)
const fixedHeader = computed(() => appStore.getFixedHeader)
const tagsView = computed(() => appStore.getTagsView)
</script>
