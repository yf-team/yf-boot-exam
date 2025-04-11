import request from '@/config/axios'

export const saveApi = (data: any) => {
  return request.post({
    url: '/api/exam/repo/qu/save',
    data
  })
}

export const detailApi = (data: any) => {
  return request.post({
    url: '/api/exam/repo/qu/detail',
    data
  })
}
