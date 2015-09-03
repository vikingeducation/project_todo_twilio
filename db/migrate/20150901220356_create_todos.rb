class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :event
      t.text :note
      t.string :timedate

      t.timestamps null: false
    end
  end
end
