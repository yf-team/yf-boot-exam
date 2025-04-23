import request from '@/config/axios'

export const saveApi = (data: any) => {
  return request.post({
    url: '/api/sys/user/save',
    data
  })
}

export const detailApi = (data: any) => {
  return request.post({
    url: '/api/sys/user/detail',
    data
  })
}

// 获取当前用户信息
export const infoApi = (data: any) => {
  return request.post({
    url: '/api/sys/user/info',
    data
  })
}

// 用户修改信息
export const updateApi = (data: any) => {
  return request.post({
    url: '/api/sys/user/update',
    data
  })
}

// 修改密码
export const passApi = (data: any) => {
  return request.post({
    url: '/api/sys/user/update-pass',
    data
  })
}
