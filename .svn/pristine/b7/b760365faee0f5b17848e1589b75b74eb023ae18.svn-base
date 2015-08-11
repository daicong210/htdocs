class Department < ActiveRecord::Base
  include Redmine::SafeAttributes

  #attr_accessible :leader, :name, :parent_id, :position, :project_id
  belongs_to :project
  has_many :department_members,:dependent => :destroy

  acts_as_tree :dependent => :nullify
  acts_as_list :scope => '(project_id = #{project_id} AND parent_id #{parent_id ? "= #{parent_id}" : "IS NULL"})'
  acts_as_watchable

  validates_presence_of :name #, :description
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 30
  #validates_length_of :description, :maximum => 255
  validate :validate_department

  safe_attributes 'name', 'parent_id', 'move_to'

  def reload(*args)
    @valid_parents = nil
    super
  end

  def valid_parents
    @valid_parents ||= project.departments - self_and_descendants
  end

  protected

  def validate_department
    if parent_id && parent_id_changed?
      errors.add(:parent_id, :invalid) unless valid_parents.include?(parent)
    end
  end
  def self.department_tree(depts, parent_id=nil, level=0)
    tree = []
    depts.select {|dept| dept.parent_id == parent_id}.sort_by(&:position).each do |dept|
      tree << [dept, level]
      tree += department_tree(depts, dept.id, level+1)
    end
    if block_given?
      tree.each do |dept, level|
        yield dept, level
      end
    end
    tree
  end
end
