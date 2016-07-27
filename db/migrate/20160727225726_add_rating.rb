class AddRating < ActiveRecord::Migration
  def change
    add_column :tasks, :rating, :integer
  end
end
