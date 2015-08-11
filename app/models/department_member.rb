class DepartmentMember < ActiveRecord::Base
  include Redmine::SafeAttributes
  belongs_to :department
  belongs_to :user, :foreign_key => 'user_id'
  has_many :performances, :dependent => :destroy, :foreign_key =>'department_member_id'

  safe_attributes 'user_id', 'department_id'
end
