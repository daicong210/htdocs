class CreatePerformanceSubjects < ActiveRecord::Migration
  def change
    create_table :performance_subjects do |t|
      t.integer :performance_id
      t.string :subject
      t.integer :priority_id
      t.string :aim
      t.string :comment
      t.string :assessment
      t.integer :score
      t.integer :leader_mark
      t.integer :subject_type

      t.timestamps
    end
  end
end
