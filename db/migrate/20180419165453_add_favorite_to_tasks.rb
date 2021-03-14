class AddFavoriteToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :favorite, :boolean, default: false
  end
end
