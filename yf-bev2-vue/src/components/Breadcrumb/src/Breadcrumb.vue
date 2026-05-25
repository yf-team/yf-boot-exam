<template>
  <ElBreadcrumb separator="/" :class="`${prefixCls} flex items-center h-full ml-[10px]`">
    <TransitionGroup appear enter-active-class="animate__animated animate__fadeInRight">
      <ElBreadcrumbItem
        v-for="v in breadcrumbList"
        :key="v.name"
        :to="{ path: disabledMap[v.name || ''] ? '' : v.path }"
      >
        <Icon v-if="v.meta?.icon && breadcrumbIcon" :icon="v.meta.icon" class="mr-[5px]" />
        {{ t(v.meta?.title || '') }}
      </ElBreadcrumbItem>
    </TransitionGroup>
  </ElBreadcrumb>
</template>

<script setup lang="ts">
import { ElBreadcrumb, ElBreadcrumbItem } from 'element-plus'
import { ref, watch, computed, unref } from 'vue'
import { useRouter } from 'vue-router'
import { usePermissionStore } from '@/store/modules/permission'
import { filterBreadcrumb } from './helper'
import { filter, treeToList } from '@/utils/tree'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useI18n } from '@/hooks/web/useI18n'
import { Icon } from '@/components/Icon'
import { useAppStore } from '@/store/modules/app'
import { useDesign } from '@/hooks/web/useDesign'

const { getPrefixCls } = useDesign()

const prefixCls = getPrefixCls('breadcrumb')

const appStore = useAppStore()

const breadcrumbIcon = computed(() => appStore.getBreadcrumbIcon)

const { currentRoute } = useRouter()

const { t } = useI18n()

const levelList = ref<AppRouteRecordRaw[]>([])

const permissionStore = usePermissionStore()

const menuRouters = computed(() => {
  const routers = permissionStore.getRouters
  return filterBreadcrumb(routers)
})

const disabledMap = computed(() => {
  const list = treeToList<AppRouteRecordRaw[]>(unref(levelList))
  const map: Record<string, boolean> = {}
  list.forEach((v) => {
    map[v.name || ''] = !v.redirect || v.redirect === 'noredirect'
  })
  return map
})

const breadcrumbList = computed(() => {
  return treeToList<AppRouteRecordRaw[]>(unref(levelList))
})

const getBreadcrumb = () => {
  const currentPath = currentRoute.value.matched.slice(-1)[0].path
  levelList.value = filter<AppRouteRecordRaw>(unref(menuRouters), (node: AppRouteRecordRaw) => {
    return node.path === currentPath
  })
}

watch(
  () => currentRoute.value,
  (route: RouteLocationNormalizedLoaded) => {
    if (route.path.startsWith('/redirect/')) {
      return
    }
    getBreadcrumb()
  },
  {
    immediate: true
  }
)
</script>

<style lang="less" scoped>
@prefix-cls: ~'@{elNamespace}-breadcrumb';

.@{prefix-cls} {
  :deep(&__item) {
    display: flex;
    .@{prefix-cls}__inner {
      display: flex;
      align-items: center;
      color: var(--top-header-text-color);

      &:hover {
        color: var(--el-color-primary);
      }
    }
  }

  :deep(&__item):not(:last-child) {
    .@{prefix-cls}__inner {
      color: var(--top-header-text-color);

      &:hover {
        color: var(--el-color-primary);
      }
    }
  }

  :deep(&__item):last-child {
    .@{prefix-cls}__inner {
      color: var(--el-text-color-placeholder);

      &:hover {
        color: var(--el-text-color-placeholder);
      }
    }
  }
}
</style>
