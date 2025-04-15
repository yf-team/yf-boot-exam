import request from '@/config/axios'

export const saveApi = (data: any) => {
  return request.post({
    url: '/api/exam/repo/repo/save',
    data
  })
}

export const detailApi = (data: any) => {
  return request.post({
    url: '/api/exam/repo/repo/detail',
    data
  })
}

export const pagingApi = (data: any) => {
  return request.post({
    url: '/api/exam/repo/repo/paging',
    data
  })
}

export const statApi = (data: any) => {
  return request.post({
    url: '/api/exam/repo/repo/list-stat',
    data
  })
}
