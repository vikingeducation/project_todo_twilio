class AddStickyToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :sticky, :boolean, default: false
  end
end
