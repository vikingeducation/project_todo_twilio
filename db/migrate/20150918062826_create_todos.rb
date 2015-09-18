class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :value
      t.datetime :due

      t.timestamps null: false
    end
  end
end
