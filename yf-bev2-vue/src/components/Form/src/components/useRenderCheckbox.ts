import { h } from 'vue'
import { FormSchema, ComponentNameEnum, CheckboxGroupComponentProps } from '../types'
import { ElCheckbox, ElCheckboxButton } from 'element-plus'

export const useRenderCheckbox = () => {
  const renderCheckboxOptions = (item: FormSchema) => {
    const componentProps = item?.componentProps as CheckboxGroupComponentProps
    const valueAlias = componentProps?.props?.value || 'value'
    const labelAlias = componentProps?.props?.label || 'label'
    const disabledAlias = componentProps?.props?.disabled || 'disabled'
    const Com = item.component === ComponentNameEnum.CHECKBOX_GROUP ? ElCheckbox : ElCheckboxButton
    return componentProps?.options?.map((option) => {
      const { ...other } = option
      return h(Com, {
        ...other,
        disabled: option[disabledAlias || 'disabled'],
        label: option[labelAlias || 'label'],
        value: option[valueAlias || 'value']
      })
    })
  }

  return {
    renderCheckboxOptions
  }
}
