class AddPinnedToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :pinned, :boolean
  end
end
