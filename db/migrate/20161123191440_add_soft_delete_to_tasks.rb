class AddSoftDeleteToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :soft_delete, :bool
  end
end
