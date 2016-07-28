class AddRatingToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :rating, :integer, :default => 0
  end
end
