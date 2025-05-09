// 用户对象
export type RepoDataType = {
  id?: string
  title?: string
  catId?: string
}

// 试题对象
export type QuDataType = {
  id?: string
  title?: string
  quType?: string
  repoId?: string
  difficultyLevel?: string
  content?: string
  analysis?: string
  answerList?: AnswerDataType[]
}

// 选项
export type AnswerDataType = {
  id?: string
  isRight?: boolean
  content?: string
}
