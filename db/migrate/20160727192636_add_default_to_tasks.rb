class AddDefaultToTasks < ActiveRecord::Migration[5.0]
  def change
    change_column_default :tasks, :soft_delete, false
  end
end
