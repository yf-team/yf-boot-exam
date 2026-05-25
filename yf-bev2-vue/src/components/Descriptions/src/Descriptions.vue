<script lang="ts">
import { ElCollapseTransition, ElDescriptions, ElDescriptionsItem, ElTooltip } from 'element-plus'
import { useDesign } from '@/hooks/web/useDesign'
import { propTypes } from '@/utils/propTypes'
import { ref, unref, PropType, computed, defineComponent, h } from 'vue'
import { useAppStore } from '@/store/modules/app'
import type { DescriptionsSchema } from './types'
import { Icon } from '@/components/Icon'
import { get } from 'lodash-es'

const appStore = useAppStore()

const mobile = computed(() => appStore.getMobile)

const { getPrefixCls } = useDesign()

const prefixCls = getPrefixCls('descriptions')

export default defineComponent({
  name: 'Descriptions',
  props: {
    title: propTypes.string.def(''),
    message: propTypes.string.def(''),
    collapse: propTypes.bool.def(true),
    border: propTypes.bool.def(true),
    column: propTypes.number.def(2),
    size: propTypes.oneOf(['large', 'default', 'small'] as const).def('default'),
    direction: propTypes.oneOf(['horizontal', 'vertical'] as const).def('horizontal'),
    extra: propTypes.string.def(''),
    schema: {
      type: Array as PropType<DescriptionsSchema[]>,
      default: () => []
    },
    data: {
      type: Object as PropType<any>,
      default: () => ({})
    }
  },
  setup(props, { slots, attrs }) {
    const getBindValue = computed((): any => {
      const delArr: string[] = ['title', 'message', 'collapse', 'schema', 'data', 'class']
      const obj = { ...attrs, ...props }
      for (const key in obj) {
        if (delArr.indexOf(key) !== -1) {
          delete obj[key]
        }
      }
      if (unref(mobile)) {
        obj.direction = 'vertical'
      }
      return obj
    })

    const getBindItemValue = (item: DescriptionsSchema) => {
      const delArr: string[] = ['field']
      const obj = { ...item }
      for (const key in obj) {
        if (delArr.indexOf(key) !== -1) {
          delete obj[key]
        }
      }
      return obj
    }

    const show = ref(true)

    const toggleClick = () => {
      if (props.collapse) {
        show.value = !unref(show)
      }
    }

    return () => {
      return h(
        'div',
        {
          class: [
            prefixCls,
            'bg-[var(--el-color-white)] dark:bg-[var(--el-bg-color)] dark:border-[var(--el-border-color)] dark:border-1px'
          ]
        },
        [
          props.title
            ? h(
                'div',
                {
                  class: [
                    `${prefixCls}-header`,
                    'relative h-50px flex justify-between items-center layout-border__bottom px-10px cursor-pointer'
                  ],
                  onClick: toggleClick
                },
                [
                  h(
                    'div',
                    {
                      class: [`${prefixCls}-header__title`, 'relative font-18px font-bold ml-10px']
                    },
                    [
                      h('div', { class: 'flex items-center' }, [
                        props.title,
                        props.message
                          ? h(
                              ElTooltip,
                              { content: props.message, placement: 'right' },
                              {
                                default: () =>
                                  h(Icon, {
                                    icon: 'bi:question-circle-fill',
                                    class: 'ml-5px',
                                    size: 14
                                  })
                              }
                            )
                          : null
                      ])
                    ]
                  ),
                  props.collapse
                    ? h(Icon, { icon: show.value ? 'ep:arrow-down' : 'ep:arrow-up' })
                    : null
                ]
              )
            : null,

          h(ElCollapseTransition, null, {
            default: () =>
              h(
                'div',
                {
                  style: { display: unref(show) ? '' : 'none' },
                  class: [`${prefixCls}-content`, 'p-20px']
                },
                [
                  h(ElDescriptions, unref(getBindValue), {
                    extra: () => (slots['extra'] ? slots['extra']() : props.extra),
                    default: () => {
                      return props.schema.map((item) => {
                        return h(ElDescriptionsItem, getBindItemValue(item), {
                          label: () => (item.slots?.label ? item.slots?.label(item) : item.label),
                          default: () =>
                            item.slots?.default
                              ? item.slots?.default(props.data)
                              : get(props.data, item.field)
                        })
                      })
                    }
                  })
                ]
              )
          })
        ]
      )
    }
  }
})
</script>

<style lang="less" scoped>
@prefix-cls: ~'@{namespace}-descriptions';

:deep(.@{elNamespace}-descriptions__header) {
  display: none !important;
}

.@{prefix-cls}-header {
  &__title {
    &::after {
      position: absolute;
      top: 3px;
      left: -10px;
      width: 4px;
      height: 70%;
      background: var(--el-color-primary);
      content: '';
    }
  }
}

.@{prefix-cls}-content {
  :deep(.@{elNamespace}-descriptions__cell) {
    width: 0;
  }
}
</style>
