class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :description
      t.date :completion

      t.timestamps null: false
    end
  end
end
