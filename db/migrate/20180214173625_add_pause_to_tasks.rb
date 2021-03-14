class AddPauseToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :paused, :boolean, default: false
  end
end
