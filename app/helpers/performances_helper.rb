#encoding:utf-8
include DepartmentsHelper
module PerformancesHelper
  PerformancesStatus = %w(新建 审批 确认 归档)
  RatingOptions = [[],["S-优秀","S"],["A-良好","A"],["B-合格","B"],["C-基本合格","C"],["D-不合格","D"]]
  #获取当前部门下属
  def get_members_options(department_id)
    if department_id.blank?
      return nil
    end
    department_users = DepartmentMember.find_all_by_department_id(department_id)
    department_users.map{|c|
      if c.user_id then
        user = User.find_by_id(c.user_id)
        if user then
          ["#{user.name}",user.id]
        end
      end
    }
  end
  #获取所有下属
  def get_sub_members_options(department_id)
    user = User.current
    if department_id == nil then
      return nil
    end
    if  user.blank? || user.id.blank? ||department_id.blank? then
      return nil
    else
      department_user = DepartmentMember.find_by_user_id(user.id)
      if department_user.blank? || department_user.department_id.blank? then
        return nil
      end
      options =[]
      options=options|get_members_options(department_id)
      sub_departments = get_department_sub(department_user.department_id)
      sub_departments.each do|value|
        options = options|get_members_options(value.id)
      end
      options
    end
  end

  def users_for_performance_options(department_member)
      options = []
      id,name = get_current_user_name
      options<<[name,id]
      if department_member.blank? or !department_member.leader then
        return options
      end
      get_sub_members_options(department_member.department_id)
  end

  def rating_options
    RatingOptions
  end

  def get_rating(rating)
    option = RatingOptions.select{|x| x[1]=="#{rating}"}
    if option.empty?
       ""
    else
      option[0][0]
    end
  end

  #获取状态选项
  def get_performance_status_options(performance)
    options = []
    if performance.blank? then
      return options
    end
    leader = performance.department_member.leader
    my = performance.user_id == User.current.id
    status = performance.status

    if User.current.admin? or !can_modify_performance(performance)
      PerformancesStatus.each_index {|x| options<<[PerformancesStatus[x],x] }
      return options
    end

    #非当前用户（主管属下）
    if !my then
      options = [["新建",0],["审批",1],["确认",2]]
    else
      options = [["新建",0],["审批",1]]
    end
    return options
  end
  #获取绩效状态
  def get_performance_status(performance)
    if performance.blank? || performance.status.blank? then
      return "无状态"
    end
    PerformancesStatus[performance.status]
  end
  #获取月份

  #获取评级
  def get_performance_rating(performance)
    if performance.blank? || performance.leader_rating.blank? then
      return ""
    end
    get_rating performance.leader_rating
  end
  #获取部门
  def get_performance_department_name(performance)
    if performance.blank? || performance.department_member_id.blank? then
      return "无部门"
    end
    department_member = DepartmentMember.find_by_id(performance.department_member_id)
    if department_member.blank? || department_member.department_id.blank? then
      return "无部门"
    end
    department = Department.find_by_id(department_member.department_id)
    department.name
  end
  #获取成员
  def get_performance_user_name(user_id)
    if user_id.blank? then
      return "无名"
    end
    user = User.find_by_id(user_id)
    "#{user.name}"
  end
  #获取日期
  def get_performance_date_month(performance)
    if performance.blank? || performance.date.blank? then
      return "无"
    end
    performance.date.strftime("%y年%m月")
  end
  #获取某个用户的所属部门信息
  def get_user_department(project_id, user_id)
    if project_id.blank? || user_id.blank? then
      return nil
    end
    DepartmentMember.find_by_sql("select * from department_members where department_id in(select id from departments where project_id = #{project_id}) and user_id = #{user_id}")
  end
  #是否能够修改
  def can_modify_performance(performance,project=nil)
    if User.current.admin? or User.current.allowed_to?(:archive_performances,  project)
      return  true
    end
    if performance.blank? then
      return false
    end
    my = performance.user_id == User.current.id
    leader = performance.department_member.leader
    status = performance.status
    #归档之后 都不允许修改
    if status == 3 or status == 2 then
      return false
    end
    # if leader then #领导
    #   return true
    # else#非领导
      if my then
        if status ==0 then
          return true
        else
          if leader then
            return true
          else
            return false
          end
        end
      else
        return true
      end
    # end
  end

  def performance_can_delete?(performance)
    if performance.blank? then
      return true
    end
    status = performance.status
    if status == 3 then
      return false
    else
      return true
    end
  end

  def get_performances_lsit(project=nil)
     if User.current.admin? or User.current.allowed_to?(:archive_performances, project)
       return Performance.find_by_sql("select * from #{Performance.table_name} ORDER by date desc")
     end
     department_member = DepartmentMember.find_by_user_id(User.current.id)
     if department_member.blank?
       return nil
     end
     sql = "select * from #{Performance.table_name} where user_id = #{User.current.id} ORDER by date desc"
     list = Performance.find_by_sql(sql)

     #是领导就显示所有下属成员的
     if department_member.leader? then
       options = get_sub_members_options(department_member.department_id)
       options.each do|value|
         performances = Performance.find_by_sql("select * from #{Performance.table_name} where user_id = #{value[1]} ORDER by date desc")
         #if !performances.blank? then
         list= list|performances
         #end
       end
     end
     list
  end
end
