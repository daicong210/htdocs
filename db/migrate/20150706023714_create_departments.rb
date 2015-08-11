class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :project_id,:null=>false
      t.integer :members_count, :default => 0, :null => false
      t.string :name,:null=>false
      t.integer :parent_id
      t.integer :position,:default => 1

      t.timestamps
    end
  end
end
