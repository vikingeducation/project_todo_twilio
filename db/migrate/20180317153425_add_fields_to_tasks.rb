class AddFieldsToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :url, :string, default: ''
    add_column :tasks, :description, :text, default: ''
  end
end
