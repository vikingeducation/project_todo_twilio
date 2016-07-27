class AddColumnToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :soft_delete, :boolean
  end
end
