// prettier.config.js
module.exports = {
  // 基础配置
  printWidth: 200, // 每行最大代码量
  tabWidth: 2, // 缩进空格数
  useTabs: false, // 使用空格代替tab缩进
  semi: false, // 结尾是否添加分号
  singleQuote: true, // 使用单引号
  quoteProps: 'as-needed', // 对象属性引号处理(as-needed/preserve)
  jsxSingleQuote: false, // JSX中使用双引号
  trailingComma: 'es5', // 多行时尾随逗号 (es5/none/all)
  bracketSpacing: true, // 对象括号空格 { foo: bar }
  bracketSameLine: false, // 将HTML闭合标签放在最后一行的末尾
  htmlWhitespaceSensitivity: 'ignore', // 忽略HTML空白敏感度
  arrowParens: 'always', // 箭头函数参数括号 (always/avoid)
  endOfLine: 'lf', // 换行符类型 (lf/crlf/auto)

  // Vue 文件特殊配置
  vueIndentScriptAndStyle: false, // 不缩进Vue文件中的<script>和<style>标签内容
  singleAttributePerLine: false, // 保持多个属性在一行

  // 覆盖不同文件类型的配置
  overrides: [
    {
      files: '*.vue',
      options: {
        parser: 'vue',
        htmlWhitespaceSensitivity: 'ignore'
      }
    },
    {
      files: '*.ts',
      options: {
        parser: 'typescript'
      }
    },
    {
      files: '*.tsx',
      options: {
        parser: 'typescript'
      }
    },
    {
      files: '*.json',
      options: {
        parser: 'json',
        tabWidth: 2
      }
    }
  ]
}
