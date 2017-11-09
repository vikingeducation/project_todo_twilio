class AddStartedOnToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :started_on, :date
  end
end
