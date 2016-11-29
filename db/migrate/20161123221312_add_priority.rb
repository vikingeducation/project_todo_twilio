class AddPriority < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :priority, :integer, :default => 0 
  end
end
