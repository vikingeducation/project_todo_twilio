class AddDisabledToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :disabled, :boolean, default: false
  end
end
