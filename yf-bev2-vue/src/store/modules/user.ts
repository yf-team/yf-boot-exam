import { defineStore } from 'pinia'
import { store } from '@/store'
import { apiLogin, apiRegister, routesApi } from '@/api/login'
import { UserLoginType } from '@/api/login/types'
import { useStorage } from '@/hooks/web/useStorage'

const { getStorage, setStorage, removeStorage } = useStorage()

export interface UserState {
  userInfo: UserInfoTypes
}

export const useUserStore = defineStore('userInfo', {
  state: (): UserState => ({
    userInfo: getStorage('userInfo')
  }),
  getters: {
    getUserInfo(): UserInfoTypes {
      return this.userInfo
    }
  },
  actions: {
    // 用户登录
    login(data?: UserLoginType): Promise<unknown> {
      return new Promise<void>((resolve, reject) => {
        // 注册用户
        apiLogin(data)
          .then(async (res) => {
            await this.setUserInfo(res.data)
            await this.generateRoutes()
            resolve(res.data)
          })
          .catch((err) => {
            reject(err)
          })
      })
    },

    // 用户注册
    register(data?: UserLoginType): Promise<unknown> {
      return new Promise<void>((resolve, reject) => {
        // 注册用户
        apiRegister(data)
          .then(async (res) => {
            await this.setUserInfo(res.data)
            await this.generateRoutes()
            resolve(res.data)
          })
          .catch((err) => {
            reject(err)
          })
      })
    },
    // 保存用户状态
    setUserInfo(data?: UserInfoTypes) {
      if (data && data.token) {
        this.userInfo = data
        setStorage('userInfo', this.userInfo)
      } else {
        this.userInfo = {}
        removeStorage('userInfo')
      }
    },

    // 构建路由并跳转首页
    async generateRoutes() {
      const res = await routesApi({})
      if (res) {
        // 将路由存入缓存，交由权限构建
        const routers = res.data || []
        setStorage('roleRouters', routers)
      }
    }
  }
})

export const useUserStoreWithOut = () => {
  return useUserStore(store)
}
