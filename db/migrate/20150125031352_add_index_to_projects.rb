class AddIndexToProjects < ActiveRecord::Migration
  def change
    add_index :projects, :due_date
  end
end
