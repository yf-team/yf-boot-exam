import { h } from 'vue'
import type { RouteMeta } from 'vue-router'
import { Icon } from '@/components/Icon'
import { useI18n } from '@/hooks/web/useI18n'

export const useRenderMenuTitle = () => {
  const renderMenuTitle = (meta: RouteMeta) => {
    const { t } = useI18n()
    const { title = 'Please set title', icon } = meta

    const text = h('span', { class: 'v-menu__title' }, t(title as string))

    return icon ? [h(Icon, { icon: meta.icon }), text] : text
  }

  return {
    renderMenuTitle
  }
}
