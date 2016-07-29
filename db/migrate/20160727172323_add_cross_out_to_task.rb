class AddCrossOutToTask < ActiveRecord::Migration
  def change
    add_column :tasks ,:crossed_out, :boolean, default: false
  end
end
