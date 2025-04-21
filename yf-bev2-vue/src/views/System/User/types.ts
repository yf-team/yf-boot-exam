// 实体对象
export type RoleDataType = {
  id?: string
  roleName?: string
  dataScope?: string
  roleLevel?: string
}

// 用户对象
export type UserDataType = {
  id?: string
  userName?: string
  realName?: string
  deptCode?: string
  deptCode_dictText?: string
  roles?: string[]
  mobile?: string
  idCard?: string
  avatar?: string
  password?: string
  email?: string
}

// 改密对象
export type PassDataType = {
  oldPass?: string
  newPass?: string
  confirmPass?: string
}
