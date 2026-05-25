<template>
  <div class="text-right h-28px flex items-center justify-end">
    <ElTooltip :content="t('common.refresh')" placement="top">
      <span @click="refresh">
        <Icon
          icon="ant-design:sync-outlined"
          class="cursor-pointer"
          hover-color="var(--el-color-primary)"
        />
      </span>
    </ElTooltip>

    <ElTooltip :content="t('common.size')" placement="top">
      <ElDropdown trigger="click" @command="changSize">
        <span>
          <Icon
            icon="ant-design:column-height-outlined"
            class="cursor-pointer mr-8px ml-8px"
            hover-color="var(--el-color-primary)"
          />
        </span>
        <template #dropdown>
          <ElDropdownMenu>
            <ElDropdownItem v-for="v in sizeMap" :key="v" :command="v">
              {{ t(`size.${v}`) }}
            </ElDropdownItem>
          </ElDropdownMenu>
        </template>
      </ElDropdown>
    </ElTooltip>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { ElTooltip, ElDropdown, ElDropdownMenu, ElDropdownItem, ComponentSize } from 'element-plus'
import { Icon } from '@/components/Icon'
import { useI18n } from '@/hooks/web/useI18n'
import { useAppStore } from '@/store/modules/app'

const appStore = useAppStore()
const sizeMap = computed(() => appStore.sizeMap)

const { t } = useI18n()

const emit = defineEmits<{
  (e: 'refresh'): void
  (e: 'changSize', size: ComponentSize): void
}>()

const refresh = () => {
  emit('refresh')
}

const changSize = (size: ComponentSize) => {
  emit('changSize', size)
}
</script>
