class ChangeTitleFormatInTasks < ActiveRecord::Migration
  def up
    change_column :tasks, :title, :string
  end

  def down
    change_column :task, :title, :text
  end
end
