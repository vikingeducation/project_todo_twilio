class DefaultValueCompletedCol < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :completed, :boolean, :default => false
  end
end
