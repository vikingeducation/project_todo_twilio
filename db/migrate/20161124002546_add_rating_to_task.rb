class AddRatingToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :rating, :integer, default: 2
  end
end
