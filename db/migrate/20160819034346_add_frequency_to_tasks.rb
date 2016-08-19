class AddFrequencyToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :frequency, :integer, :default => 0 
  end
end
