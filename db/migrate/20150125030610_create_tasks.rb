class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title
      t.datetime :due_date

      t.timestamps null: false
    end
  end
end
