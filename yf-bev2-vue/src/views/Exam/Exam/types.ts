export type ExamType = {
  id?: string
  title?: string
  content?: string
  startTime?: string
  endTime?: string
  qualifyScore: number
  totalScore?: number
  totalTime?: number
  chance?: number
  lateMax?: number
  handMin?: number
  ruleList?: ExamRuleType[]
  repoId?: string
}

export type ExamRuleType = {
  id?: string
  examId?: string
  repoId?: string
  quType?: string
  quCount?: number
  quScore?: number
}
