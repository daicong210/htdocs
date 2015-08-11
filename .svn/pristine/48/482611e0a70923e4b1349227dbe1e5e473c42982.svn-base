class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :department_member_id
      t.integer :status
      t.date :date
      t.text :self_assessment
      t.text :leader_assessment
      t.integer :leader_mark
      t.string :leader_rating

      t.timestamps
    end
  end
end
