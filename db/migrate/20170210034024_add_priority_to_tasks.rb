class AddPriorityToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :importance, :integer
    change_column :tasks, :deadline, :datetime
  end
end
