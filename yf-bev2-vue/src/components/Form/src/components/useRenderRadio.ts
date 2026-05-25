import { h } from 'vue'
import { FormSchema, ComponentNameEnum, RadioGroupComponentProps } from '../types'
import { ElRadio, ElRadioButton } from 'element-plus'

export const useRenderRadio = () => {
  const renderRadioOptions = (item: FormSchema) => {
    const componentProps = item?.componentProps as RadioGroupComponentProps
    const valueAlias = componentProps?.props?.value || 'value'
    const labelAlias = componentProps?.props?.label || 'label'
    const disabledAlias = componentProps?.props?.disabled || 'disabled'
    const Com = item.component === ComponentNameEnum.RADIO_GROUP ? ElRadio : ElRadioButton
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
    renderRadioOptions
  }
}
