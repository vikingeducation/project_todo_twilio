class AddColumnToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :completion_date, :date
  end
end
