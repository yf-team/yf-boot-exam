import { h } from 'vue'
import { ElSubMenu, ElMenuItem } from 'element-plus'
import { hasOneShowingChild } from '../helper'
import { useRenderMenuTitle } from './useRenderMenuTitle'
import { useDesign } from '@/hooks/web/useDesign'
import { pathResolve } from '@/utils/routerHelper'

const { renderMenuTitle } = useRenderMenuTitle()

export const useRenderMenuItem = (menuMode: 'vertical' | 'horizontal') => {
  const renderMenuItem = (routers: AppRouteRecordRaw[]): any[] => {
    return routers.map((v) => {
      const meta = v.meta ?? {}
      if (!meta.hidden) {
        const { oneShowingChild, onlyOneChild } = hasOneShowingChild(v.children, v)
        const fullPath = v.path

        if (
          oneShowingChild &&
          (!onlyOneChild?.children || onlyOneChild?.noShowingChildren) &&
          !meta?.alwaysShow
        ) {
          const index = onlyOneChild ? pathResolve(fullPath, onlyOneChild.path) : fullPath
          return h(
            ElMenuItem,
            { index },
            {
              default: () => renderMenuTitle(onlyOneChild ? onlyOneChild?.meta : meta)
            }
          )
        } else {
          const { getPrefixCls } = useDesign()
          const preFixCls = getPrefixCls('menu-popper')
          const popperClass =
            menuMode === 'vertical' ? `${preFixCls}--vertical` : `${preFixCls}--horizontal`

          return h(
            ElSubMenu,
            { index: fullPath, popperClass },
            {
              title: () => renderMenuTitle(meta),
              default: () => renderMenuItem(v.children!)
            }
          )
        }
      }
    })
  }

  return {
    renderMenuItem
  }
}
