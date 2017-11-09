class AddCategoryIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :category, foreign_key: true
  end
end
