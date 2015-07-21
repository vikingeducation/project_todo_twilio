class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :goal
      t.datetime :completion_date

      t.timestamps null: false
    end
  end
end
