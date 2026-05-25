import { h } from 'vue'
import { ElOption, ElOptionGroup } from 'element-plus'
import { FormSchema, SelectComponentProps, SelectOption } from '../types'

export const useRenderSelect = () => {
  const renderSelectOptions = (item: FormSchema) => {
    const componentsProps = item?.componentProps as SelectComponentProps
    const labelAlias = componentsProps?.props?.label
    const keyAlias = componentsProps?.props?.key
    return componentsProps?.options?.map((option) => {
      if (option?.options?.length) {
        return h(
          ElOptionGroup,
          { label: option[labelAlias || 'label'], key: option[keyAlias || 'key'] },
          {
            default: () =>
              option?.options?.map((v) => {
                return renderSelectOptionItem(item, v)
              })
          }
        )
      } else {
        return renderSelectOptionItem(item, option)
      }
    })
  }

  const renderSelectOptionItem = (item: FormSchema, option: SelectOption) => {
    const componentsProps = item.componentProps as SelectComponentProps
    const labelAlias = componentsProps?.props?.label
    const valueAlias = componentsProps?.props?.value
    const keyAlias = componentsProps?.props?.key

    return h(ElOption, {
      ...option,
      key: option[keyAlias || 'key'],
      label: option[labelAlias || 'label'],
      value: option[valueAlias || 'value']
    })
  }

  return {
    renderSelectOptions
  }
}
