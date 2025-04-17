import request from '@/config/axios'

export const saveApi = (data: any) => {
  return request.post({
    url: '/api/exam/exam/exam/save',
    data
  })
}

export const detailApi = (data: any) => {
  return request.post({
    url: '/api/exam/exam/exam/detail',
    data
  })
}

export const detailForExamApi = (data: any) => {
  return request.post({
    url: '/api/exam/exam/exam/detail-for-exam',
    data
  })
}
