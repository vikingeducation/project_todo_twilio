class AddSoftDeleteFlag < ActiveRecord::Migration
  def change
    add_column(:tasks, :soft_delete_flag, :boolean)
    change_column_default(:tasks, :soft_delete_flag, false)
  end
end
