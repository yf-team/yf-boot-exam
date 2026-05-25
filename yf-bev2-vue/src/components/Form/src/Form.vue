<script lang="ts">
import { PropType, defineComponent, ref, computed, unref, watch, onMounted, h } from 'vue'
import { ElForm, ElFormItem, ElRow, ElCol, FormRules, ComponentSize } from 'element-plus'
import { componentMap } from './helper/componentMap'
import { propTypes } from '@/utils/propTypes'
import { getSlot } from '@/utils/tsxHelper'
import {
  setTextPlaceholder,
  setGridProp,
  setComponentProps,
  setItemComponentSlots,
  initModel
} from './helper'
import { useRenderSelect } from './components/useRenderSelect'
import { useRenderRadio } from './components/useRenderRadio'
import { useRenderCheckbox } from './components/useRenderCheckbox'
import { useDesign } from '@/hooks/web/useDesign'
import { findIndex } from '@/utils'
import { get, set } from 'lodash-es'
import { FormProps } from './types'
import {
  FormSchema,
  FormSetProps,
  ComponentNameEnum,
  SelectComponentProps,
  RadioGroupComponentProps,
  CheckboxGroupComponentProps
} from './types'

const { renderSelectOptions } = useRenderSelect()
const { renderRadioOptions } = useRenderRadio()
const { renderCheckboxOptions } = useRenderCheckbox()

const { getPrefixCls } = useDesign()

const prefixCls = getPrefixCls('form')

export default defineComponent({
  name: 'Form',
  props: {
    schema: {
      type: Array as PropType<FormSchema[]>,
      default: () => []
    },
    isCol: propTypes.bool.def(true),
    model: {
      type: Object as PropType<any>,
      default: () => ({})
    },
    autoSetPlaceholder: propTypes.bool.def(true),
    isCustom: propTypes.bool.def(false),
    labelWidth: propTypes.oneOfType([String, Number]).def('auto'),
    rules: {
      type: Object as PropType<FormRules>,
      default: () => ({})
    },
    labelPosition: propTypes.oneOf(['left', 'right', 'top'] as const).def('right'),
    labelSuffix: propTypes.string.def(''),
    hideRequiredAsterisk: propTypes.bool.def(false),
    requireAsteriskPosition: propTypes.oneOf(['left', 'right'] as const).def('left'),
    showMessage: propTypes.bool.def(true),
    inlineMessage: propTypes.bool.def(false),
    statusIcon: propTypes.bool.def(false),
    validateOnRuleChange: propTypes.bool.def(true),
    size: {
      type: String as PropType<ComponentSize>,
      default: undefined
    },
    disabled: propTypes.bool.def(false),
    scrollToError: propTypes.bool.def(false),
    scrollToErrorOffset: propTypes.oneOfType([Boolean, Object]).def(undefined)
  },
  emits: ['register'],
  setup(props, { slots, expose, emit }) {
    const elFormRef = ref<ComponentRef<typeof ElForm>>()
    const mergeProps = ref<FormProps>({})
    const formComponents = ref({})
    const formItemComponents = ref({})
    const formModel = ref<Recordable>(props.model)

    const getProps = computed(() => {
      const propsObj = { ...props }
      Object.assign(propsObj, unref(mergeProps))
      return propsObj
    })

    onMounted(() => {
      emit('register', unref(elFormRef)?.$parent, unref(elFormRef))
    })

    const setValues = (data: Recordable = {}) => {
      formModel.value = Object.assign(unref(formModel), data)
    }

    const setProps = (props: FormProps = {}) => {
      mergeProps.value = Object.assign(unref(mergeProps), props)
    }

    const delSchema = (field: string) => {
      const { schema } = unref(getProps)
      const index = findIndex(schema, (v: FormSchema) => v.field === field)
      if (index > -1) {
        schema.splice(index, 1)
      }
    }

    const addSchema = (formSchema: FormSchema, index?: number) => {
      const { schema } = unref(getProps)
      if (index !== void 0) {
        schema.splice(index, 0, formSchema)
        return
      }
      schema.push(formSchema)
    }

    const setSchema = (schemaProps: FormSetProps[]) => {
      const { schema } = unref(getProps)
      for (const v of schema) {
        for (const item of schemaProps) {
          if (v.field === item.field) {
            set(v, item.path, item.value)
          }
        }
      }
    }

    const getOptions = async (fn: Function, item: FormSchema) => {
      const options = await fn()
      if (!options || options.length == 0) return
      setSchema([
        {
          field: item.field,
          path:
            item.component === ComponentNameEnum.TREE_SELECT ||
            item.component === ComponentNameEnum.TRANSFER
              ? 'componentProps.data'
              : 'componentProps.options',
          value: options
        }
      ])
    }

    const getComponentExpose = (filed: string) => {
      return unref(formComponents)[filed]
    }

    const getFormItemExpose = (filed: string) => {
      return unref(formItemComponents)[filed]
    }

    const setComponentRefMap = (el: any, filed: string) => {
      formComponents.value[filed] = el
    }

    const setFormItemRefMap = (el: any, filed: string) => {
      formItemComponents.value[filed] = el
    }

    expose({
      setValues,
      formModel,
      setProps,
      delSchema,
      addSchema,
      setSchema,
      getComponentExpose,
      getFormItemExpose
    })

    watch(
      () => unref(getProps).schema,
      (schema = []) => {
        formModel.value = initModel(schema, unref(formModel))
      },
      {
        immediate: true,
        deep: true
      }
    )

    const renderFormItem = (item: FormSchema) => {
      if (
        item.optionApi &&
        (!item.componentProps?.options || !item.componentProps?.options.length)
      ) {
        getOptions(item.optionApi, item)
      }

      const formItemSlots: Recordable = {
        default: () => {
          if (item?.formItemProps?.slots?.default) {
            return item?.formItemProps?.slots?.default(formModel.value)
          } else {
            const Com = componentMap[item.component as string] as ReturnType<typeof defineComponent>
            const { autoSetPlaceholder } = unref(getProps)
            const componentSlots = (item?.componentProps as any)?.slots || {}
            const slotsMap: Recordable = {
              ...setItemComponentSlots(componentSlots)
            }

            if (item.component === ComponentNameEnum.SELECT) {
              slotsMap.default = !componentSlots.default
                ? () => renderSelectOptions(item)
                : () =>
                    componentSlots.default(
                      unref((item?.componentProps as SelectComponentProps)?.options)
                    )
            }

            if (item.component === ComponentNameEnum.SELECT_V2 && componentSlots.default) {
              slotsMap.default = ({ item }: any) => componentSlots.default(item)
            }

            if (
              item.component === ComponentNameEnum.RADIO_GROUP ||
              item.component === ComponentNameEnum.RADIO_BUTTON
            ) {
              slotsMap.default = !componentSlots.default
                ? () => renderRadioOptions(item)
                : () =>
                    componentSlots.default(
                      unref((item?.componentProps as CheckboxGroupComponentProps)?.options)
                    )
            }

            if (
              item.component === ComponentNameEnum.CHECKBOX_GROUP ||
              item.component === ComponentNameEnum.CHECKBOX_BUTTON
            ) {
              slotsMap.default = !componentSlots.default
                ? () => renderCheckboxOptions(item)
                : () =>
                    componentSlots.default(
                      unref((item?.componentProps as RadioGroupComponentProps)?.options)
                    )
            }

            const itemVal = computed({
              get: () => get(formModel.value, item.field),
              set: (val) => set(formModel.value, item.field, val)
            })

            const componentProps = {
              ref: (el: any) => setComponentRefMap(el, item.field),
              ...(autoSetPlaceholder && setTextPlaceholder(item)),
              ...setComponentProps(item),
              style: item.componentProps?.style || { width: '100%' }
            }

            if (item.component === ComponentNameEnum.UPLOAD) {
              return h(
                Com,
                {
                  modelValue: unref(itemVal),
                  'onUpdate:modelValue': (val: any) => {
                    itemVal.value = val
                  },
                  ...componentProps
                },
                { ...slotsMap }
              )
            }

            return h(
              Com,
              {
                modelValue: unref(itemVal),
                'onUpdate:modelValue': (val: any) => {
                  itemVal.value = val
                },
                ...componentProps
              },
              { ...slotsMap }
            )
          }
        }
      }

      if (item?.formItemProps?.slots?.label) {
        formItemSlots.label = (...args: any[]) => {
          return (item?.formItemProps?.slots as any)?.label(...args)
        }
      }
      if (item?.formItemProps?.slots?.error) {
        formItemSlots.error = (...args: any[]) => {
          return (item?.formItemProps?.slots as any)?.error(...args)
        }
      }

      return h(
        ElFormItem,
        {
          style: { display: item.hidden ? 'none' : '' },
          ref: (el: any) => setFormItemRefMap(el, item.field),
          ...(item.formItemProps || {}),
          prop: item.field,
          label: item.label || ''
        },
        formItemSlots
      )
    }

    const renderFormItemWrap = () => {
      const { schema = [], isCol } = unref(getProps)

      return schema
        .filter((v) => !v.remove)
        .map((item) => {
          const isDivider = item.component === 'Divider'
          const Com = componentMap['Divider'] as ReturnType<typeof defineComponent>
          if (isDivider) {
            return h(
              Com,
              {
                contentPosition: 'left',
                ...item.componentProps
              },
              { default: () => item?.label }
            )
          }
          if (isCol) {
            return h(ElCol, setGridProp(item.colProps), {
              default: () => renderFormItem(item)
            })
          }
          return renderFormItem(item)
        })
    }

    const renderWrap = () => {
      const { isCol } = unref(getProps)
      return isCol
        ? h(ElRow, { gutter: 20 }, { default: () => renderFormItemWrap() })
        : renderFormItemWrap()
    }

    const getFormBindValue = () => {
      const delKeys = ['schema', 'isCol', 'autoSetPlaceholder', 'isCustom', 'model']
      const p = { ...unref(getProps) }
      for (const key in p) {
        if (delKeys.indexOf(key) !== -1) {
          delete p[key]
        }
      }
      return p as FormProps
    }

    return () => {
      const { isCustom } = unref(getProps)
      return h(
        ElForm,
        {
          ref: elFormRef,
          ...getFormBindValue(),
          model: isCustom ? unref(getProps).model : unref(formModel),
          class: prefixCls,
          onSubmit: (e: Event) => {
            e.preventDefault()
          }
        },
        {
          default: () => (isCustom ? getSlot(slots, 'default') : renderWrap())
        }
      )
    }
  }
})
</script>

<style lang="less" scoped>
.@{elNamespace}-form.@{adminNamespace}-form .@{elNamespace}-row {
  margin-right: 0 !important;
  margin-left: 0 !important;
}

.@{elNamespace}-form--inline {
  :deep(.el-form-item__content) {
    & > :first-child {
      min-width: 229.5px;
    }
  }
  .@{elNamespace}-input-number {
    min-width: 229.5px;
  }
}
</style>
