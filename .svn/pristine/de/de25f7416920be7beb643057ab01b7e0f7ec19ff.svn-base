class CreateDepartmentMembers < ActiveRecord::Migration
  def change
    create_table :department_members do |t|
      t.integer :department_id
      t.integer :user_id
      t.boolean :leader ,:default => false, :null => false

      t.timestamps
    end
  end
end
