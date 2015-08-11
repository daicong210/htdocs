#encoding:utf-8
class PerformanceSubject < ActiveRecord::Base
  attr_accessible :performance_id, :aim, :assessment, :comment, :leader_mark, :priority_id, :score, :subject, :subject_type
  validates_presence_of :subject
  validate :validate_performance_id, :validate_score

  def initialize(attributes=nil, *args)
    super
    if new_record?
      # set default values for new records only
      self.priority_id ||= 3 #高
    end
  end
  def validate_performance_id
      if performance_id.nil? then
        errors.add :performance_id, :invalid
      end
  end

  def validate_score
    if !score.blank?
      if score<=0
        errors.add :score, ":配分不能小于0!"
      end

      if !leader_mark.blank?  and score < leader_mark
          errors.add :score, ":评分不能大于配分!"
      end
      if  subject_type == 1 then
        if  score>80
          errors.add :score, ":配分不能超过80!"
        end
      end
      if  subject_type == 2 and score>20 then
        errors.add :score, ":配分不能超过20!"
      end
    else
      if !leader_mark.blank?
        errors.add :score, ":配分不能为空!"
      end
    end
  end
end
