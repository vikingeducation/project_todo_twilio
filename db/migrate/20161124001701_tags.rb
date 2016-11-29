class Tags < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :tags, :string
  end
end
