class AddTitleToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :title, :text
  end
end
