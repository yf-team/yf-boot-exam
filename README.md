# **云帆考试系统-v2版**

![Static Badge](https://img.shields.io/badge/Springboot-3.0-red)
![Static Badge](https://img.shields.io/badge/Vue-3.0-yellow)
![Static Badge](https://img.shields.io/badge/License-MIT-blue)



# 项目简介
秉承一贯的开源理念，云帆考试系统在原有旧项目的基础上（旧版移步：[https://gitee.com/vandc/yf-exam-lite](https://gitee.com/vandc/yf-exam-lite)）再次升级，本次升级不管是从后端还是前台，都采用全新的技术栈来开发；后端采用Java17+SpringBoot3.0，前端使用Vue3.0+TypeScript+ElementPlus；项目实现了前后端的完整考试流程，基础功能组件完善可用，便于同学们对前瞻技术的体验和学习研究，感谢关注本项目！  


# 技术栈
后端：Java17 + SpringBoot3.0 + Shiro + MyBatisPlus + Swagger3  
前端：Vue3.0 + TypeScript + ElementPlus + Vite   


# 自带功能  
###管理端  
1.菜单管理：功能菜单及权限相关控制、通过角色权限动态加载到前端页面，构建路由；  
2.角色管理：定义角色关联的菜单及功能、实现动态权限管理；  
3.数据字典：分为数据字典和分类字典，分类字典支持多级树结构；  
4.个性配置：设置网站名称、登录页面图标、后台图标、登录踢出机制、注册开关等内容；  
5.插件管理：目前有本地上传插件，后续打算做更多有用的插件，实现一键集成到系统；  
6.部门管理：定义部门信息、支持多级树结构；  
7.人员管理：即用户管理、系统的管理用户学员用户都在此处维护；  
8.资料修改：用户自行维护信息、如姓名、头像等上传；  
9.密码安全：用户修改密码；  
10.考试管理：维护考试信息、考试出题组卷策略、考试记录查看等；  
11.题库管理：题库基本信息、题库统计概览；  
12.试题管理：挂载于题库中，维护试题信息，试题支持单选题、多选题、判断题、不定项选择题；  

## 学员端  
1.在线考试：列出学员可以考试的列表、进入考试、考试答题、交卷等完善的考试流程；  
2.考试记录：列出考试记录及通过情况、考试明细等；  
3.资料修改：用户自行维护信息、如姓名、头像等上传；  
4.密码安全：用户修改密码；  

# 在线体验  
体验地址： [https://be2.yfhl.net](https://be2.yfhl.net)  
体验账号：admin/admin（管理员）  student/student（学员）  
官网网站： [https://www.yfhl.net](https://www.yfhl.net)    
QQ交流群：757328773  

> 特别说明：体验地址如果不能访问或无法登录，请联系我们    

 

# 商业咨询  

> 商业版本是开源的动力和支持，如果您需要商业版本，请联系我们  

联系人：郭经理  
手机号：18603038204  
微信号：gyh_yinzi    
![联系我们](https://cdn.yfhl.net/be2/q_dora.png)    



# 使用简介

## 后端说明

1. **开发工具**  
   - 后端开发使用 IntelliJ IDEA  
2. **JDK 版本要求**  
   - 项目基于 JDK 17（理论上也兼容 JDK 21）  
   - 推荐使用 **Zulu JDK**  
     下载地址：https://www.azul.com/downloads/#zulu  

## 前端说明
1. **开发工具**  
   - 后端开发使用WebStrom    
2. **Node版本要求**  
   - 作者开发环境node版本为： v23.4.0，配套npm版本为：10.9.2  

```she
# 开发环境node版本
node -v
v23.4.0
# 开发环境npm版本
npm -v
10.9.2
```

> node版本和npm版需对应，避免出现奇奇怪怪的问题；如果无法解决，尝试卸载干净全部重新安装  



前端编译常用命令  

```shell  
# 使用npm安装pnpm(如果没有的话)  
npm install pnpm -g  
# 编译整个项目  
pnpm install  
# 运行开发模式  
pnpm run dev  
# 打包项目（打包好的目录为dist-pro）  
pnpm run build:pro 
```



### 启动与访问  

1. **快速启动（新手适用）**  
   - 前端文件已预编译并集成到后端 `resources/static` 目录中，无需额外配置。  
   - 启动后端服务后，直接访问 [http://localhost:8080](http://localhost:8080/) 即可运行完整项目。   
2. **进阶部署（前后端分离）**  
   - 熟悉项目后若需分离部署，直接删除 `resources/static` 目录即可。  

### 接口文档    

- 项目内置 **Swagger 3.0**，启动后可通过以下地址访问接口文档：  
  http://localhost:8080/doc.html  



------



# 系统截图
![系统截图](https://cdn.yfhl.net/be2/s1.png)    
![系统截图](https://cdn.yfhl.net/be2/s2.png)   
![系统截图](https://cdn.yfhl.net/be2/s3.png)   
![系统截图](https://cdn.yfhl.net/be2/s4.png)   
![系统截图](https://cdn.yfhl.net/be2/s5.png)   
![系统截图](https://cdn.yfhl.net/be2/s6.png)   
![系统截图](https://cdn.yfhl.net/be2/s7.png)   
![系统截图](https://cdn.yfhl.net/be2/s8.png)   