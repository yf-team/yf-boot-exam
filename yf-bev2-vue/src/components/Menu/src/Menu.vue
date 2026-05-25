<script lang="ts">
import { computed, defineComponent, unref, PropType, h } from 'vue'
import { ElMenu, ElScrollbar } from 'element-plus'
import { useAppStore } from '@/store/modules/app'
import { usePermissionStore } from '@/store/modules/permission'
import { useRenderMenuItem } from './components/useRenderMenuItem'
import { useRouter } from 'vue-router'
import { isUrl } from '@/utils/is'
import { useDesign } from '@/hooks/web/useDesign'

const { getPrefixCls } = useDesign()

const prefixCls = getPrefixCls('menu')

export default defineComponent({
  name: 'Menu',
  props: {
    menuSelect: {
      type: Function as PropType<(index: string) => void>,
      default: undefined
    }
  },
  setup(props) {
    const appStore = useAppStore()

    const layout = computed(() => appStore.getLayout)

    const { push, currentRoute } = useRouter()

    const permissionStore = usePermissionStore()

    const menuMode = computed((): 'vertical' | 'horizontal' => {
      const vertical: LayoutType[] = ['classic', 'topLeft']
      if (vertical.includes(unref(layout))) {
        return 'vertical'
      } else {
        return 'horizontal'
      }
    })

    const routers = computed(() => permissionStore.getRouters)

    const collapse = computed(() => appStore.getCollapse)

    const uniqueOpened = computed(() => appStore.getUniqueOpened)

    const activeMenu = computed(() => {
      const { meta, path } = unref(currentRoute)
      if (meta.activeMenu) {
        return meta.activeMenu as string
      }
      return path
    })

    const menuSelect = (index: string) => {
      if (props.menuSelect) {
        props.menuSelect(index)
      }
      if (isUrl(index)) {
        window.open(index)
      } else {
        push(index)
      }
    }

    const renderMenuWrap = () => {
      if (unref(layout) === 'top') {
        return renderMenu()
      } else {
        return h(ElScrollbar, null, { default: () => renderMenu() })
      }
    }

    const renderMenu = () => {
      return h(
        ElMenu,
        {
          defaultActive: unref(activeMenu),
          mode: unref(menuMode),
          collapse: unref(layout) === 'top' ? false : unref(collapse),
          uniqueOpened: unref(layout) === 'top' ? false : unref(uniqueOpened),
          backgroundColor: 'var(--left-menu-bg-color)',
          textColor: 'var(--left-menu-text-color)',
          activeTextColor: 'var(--left-menu-text-active-color)',
          onSelect: menuSelect
        },
        {
          default: () => {
            const { renderMenuItem } = useRenderMenuItem(unref(menuMode))
            return renderMenuItem(unref(routers))
          }
        }
      )
    }

    return () =>
      h(
        'div',
        {
          id: prefixCls,
          class: [
            `${prefixCls} ${prefixCls}__${unref(menuMode)}`,
            'h-[100%] overflow-hidden flex-col bg-[var(--left-menu-bg-color)]',
            {
              'w-[var(--left-menu-min-width)]': unref(collapse),
              'w-[var(--left-menu-max-width)]': !unref(collapse)
            }
          ]
        },
        renderMenuWrap()
      )
  }
})
</script>

<style lang="less" scoped>
@prefix-cls: ~'@{namespace}-menu';

.@{prefix-cls} {
  position: relative;
  transition: width var(--transition-time-02);

  :deep(.@{elNamespace}-menu) {
    width: 100% !important;
    border-right: none;

    .is-active {
      & > .@{elNamespace}-sub-menu__title {
        color: var(--left-menu-text-active-color) !important;
      }
    }

    .@{elNamespace}-sub-menu__title,
    .@{elNamespace}-menu-item {
      &:hover {
        color: var(--left-menu-text-active-color) !important;
        background-color: var(--left-menu-bg-color) !important;
      }
    }

    .@{elNamespace}-sub-menu.is-active,
    .@{elNamespace}-menu-item.is-active {
      color: var(--left-menu-text-active-color) !important;
      background-color: var(--left-menu-bg-active-color) !important;

      &:hover {
        background-color: var(--left-menu-bg-active-color) !important;
      }
    }

    .@{elNamespace}-menu-item.is-active {
      position: relative;
    }

    .@{elNamespace}-menu {
      .@{elNamespace}-sub-menu__title,
      .@{elNamespace}-menu-item:not(.is-active) {
        background-color: var(--left-menu-bg-light-color) !important;
      }

      .@{elNamespace}-menu-item.is-active {
        background-color: transparent !important;

        &:hover {
          background-color: transparent !important;
        }
      }
    }
  }

  :deep(.@{elNamespace}-menu--collapse) {
    width: var(--left-menu-min-width);

    & > .is-active,
    & > .is-active > .@{elNamespace}-sub-menu__title {
      position: relative;
      background-color: var(--left-menu-collapse-bg-active-color) !important;
    }
  }

  :deep(.horizontal-collapse-transition) {
    .@{prefix-cls}__title {
      display: none;
    }
  }

  &__horizontal {
    height: calc(~'var(--top-tool-height)') !important;

    :deep(.@{elNamespace}-menu--horizontal) {
      height: calc(~'var(--top-tool-height)');
      border-bottom: none;

      & > .@{elNamespace}-sub-menu.is-active {
        .@{elNamespace}-sub-menu__title {
          border-bottom-color: var(--el-color-primary) !important;
        }
      }

      .@{elNamespace}-menu-item.is-active {
        position: relative;

        &:after {
          display: none !important;
        }
      }

      .@{prefix-cls}__title {
        max-height: calc(~'var(--top-tool-height) - 2px') !important;
        line-height: calc(~'var(--top-tool-height) - 2px');
      }
    }
  }
}
</style>

<style lang="less">
@prefix-cls: ~'@{namespace}-menu-popper';

.@{prefix-cls}--vertical,
.@{prefix-cls}--horizontal {
  .is-active {
    & > .el-sub-menu__title {
      color: var(--left-menu-text-active-color) !important;
    }
  }

  .el-sub-menu__title,
  .el-menu-item {
    &:hover {
      color: var(--left-menu-text-active-color) !important;
      background-color: var(--left-menu-bg-color) !important;
    }
  }

  .el-menu-item.is-active {
    position: relative;
    color: var(--left-menu-text-active-color) !important;
  }
}
</style>
