#encoding:utf-8

module PerformanceSubjectsHelper
  def subject_type_options(type=nil)
    if type ==1.to_s then
      [["关键绩效",1]]
    elsif type == 2.to_s
      [["团队精神",2]]
    else
      [["关键绩效",1],["团队精神",2]]
    end
  end
  def get_subjiect_type_name(id)
    if id == 1 then
       "关键绩效"
    elsif id==2then
       "团队精神"
    else
       "无法识别"
    end
  end
  def get_priority_name(priority_id)
    if priority_id.blank?
      return ""
    end
    priority = IssuePriority.find_by_id(priority_id)
    if priority.blank?
      return ""
    end
    priority.name
  end
  def get_key_socre
    80
  end
  def get_add_socre
    20
  end

  def get_score_max(performance_id,type)
    sum = PerformanceSubject.find_by_sql("select sum(score) from #{PerformanceSubject.table_name} where performance_id=#{performance_id} and subject_type = #{type}")
    if sum.blank? or sum[0]['sum(score)'].blank?  then
      sum = 0
    else
      sum = sum[0]['sum(score)']
    end
    score = get_key_socre
    if type.to_s == 2.to_s then
      score = get_add_socre
    end
    if sum  > score
       0
    else
      score - sum
    end
  end
  def get_leader_mark_sum(performance_id)
    if performance_id.blank?
      return 0
    end
    sum = PerformanceSubject.find_by_sql("select sum(leader_mark) from #{PerformanceSubject.table_name} where performance_id=#{performance_id} ")
    if sum.blank? then
      return 0
    end
    sum[0]['sum(leader_mark)'].to_i
  end
  def can_modify_score?
    if User.current.department_member and User.current.department_member.leader? then
      return  true
    end
    false
  end
end
