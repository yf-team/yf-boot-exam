import request from '@/config/axios'

export const createApi = (data: any) => {
  return request.post({
    url: '/api/exam/paper/paper/create',
    data
  })
}

// 查找答题卡信息
export const quCardApi = (data: any) => {
  return request.post({
    url: '/api/exam/paper/qu/list-card',
    data
  })
}

// 查找详情用于答题
export const quDetailApi = (data: any) => {
  return request.post({
    url: '/api/exam/paper/qu/detail-for-answer',
    data
  })
}

// 交卷操作
export const handApi = (data: any) => {
  return request.post({
    url: '/api/exam/paper/paper/hand',
    data
  })
}

// 答题操作
export const fillAnswerApi = (data: any) => {
  return request.post({
    url: '/api/exam/paper/qu/fill-answer',
    data
  })
}
