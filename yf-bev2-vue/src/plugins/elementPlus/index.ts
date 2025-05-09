import type { App } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'

// 引入图标
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

// 全局引入ElementPlus
export const setupElementPlus = (app: App) => {
  // 全局引入
  app.use(ElementPlus, { locale: zhCn })

  // 全局引入图标
  for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
  }
}
