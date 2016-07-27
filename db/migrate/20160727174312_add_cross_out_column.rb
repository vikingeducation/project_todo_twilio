class AddCrossOutColumn < ActiveRecord::Migration
  def change
    add_column :tasks, :cross_out, :boolean, :default => false
  end
end
