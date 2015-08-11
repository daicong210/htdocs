#encoding:utf-8
module DepartmentsHelper

  def departments_options_for_select(depts)
    options = []
    Department.department_tree(depts) do |dept, level|
      label = (level > 0 ? '&nbsp;' * 2 * level + '&#187; ' : '').html_safe
      label << dept.name
      options << [label, dept.id]
    end
    options
  end

  #获取用户全名
  def get_user_full_name(member)
    if member.blank? or member.user.blank? then
      return "无名"
    end
    return "#{member.user.name}"
  end

  #判断是否是领导
  def user_is_leader?(member)
    if member.blank? or member.leader.blank? then
      return false
    end
    member.leader
  end

  #获取部门领导姓名
  def get_leaders_name(dept)
    if dept.blank? then
      return ""
    end
    options = []
    department_members = dept.department_members.find_all_by_leader("1")
    if department_members.any? then
      department_members.each do |member|
        options<<"#{member.user.name}"
      end
    end
    options
    #options.collect(&:to_s).join(', ')
  end

  def leaders_name(dept)
    options = get_leaders_name(dept)
    html_em = ""
    if options.any? then
      options.each do|name|
        html_em +="<span class = 'icon icon-leader' >#{name}</span>&nbsp&nbsp"
      end
    end
    html_em
  end

  def class_for_dept(level)
    if level >3 then
      level = 3
    end
    "icon icon-dept#{level}"
  end

  def rank_radio_button_for_select(member)
    leader = false
    if !member.blank? and !member.leader.blank? then
      leader = true
    end
     [{:id=>1,:name=>"主管",:checked=>leader ? true:false},{:id=>0,:name=>"员工",:checked=>leader ? false:true}]
  end

  #获取部门的直属子部门
  def get_department_sub(id)
    sub_departments =[]
    #所有下级部门
    if id.blank? then
      return sub_departments
    end
    tmp = Department.find_all_by_parent_id(id)
    if tmp.any? then
      sub_departments = sub_departments|tmp
      tmp.each do |value|
        sub_departments = sub_departments|get_department_sub(value.id)
      end
    end
    return sub_departments
  end
end
