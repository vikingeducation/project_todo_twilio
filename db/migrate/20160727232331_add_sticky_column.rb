class AddStickyColumn < ActiveRecord::Migration
  def change
    add_column :tasks, :sticky, :boolean, default: false
  end
end
