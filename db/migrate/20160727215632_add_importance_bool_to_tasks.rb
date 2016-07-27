class AddImportanceBoolToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :importance, :boolean, :default => false
  end
end
